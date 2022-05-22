require "test_helper"

class PacientesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @paciente = pacientes(:one)
  end

  test "should get index" do
    get pacientes_url
    assert_response :success
  end

  test "should get new" do
    get new_paciente_url
    assert_response :success
  end

  test "should create paciente" do
    assert_difference("Paciente.count") do
      post pacientes_url, params: { paciente: { apellido_casado: @paciente.apellido_casado, apellido_paciente: @paciente.apellido_paciente, correo_electronico: @paciente.correo_electronico, direccion: @paciente.direccion, dui_paciente: @paciente.dui_paciente, estado_civil: @paciente.estado_civil, fecha_nacimiento: @paciente.fecha_nacimiento, genero_paciente: @paciente.genero_paciente, municipio_id: @paciente.municipio_id, nombre_paciente: @paciente.nombre_paciente, pasaporte: @paciente.pasaporte, telefono: @paciente.telefono, telefono_celular: @paciente.telefono_celular, telefono_contacto: @paciente.telefono_contacto, tipo_sangre_id: @paciente.tipo_sangre_id } }
    end

    assert_redirected_to paciente_url(Paciente.last)
  end

  test "should show paciente" do
    get paciente_url(@paciente)
    assert_response :success
  end

  test "should get edit" do
    get edit_paciente_url(@paciente)
    assert_response :success
  end

  test "should update paciente" do
    patch paciente_url(@paciente), params: { paciente: { apellido_casado: @paciente.apellido_casado, apellido_paciente: @paciente.apellido_paciente, correo_electronico: @paciente.correo_electronico, direccion: @paciente.direccion, dui_paciente: @paciente.dui_paciente, estado_civil: @paciente.estado_civil, fecha_nacimiento: @paciente.fecha_nacimiento, genero_paciente: @paciente.genero_paciente, municipio_id: @paciente.municipio_id, nombre_paciente: @paciente.nombre_paciente, pasaporte: @paciente.pasaporte, telefono: @paciente.telefono, telefono_celular: @paciente.telefono_celular, telefono_contacto: @paciente.telefono_contacto, tipo_sangre_id: @paciente.tipo_sangre_id } }
    assert_redirected_to paciente_url(@paciente)
  end

  test "should destroy paciente" do
    assert_difference("Paciente.count", -1) do
      delete paciente_url(@paciente)
    end

    assert_redirected_to pacientes_url
  end
end
