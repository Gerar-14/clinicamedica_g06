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

ActiveRecord::Schema[7.0].define(version: 2022_05_22_031901) do
  create_table "acceso", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "rol_id", null: false
    t.bigint "permiso_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["permiso_id"], name: "index_acceso_on_permiso_id"
    t.index ["rol_id"], name: "index_acceso_on_rol_id"
  end

  create_table "area", charset: "utf8mb4", force: :cascade do |t|
    t.string "nombre_area"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "area_tipo_examen", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "area_id", null: false
    t.bigint "tipo_examen_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["area_id"], name: "index_area_tipo_examen_on_area_id"
    t.index ["tipo_examen_id"], name: "index_area_tipo_examen_on_tipo_examen_id"
  end

  create_table "departamento", charset: "utf8mb4", force: :cascade do |t|
    t.string "nombre_departamento"
    t.bigint "pais_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pais_id"], name: "index_departamento_on_pais_id"
  end

  create_table "empleado", charset: "utf8mb4", force: :cascade do |t|
    t.string "nombre_empleado"
    t.string "apellido_empleado"
    t.string "profesion"
    t.string "dui_empleado"
    t.bigint "municipio_id", null: false
    t.bigint "users_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["municipio_id"], name: "index_empleado_on_municipio_id"
    t.index ["users_id"], name: "index_empleado_on_users_id"
  end

  create_table "laboratorio", charset: "utf8mb4", force: :cascade do |t|
    t.string "nombre_laboratorio"
    t.bigint "municipio_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["municipio_id"], name: "index_laboratorio_on_municipio_id"
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

  create_table "menu", charset: "utf8mb4", force: :cascade do |t|
    t.string "nombre"
    t.bigint "menu_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["menu_id"], name: "index_menu_on_menu_id"
  end

  create_table "menu_permiso", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "menu_id", null: false
    t.bigint "permiso_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["menu_id"], name: "index_menu_permiso_on_menu_id"
    t.index ["permiso_id"], name: "index_menu_permiso_on_permiso_id"
  end

  create_table "menu_rol", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "menu_id", null: false
    t.bigint "rol_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["menu_id"], name: "index_menu_rol_on_menu_id"
    t.index ["rol_id"], name: "index_menu_rol_on_rol_id"
  end

  create_table "muestra", charset: "utf8mb4", force: :cascade do |t|
    t.string "tipo_muestra"
    t.datetime "fecha_entrega_muestra"
    t.bigint "empleado_id", null: false
    t.bigint "orden_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["empleado_id"], name: "index_muestra_on_empleado_id"
    t.index ["orden_id"], name: "index_muestra_on_orden_id"
  end

  create_table "municipio", charset: "utf8mb4", force: :cascade do |t|
    t.string "nombre_municipio"
    t.bigint "departamento_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["departamento_id"], name: "index_municipio_on_departamento_id"
  end

  create_table "orden", charset: "utf8mb4", force: :cascade do |t|
    t.datetime "fecha_examen"
    t.bigint "paciente_id", null: false
    t.bigint "laboratorista_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["laboratorista_id"], name: "index_orden_on_laboratorista_id"
    t.index ["paciente_id"], name: "index_orden_on_paciente_id"
  end

  create_table "orden_tipo_examen", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "tipo_examen_id", null: false
    t.bigint "orden_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["orden_id"], name: "index_orden_tipo_examen_on_orden_id"
    t.index ["tipo_examen_id"], name: "index_orden_tipo_examen_on_tipo_examen_id"
  end

  create_table "paciente", charset: "utf8mb4", force: :cascade do |t|
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
    t.index ["municipio_id"], name: "index_paciente_on_municipio_id"
    t.index ["tipo_sangre_id"], name: "index_paciente_on_tipo_sangre_id"
  end

  create_table "pais", charset: "utf8mb4", force: :cascade do |t|
    t.string "nombre_pais"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "parametro", charset: "utf8mb4", force: :cascade do |t|
    t.string "nombre_parametro"
    t.integer "tipo_parametro"
    t.bigint "unidad_medida_id", null: false
    t.bigint "parametro_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["parametro_id"], name: "index_parametro_on_parametro_id"
    t.index ["unidad_medida_id"], name: "index_parametro_on_unidad_medida_id"
  end

  create_table "permiso", charset: "utf8mb4", force: :cascade do |t|
    t.string "nombre_permiso"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "resultado", charset: "utf8mb4", force: :cascade do |t|
    t.string "descripcion"
    t.bigint "parametro_id", null: false
    t.bigint "orden_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["orden_id"], name: "index_resultado_on_orden_id"
    t.index ["parametro_id"], name: "index_resultado_on_parametro_id"
  end

  create_table "rol", charset: "utf8mb4", force: :cascade do |t|
    t.string "nombre_rol"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rol_empleado", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "rol_id", null: false
    t.bigint "empleado_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["empleado_id"], name: "index_rol_empleado_on_empleado_id"
    t.index ["rol_id"], name: "index_rol_empleado_on_rol_id"
  end

  create_table "tipo_examen", charset: "utf8mb4", force: :cascade do |t|
    t.string "nombre_tipo_examen"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tipo_examen_parametro", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "parametro_id", null: false
    t.bigint "tipo_examen_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["parametro_id"], name: "index_tipo_examen_parametro_on_parametro_id"
    t.index ["tipo_examen_id"], name: "index_tipo_examen_parametro_on_tipo_examen_id"
  end

  create_table "tipo_sangre", charset: "utf8mb4", force: :cascade do |t|
    t.string "nombre_tipo_sangre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "unidad_medida", charset: "utf8mb4", force: :cascade do |t|
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

  add_foreign_key "acceso", "permiso"
  add_foreign_key "acceso", "rol"
  add_foreign_key "area_tipo_examen", "area"
  add_foreign_key "area_tipo_examen", "tipo_examen", column: "tipo_examen_id"
  add_foreign_key "departamento", "pais", column: "pais_id"
  add_foreign_key "empleado", "municipio"
  add_foreign_key "empleado", "users", column: "users_id"
  add_foreign_key "laboratorio", "municipio"
  add_foreign_key "laboratorista", "empleado"
  add_foreign_key "laboratorista", "laboratorio"
  add_foreign_key "menu", "menu"
  add_foreign_key "menu_permiso", "menu"
  add_foreign_key "menu_permiso", "permiso"
  add_foreign_key "menu_rol", "menu"
  add_foreign_key "menu_rol", "rol"
  add_foreign_key "muestra", "empleado"
  add_foreign_key "muestra", "orden"
  add_foreign_key "municipio", "departamento"
  add_foreign_key "orden", "laboratorista", column: "laboratorista_id"
  add_foreign_key "orden", "paciente"
  add_foreign_key "orden_tipo_examen", "orden"
  add_foreign_key "orden_tipo_examen", "tipo_examen", column: "tipo_examen_id"
  add_foreign_key "paciente", "municipio"
  add_foreign_key "paciente", "tipo_sangre"
  add_foreign_key "parametro", "parametro"
  add_foreign_key "parametro", "unidad_medida"
  add_foreign_key "resultado", "orden"
  add_foreign_key "resultado", "parametro"
  add_foreign_key "rol_empleado", "empleado"
  add_foreign_key "rol_empleado", "rol"
  add_foreign_key "tipo_examen_parametro", "parametro"
  add_foreign_key "tipo_examen_parametro", "tipo_examen", column: "tipo_examen_id"
  add_foreign_key "valor_referencia", "parametro"
end
