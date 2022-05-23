# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_05_22_230748) do
  create_table "accesos", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "rol_id", null: false
    t.bigint "permiso_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["permiso_id"], name: "index_accesos_on_permiso_id"
    t.index ["rol_id"], name: "index_accesos_on_rol_id"
  end

  create_table "area_tipo_examen", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "area_id", null: false
    t.bigint "tipo_examen_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["area_id"], name: "index_area_tipo_examen_on_area_id"
    t.index ["tipo_examen_id"], name: "index_area_tipo_examen_on_tipo_examen_id"
  end

  create_table "areas", charset: "utf8mb4", force: :cascade do |t|
    t.string "nombre_area"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "countries", charset: "utf8mb4", force: :cascade do |t|
    t.string "nombre_country"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "departamentos", charset: "utf8mb4", force: :cascade do |t|
    t.string "nombre_departamento"
    t.bigint "country_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_departamentos_on_country_id"
  end

  create_table "empleados", charset: "utf8mb4", force: :cascade do |t|
    t.string "nombre_empleado"
    t.string "apellido_empleado"
    t.string "profesion"
    t.string "dui_empleado"
    t.bigint "municipio_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["municipio_id"], name: "index_empleados_on_municipio_id"
    t.index ["user_id"], name: "index_empleados_on_user_id"
  end

  create_table "laboratorios", charset: "utf8mb4", force: :cascade do |t|
    t.string "nombre_laboratorio"
    t.bigint "municipio_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["municipio_id"], name: "index_laboratorios_on_municipio_id"
  end

  create_table "laboratorista", charset: "utf8mb4", force: :cascade do |t|
    t.string "num_junta_vigilancia"
    t.bigint "laboratorio_id", null: false
    t.bigint "empleado_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["empleado_id"], name: "index_laboratorista_on_empleado_id"
    t.index ["laboratorio_id"], name: "index_laboratorista_on_laboratorio_id"
  end

  create_table "menu_permisos", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "menu_id", null: false
    t.bigint "permiso_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["menu_id"], name: "index_menu_permisos_on_menu_id"
    t.index ["permiso_id"], name: "index_menu_permisos_on_permiso_id"
  end

  create_table "menu_rols", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "menu_id", null: false
    t.bigint "rol_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["menu_id"], name: "index_menu_rols_on_menu_id"
    t.index ["rol_id"], name: "index_menu_rols_on_rol_id"
  end

  create_table "menus", charset: "utf8mb4", force: :cascade do |t|
    t.string "nombre"
    t.bigint "menu_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["menu_id"], name: "index_menus_on_menu_id"
  end

  create_table "muestras", charset: "utf8mb4", force: :cascade do |t|
    t.string "tipo_muestra"
    t.datetime "fecha_entrega_muestra"
    t.bigint "empleado_id", null: false
    t.bigint "orden_tipo_examen_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["empleado_id"], name: "index_muestras_on_empleado_id"
    t.index ["orden_tipo_examen_id"], name: "index_muestras_on_orden_tipo_examen_id"
  end

  create_table "municipios", charset: "utf8mb4", force: :cascade do |t|
    t.string "nombre_municipio"
    t.bigint "departamento_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["departamento_id"], name: "index_municipios_on_departamento_id"
  end

  create_table "orden_tipo_examen", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "tipo_examen_id", null: false
    t.bigint "orden_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["orden_id"], name: "index_orden_tipo_examen_on_orden_id"
    t.index ["tipo_examen_id"], name: "index_orden_tipo_examen_on_tipo_examen_id"
  end

  create_table "ordens", charset: "utf8mb4", force: :cascade do |t|
    t.datetime "fecha_examen"
    t.bigint "paciente_id", null: false
    t.bigint "laboratorista_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["laboratorista_id"], name: "index_ordens_on_laboratorista_id"
    t.index ["paciente_id"], name: "index_ordens_on_paciente_id"
  end

  create_table "pacientes", charset: "utf8mb4", force: :cascade do |t|
    t.string "nombre_paciente"
    t.string "apellido_paciente"
    t.string "genero_paciente"
    t.date "fecha_nacimiento"
    t.string "direccion"
    t.string "telefono"
    t.string "telefono_celular"
    t.string "telefono_contacto"
    t.string "correo_electronico"
    t.string "apellido_casado"
    t.string "estado_civil"
    t.string "dui_paciente"
    t.string "pasaporte"
    t.bigint "municipio_id", null: false
    t.bigint "tipo_sangre_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["municipio_id"], name: "index_pacientes_on_municipio_id"
    t.index ["tipo_sangre_id"], name: "index_pacientes_on_tipo_sangre_id"
  end

  create_table "parametros", charset: "utf8mb4", force: :cascade do |t|
    t.string "nombre_parametro"
    t.integer "tipo_parametro"
    t.bigint "unidad_medida_id", null: false
    t.bigint "parametro_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["parametro_id"], name: "index_parametros_on_parametro_id"
    t.index ["unidad_medida_id"], name: "index_parametros_on_unidad_medida_id"
  end

  create_table "permisos", charset: "utf8mb4", force: :cascade do |t|
    t.string "nombre_permiso"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "ruta"
  end

  create_table "resultados", charset: "utf8mb4", force: :cascade do |t|
    t.string "descripcion"
    t.bigint "parametro_id", null: false
    t.bigint "orden_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["orden_id"], name: "index_resultados_on_orden_id"
    t.index ["parametro_id"], name: "index_resultados_on_parametro_id"
  end

  create_table "rol_empleados", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "rol_id", null: false
    t.bigint "empleado_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["empleado_id"], name: "index_rol_empleados_on_empleado_id"
    t.index ["rol_id"], name: "index_rol_empleados_on_rol_id"
  end

  create_table "rols", charset: "utf8mb4", force: :cascade do |t|
    t.string "nombre_rol"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tipo_examen", charset: "utf8mb4", force: :cascade do |t|
    t.string "nombre_tipo_examen"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tipo_examen_parametros", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "parametro_id", null: false
    t.bigint "tipo_examen_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["parametro_id"], name: "index_tipo_examen_parametros_on_parametro_id"
    t.index ["tipo_examen_id"], name: "index_tipo_examen_parametros_on_tipo_examen_id"
  end

  create_table "tipo_sangres", charset: "utf8mb4", force: :cascade do |t|
    t.string "nombre_tipo_sangre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "unidad_medidas", charset: "utf8mb4", force: :cascade do |t|
    t.string "nombre_unidad_medida"
    t.string "siglas"
    t.string "sistema_medida"
    t.string "descripcion_unidad_medida"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", charset: "utf8mb4", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_salt"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "valor_referencia", charset: "utf8mb4", force: :cascade do |t|
    t.string "valor_referencia"
    t.bigint "parametro_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["parametro_id"], name: "index_valor_referencia_on_parametro_id"
  end

  add_foreign_key "accesos", "permisos"
  add_foreign_key "accesos", "rols"
  add_foreign_key "area_tipo_examen", "areas"
  add_foreign_key "area_tipo_examen", "tipo_examen", column: "tipo_examen_id"
  add_foreign_key "departamentos", "countries"
  add_foreign_key "empleados", "municipios"
  add_foreign_key "empleados", "users"
  add_foreign_key "laboratorios", "municipios"
  add_foreign_key "laboratorista", "empleados"
  add_foreign_key "laboratorista", "laboratorios"
  add_foreign_key "menu_permisos", "menus"
  add_foreign_key "menu_permisos", "permisos"
  add_foreign_key "menu_rols", "menus"
  add_foreign_key "menu_rols", "rols"
  add_foreign_key "menus", "menus"
  add_foreign_key "muestras", "empleados"
  add_foreign_key "muestras", "orden_tipo_examen", column: "orden_tipo_examen_id"
  add_foreign_key "municipios", "departamentos"
  add_foreign_key "orden_tipo_examen", "ordens"
  add_foreign_key "orden_tipo_examen", "tipo_examen", column: "tipo_examen_id"
  add_foreign_key "ordens", "laboratorista", column: "laboratorista_id"
  add_foreign_key "ordens", "pacientes"
  add_foreign_key "pacientes", "municipios"
  add_foreign_key "pacientes", "tipo_sangres"
  add_foreign_key "parametros", "parametros"
  add_foreign_key "parametros", "unidad_medidas"
  add_foreign_key "resultados", "ordens"
  add_foreign_key "resultados", "parametros"
  add_foreign_key "rol_empleados", "empleados"
  add_foreign_key "rol_empleados", "rols"
  add_foreign_key "tipo_examen_parametros", "parametros"
  add_foreign_key "tipo_examen_parametros", "tipo_examen", column: "tipo_examen_id"
  add_foreign_key "valor_referencia", "parametros"
end
