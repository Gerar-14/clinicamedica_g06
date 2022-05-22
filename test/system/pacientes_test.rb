require "application_system_test_case"

class PacientesTest < ApplicationSystemTestCase
  setup do
    @paciente = pacientes(:one)
  end

  test "visiting the index" do
    visit pacientes_url
    assert_selector "h1", text: "Pacientes"
  end

  test "should create paciente" do
    visit pacientes_url
    click_on "New paciente"

    fill_in "Apellido casado", with: @paciente.apellido_casado
    fill_in "Apellido paciente", with: @paciente.apellido_paciente
    fill_in "Correo electronico", with: @paciente.correo_electronico
    fill_in "Direccion", with: @paciente.direccion
    fill_in "Dui paciente", with: @paciente.dui_paciente
    fill_in "Estado civil", with: @paciente.estado_civil
    fill_in "Fecha nacimiento", with: @paciente.fecha_nacimiento
    fill_in "Genero paciente", with: @paciente.genero_paciente
    fill_in "Municipio", with: @paciente.municipio_id
    fill_in "Nombre paciente", with: @paciente.nombre_paciente
    fill_in "Pasaporte", with: @paciente.pasaporte
    fill_in "Telefono", with: @paciente.telefono
    fill_in "Telefono celular", with: @paciente.telefono_celular
    fill_in "Telefono contacto", with: @paciente.telefono_contacto
    fill_in "Tipo sangre", with: @paciente.tipo_sangre_id
    click_on "Create Paciente"

    assert_text "Paciente was successfully created"
    click_on "Back"
  end

  test "should update Paciente" do
    visit paciente_url(@paciente)
    click_on "Edit this paciente", match: :first

    fill_in "Apellido casado", with: @paciente.apellido_casado
    fill_in "Apellido paciente", with: @paciente.apellido_paciente
    fill_in "Correo electronico", with: @paciente.correo_electronico
    fill_in "Direccion", with: @paciente.direccion
    fill_in "Dui paciente", with: @paciente.dui_paciente
    fill_in "Estado civil", with: @paciente.estado_civil
    fill_in "Fecha nacimiento", with: @paciente.fecha_nacimiento
    fill_in "Genero paciente", with: @paciente.genero_paciente
    fill_in "Municipio", with: @paciente.municipio_id
    fill_in "Nombre paciente", with: @paciente.nombre_paciente
    fill_in "Pasaporte", with: @paciente.pasaporte
    fill_in "Telefono", with: @paciente.telefono
    fill_in "Telefono celular", with: @paciente.telefono_celular
    fill_in "Telefono contacto", with: @paciente.telefono_contacto
    fill_in "Tipo sangre", with: @paciente.tipo_sangre_id
    click_on "Update Paciente"

    assert_text "Paciente was successfully updated"
    click_on "Back"
  end

  test "should destroy Paciente" do
    visit paciente_url(@paciente)
    click_on "Destroy this paciente", match: :first

    assert_text "Paciente was successfully destroyed"
  end
end
