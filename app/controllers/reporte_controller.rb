class ReporteController < HomeController
  def index
    @reporteCantidadPacientesPorTipoSangre = cantidadPacientePorTipeoSangrePorZonaGeografica("2022-05-26", "2022-05-31", 10, 1)
    @reporteCantidadPacientesPorTipoSangre.each do |e|
      puts(e.nombre_departamento)
      puts(e.nombre_municipio)
      puts(e.nombre_tipo_sangre)
      puts(e.cantidad)
    end
  end

  def cantidadPacientePorTipeoSangrePorZonaGeografica(fechaInicio, fechaFin, idDepartamento, idMunicipio)
    @cantidadPacientesPorTipoSangre = ""
    @consultaSQL = "select d.nombre_departamento, m.nombre_municipio , p.tipo_sangre_id, ts.nombre_tipo_sangre, count(p.id) cantidad  from pacientes p
      inner join tipo_sangres ts on ts.id = p.tipo_sangre_id
      inner join municipios m on p.municipio_id = m.id
      inner join departamentos d on m.departamento_id = d.id
      inner join ordens o on o.paciente_id = p.id
      where (nullif(str_to_date(o.created_at,'%Y-%m-%d'), from_days(0))  between str_to_date(?,  '%Y-%m-%d')
      and str_to_date(?,  '%Y-%m-%d')) and d.id = ? "
    if idMunicipio.blank?
      #No posee municipio
      @consultaSQL = @consultaSQL + "group by m.nombre_municipio
      order by d.nombre_departamento , count(ts.id)"
      @cantidadPacientesPorTipoSangre = Paciente.find_by_sql([@consultaSQL, fechaInicio, fechaFin, idDepartamento])
    else
      #Posee municipio
      @consultaSQL = @consultaSQL + "and m.id = ? group by m.nombre_municipio
      order by d.nombre_departamento , count(ts.id)"
      @cantidadPacientesPorTipoSangre = Paciente.find_by_sql([@consultaSQL, fechaInicio, fechaFin, idDepartamento, idMunicipio])
    end
    return @cantidadPacientesPorTipoSangre
    # @cantidadPacientesPorTipoSangre = Paciente.find_by_sql(["", fechaInicio, fechaFin])
  end
end
