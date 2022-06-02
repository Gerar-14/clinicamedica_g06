class ReporteController < ApplicationController
  def index
    #Reporte de estadísticas por áreas la cantidad de exámenes realizados por municipio
    @reporte_1 = cantidad_examanes_realizados_por_area_by_municipio(2, '1990-05-27 19:32:18.000000', '2050-05-27 19:32:18.000000')
    #Reporte de estadísticas por áreas la cantidad de exámenes realizados por departamento
    @reporte_2 = cantidad_examanes_realizados_por_area_by_departamento(10, '1990-05-27 19:32:18.000000', '2050-05-27 19:32:18.000000')

    metodo_prueba(1, '1990-05-27 19:32:18.000000', '2050-05-27 19:32:18.000000', 1)
    metodo_prueba(2, '1990-05-27 19:32:18.000000', '2050-05-27 19:32:18.000000')
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

  def cantidad_examanes_realizados_por_area_by_municipio(id_municipio, fecha_inicio, fecha_fin)
    @areas = Area.find_by_sql(["select * from areas"])
    @municipio = Municipio.find_by_sql(["SELECT * from municipios where id = ?", id_municipio])

   nombre_municipio = @municipio[0].nombre_municipio
   @reporte_array = []
   @hash_reporte = {}
   @hash_reporte["Municipio"] = nombre_municipio
   @hash_reporte["Fecha inicio"] = fecha_inicio
   @hash_reporte["Fecha final"] = fecha_fin
      @areas.each do |area|
          @hash_data = {}
          nombre_area = area.nombre_area
          cantidad_ordenes_area_en_municipio = get_num_ordenes_de_area_y_municipio(id_municipio, fecha_inicio, fecha_fin , area.id) 
          @hash_data[nombre_area] = cantidad_ordenes_area_en_municipio
          @reporte_array << @hash_data
      end
      @hash_reporte["data"] = @reporte_array
      return @hash_reporte
  end

  def  cantidad_examanes_realizados_por_area_by_departamento(id_departamento, fecha_inicio, fecha_fin)
    @areas = Area.find_by_sql(["select * from areas"])
    @municipio = Municipio.find_by_sql(["SELECT * from municipios where departamento_id = ?", id_departamento])
    @departamento = Departamento.find_by_sql(["SELECT * from departamentos where id = ?", id_departamento])
    nombre_departamento = @departamento[0].nombre_departamento

    @array_municipio = []
    @hash_reporte_depa = {}

    @hash_reporte_depa["Departamento"] = nombre_departamento
    @hash_reporte_depa["Fecha inicio"] = fecha_inicio
    @hash_reporte_depa["Fecha final"] = fecha_fin

    @municipio.each do | muni |
      @array_municipio << cantidad_examanes_realizados_por_area_by_municipio(muni.id, fecha_inicio, fecha_fin)
    end
    
    @hash_reporte_depa["Municipios"] = @array_municipio

    return @hash_reporte_depa
  end 

  #Retorna un entero
  def get_num_ordenes_de_area_y_municipio(id_municipio, fecha_inicio, fecha_fin, id_area)
    #Para saber las ordenes de un municipio vimos que laboratorista le hizo la prueba, luego vemos en que laboratirio
    #trabaja ese laboratoista y luego vemos en que municipio esta ese laboratorio

    #Se hace un inner join de dos subconsultas
    #En la primera 
        #Primero obtenemos los laboratorios cuyo municipio_id sea igual al parametro que se recibe
        #Luego obtenemos los laboratoristas que trabajen en el listado de laboratorios que sean de un municipio
        #Luego obtenemos las ordenes de los laboratoristas que trabajan en los laboratorios que estan en ese municipio
        #luego obtenemos las orden_type_exam de las ordenes que son de la orden que le pertenecen al laboratoristas que trabaja para el laboratorio que esta en el municipio

    #En la segunda
        #Buscamos en area_type_exams  los que correspondan al area de interes
        #Luego buscamos los datos dado los id que encontramos

    @municipio = Municipio.find_by_sql(["SELECT * FROM (SELECT * FROM orden_type_exams where orden_id in (SELECT id FROM ordens where laboratory_worker_id in (SELECT id FROM laboratory_workers WHERE laboratorio_id in (SELECT id from laboratorios where municipio_id = ?) and fecha_examen BETWEEN ? AND ? ))) orden_type_exams_own INNER JOIN (SELECT * from type_exams where id in (SELECT type_exam_id from area_type_exams where area_id = ?)) type_exams_own ON orden_type_exams_own.type_exam_id = type_exams_own.id", id_municipio, fecha_inicio, fecha_fin, id_area])
    #@municipio = Municipio.find_by_sql(["SELECT * FROM (SELECT * FROM orden_type_exams where orden_id in (SELECT id FROM ordens where laboratory_worker_id in (SELECT id FROM laboratory_workers WHERE laboratorio_id in (SELECT id from laboratorios where municipio_id = ?)                                  ))) orden_type_exams_own INNER JOIN (SELECT * from type_exams where id in (SELECT type_exam_id from area_type_exams where area_id = ?)) type_exams_own ON orden_type_exams_own.type_exam_id = type_exams_own.id",id_municipio, id_area])
    #En @municipio tenemos el numero de ordenes relacionadas con ese municipio
    return @municipio.count
  end

  def contador_tipo_examenes(id_municipio, fecha_inicio, fecha_fin, id_area)
    @cons_sql = Municipio.find_by_sql(["SELECT orden_type_exams_own.id as orden, type_exams_own.id as id_tipo_examen,type_exams_own.name_type_examn as nombre_examen, count(type_exams_own.id) as contador FROM (SELECT * FROM orden_type_exams where orden_id in (SELECT id FROM ordens where laboratory_worker_id in (SELECT id FROM laboratory_workers WHERE laboratorio_id in (SELECT id from laboratorios where municipio_id = ?) and fecha_examen BETWEEN ? AND ? ))) orden_type_exams_own INNER JOIN (SELECT * from type_exams where id in (SELECT type_exam_id from area_type_exams where area_id = ?)) type_exams_own ON orden_type_exams_own.type_exam_id = type_exams_own.id GROUP BY type_exams_own.id, type_exams_own.name_type_examn", id_municipio, fecha_inicio, fecha_fin, id_area])
    #orden, id_tipo_examen , nombre_examen , contador
    @data_array = []
    @cons_sql.each do |mus|
      puts mus.nombre_examen
      puts mus.contador
      @hash_data[mus.nombre_examen] = mus.contador
      @data_array << @hash_data
    end

    return @data_array
  end 
  def metodo_prueba(id_municipio, fecha_inicio, fecha_fin, id_area)
    @municipio = Municipio.find_by_sql(["SELECT orden_type_exams_own.id, type_exams_own.id ,type_exams_own.name_type_examn, count(type_exams_own.id) FROM (SELECT * FROM orden_type_exams where orden_id in (SELECT id FROM ordens where laboratory_worker_id in (SELECT id FROM laboratory_workers WHERE laboratorio_id in (SELECT id from laboratorios where municipio_id = ?) and fecha_examen BETWEEN ? AND ? ))) orden_type_exams_own INNER JOIN (SELECT * from type_exams where id in (SELECT type_exam_id from area_type_exams where area_id = ?)) type_exams_own ON orden_type_exams_own.type_exam_id = type_exams_own.id GROUP BY orden_type_exams_own.id, type_exams_own.id", id_municipio, fecha_inicio, fecha_fin, id_area])
    @municipio.each do |mus|
      puts mus
    end
  end
end
