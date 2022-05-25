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

ActiveRecord::Schema[7.0].define(version: 2022_05_25_170031) do
  create_table "accesos", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "rol_id", null: false
    t.bigint "permiso_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["permiso_id"], name: "index_accesos_on_permiso_id"
    t.index ["rol_id"], name: "index_accesos_on_rol_id"
  end

  create_table "area_type_exams", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "area_id", null: false
    t.bigint "type_exam_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["area_id"], name: "index_area_type_exams_on_area_id"
    t.index ["type_exam_id"], name: "index_area_type_exams_on_type_exam_id"
  end

  create_table "areas", charset: "utf8mb4", force: :cascade do |t|
    t.string "nombre_area", limit: 50, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "countries", charset: "utf8mb4", force: :cascade do |t|
    t.string "nombre_country", limit: 50, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "departamentos", charset: "utf8mb4", force: :cascade do |t|
    t.string "nombre_departamento", limit: 50, null: false
    t.bigint "country_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_departamentos_on_country_id"
  end

  create_table "empleados", charset: "utf8mb4", force: :cascade do |t|
    t.string "nombre_empleado", limit: 50, null: false
    t.string "apellido_empleado", limit: 50, null: false
    t.string "profesion", limit: 50, null: false
    t.string "dui_empleado", limit: 10, null: false
    t.bigint "municipio_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["municipio_id"], name: "index_empleados_on_municipio_id"
    t.index ["user_id"], name: "index_empleados_on_user_id"
  end

  create_table "laboratorios", charset: "utf8mb4", force: :cascade do |t|
    t.string "nombre_laboratorio", limit: 50, null: false
    t.bigint "municipio_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["municipio_id"], name: "index_laboratorios_on_municipio_id"
  end

  create_table "laboratory_workers", charset: "utf8mb4", force: :cascade do |t|
    t.string "num_junta_vigilancia", limit: 50, null: false
    t.bigint "laboratorio_id", null: false
    t.bigint "empleado_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["empleado_id"], name: "index_laboratory_workers_on_empleado_id"
    t.index ["laboratorio_id"], name: "index_laboratory_workers_on_laboratorio_id"
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
    t.string "nombre", limit: 100, null: false
    t.bigint "menu_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["menu_id"], name: "index_menus_on_menu_id"
  end

  create_table "muestras", charset: "utf8mb4", force: :cascade do |t|
    t.string "tipo_muestra", limit: 50, null: false
    t.datetime "fecha_entrega_muestra", null: false
    t.bigint "empleado_id", null: false
    t.bigint "orden_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["empleado_id"], name: "index_muestras_on_empleado_id"
    t.index ["orden_id"], name: "index_muestras_on_orden_id"
  end

  create_table "municipios", charset: "utf8mb4", force: :cascade do |t|
    t.string "nombre_municipio", limit: 50, null: false
    t.bigint "departamento_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["departamento_id"], name: "index_municipios_on_departamento_id"
  end

  create_table "orden_type_exams", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "type_exam_id", null: false
    t.bigint "orden_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["orden_id"], name: "index_orden_type_exams_on_orden_id"
    t.index ["type_exam_id"], name: "index_orden_type_exams_on_type_exam_id"
  end

  create_table "ordens", charset: "utf8mb4", force: :cascade do |t|
    t.datetime "fecha_examen", null: false
    t.bigint "paciente_id", null: false
    t.bigint "laboratory_worker_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["laboratory_worker_id"], name: "index_ordens_on_laboratory_worker_id"
    t.index ["paciente_id"], name: "index_ordens_on_paciente_id"
  end

  create_table "pacientes", charset: "utf8mb4", force: :cascade do |t|
    t.string "nombre_paciente", limit: 50, null: false
    t.string "apellido_paciente", limit: 50, null: false
    t.string "genero_paciente", limit: 1, null: false
    t.date "fecha_nacimiento", null: false
    t.string "direccion", limit: 200, null: false
    t.string "telefono", limit: 20
    t.string "telefono_celular", limit: 20, null: false
    t.string "telefono_contacto", limit: 20, null: false
    t.string "correo_electronico", limit: 50
    t.string "apellido_casado", limit: 50
    t.string "estado_civil", limit: 1, null: false
    t.string "dui_paciente", limit: 10
    t.string "pasaporte", limit: 20
    t.bigint "municipio_id", null: false
    t.bigint "tipo_sangre_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["municipio_id"], name: "index_pacientes_on_municipio_id"
    t.index ["tipo_sangre_id"], name: "index_pacientes_on_tipo_sangre_id"
  end

  create_table "parametros", charset: "utf8mb4", force: :cascade do |t|
    t.string "nombre_parametro", limit: 50, null: false
    t.integer "tipo_parametro", null: false
    t.bigint "unidad_medida_id"
    t.bigint "parametro_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["parametro_id"], name: "index_parametros_on_parametro_id"
    t.index ["unidad_medida_id"], name: "index_parametros_on_unidad_medida_id"
  end

  create_table "permisos", charset: "utf8mb4", force: :cascade do |t|
    t.string "nombre_permiso", limit: 50, null: false
    t.string "ruta", limit: 200, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "crud"
  end

  create_table "resultados", charset: "utf8mb4", force: :cascade do |t|
    t.string "descripcion", limit: 100, null: false
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
    t.string "nombre_rol", limit: 50, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tipo_sangres", charset: "utf8mb4", force: :cascade do |t|
    t.string "nombre_tipo_sangre", limit: 50, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "type_exam_parametros", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "parametro_id", null: false
    t.bigint "type_exam_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["parametro_id"], name: "index_type_exam_parametros_on_parametro_id"
    t.index ["type_exam_id"], name: "index_type_exam_parametros_on_type_exam_id"
  end

  create_table "type_exams", charset: "utf8mb4", force: :cascade do |t|
    t.string "name_type_examn", limit: 50, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "unidad_medidas", charset: "utf8mb4", force: :cascade do |t|
    t.string "nombre_unidad_medida", limit: 50, null: false
    t.string "siglas", limit: 15, null: false
    t.string "sistema_medida", limit: 30, null: false
    t.string "descripcion_unidad_medida", limit: 100, null: false
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

  create_table "value_references", charset: "utf8mb4", force: :cascade do |t|
    t.string "value_reference", limit: 30, null: false
    t.bigint "parametro_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["parametro_id"], name: "index_value_references_on_parametro_id"
  end

  add_foreign_key "accesos", "permisos"
  add_foreign_key "accesos", "rols"
  add_foreign_key "area_type_exams", "areas"
  add_foreign_key "area_type_exams", "type_exams"
  add_foreign_key "departamentos", "countries"
  add_foreign_key "empleados", "municipios"
  add_foreign_key "empleados", "users"
  add_foreign_key "laboratorios", "municipios"
  add_foreign_key "laboratory_workers", "empleados"
  add_foreign_key "laboratory_workers", "laboratorios"
  add_foreign_key "menu_permisos", "menus"
  add_foreign_key "menu_permisos", "permisos"
  add_foreign_key "menu_rols", "menus"
  add_foreign_key "menu_rols", "rols"
  add_foreign_key "menus", "menus"
  add_foreign_key "muestras", "empleados"
  add_foreign_key "muestras", "ordens"
  add_foreign_key "municipios", "departamentos"
  add_foreign_key "orden_type_exams", "ordens"
  add_foreign_key "orden_type_exams", "type_exams"
  add_foreign_key "ordens", "laboratory_workers"
  add_foreign_key "ordens", "pacientes"
  add_foreign_key "pacientes", "municipios"
  add_foreign_key "pacientes", "tipo_sangres"
  add_foreign_key "parametros", "parametros"
  add_foreign_key "parametros", "unidad_medidas"
  add_foreign_key "resultados", "ordens"
  add_foreign_key "resultados", "parametros"
  add_foreign_key "rol_empleados", "empleados"
  add_foreign_key "rol_empleados", "rols"
  add_foreign_key "type_exam_parametros", "parametros"
  add_foreign_key "type_exam_parametros", "type_exams"
  add_foreign_key "value_references", "parametros"
end
