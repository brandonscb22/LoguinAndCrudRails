# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170126222626) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.string   "name"
    t.integer  "subprocedure_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["subprocedure_id"], name: "index_activities_on_subprocedure_id", using: :btree
  end

  create_table "activity_by_products", force: :cascade do |t|
    t.integer  "activity_id"
    t.integer  "product_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["activity_id"], name: "index_activity_by_products_on_activity_id", using: :btree
    t.index ["product_id"], name: "index_activity_by_products_on_product_id", using: :btree
  end

  create_table "business_units", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cost_by_resources", force: :cascade do |t|
    t.integer  "meter_id"
    t.integer  "resource_id"
    t.integer  "subresource_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "activity_by_product_id"
    t.decimal  "quantity"
    t.decimal  "cost"
    t.index ["activity_by_product_id"], name: "index_cost_by_resources_on_activity_by_product_id", using: :btree
    t.index ["meter_id"], name: "index_cost_by_resources_on_meter_id", using: :btree
    t.index ["resource_id"], name: "index_cost_by_resources_on_resource_id", using: :btree
    t.index ["subresource_id"], name: "index_cost_by_resources_on_subresource_id", using: :btree
  end

  create_table "generators", force: :cascade do |t|
    t.string   "name"
    t.string   "unity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "human_usages", force: :cascade do |t|
    t.date     "registration_date"
    t.integer  "subresource_id"
    t.decimal  "quantity"
    t.integer  "meter_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["meter_id"], name: "index_human_usages_on_meter_id", using: :btree
    t.index ["subresource_id"], name: "index_human_usages_on_subresource_id", using: :btree
  end

  create_table "indirect_activities", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "subprocedure_id"
    t.integer  "management_unit_id"
    t.decimal  "management_unit_quantity"
    t.index ["management_unit_id"], name: "index_indirect_activities_on_management_unit_id", using: :btree
    t.index ["subprocedure_id"], name: "index_indirect_activities_on_subprocedure_id", using: :btree
  end

  create_table "indirect_activity_by_products", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "indirect_activity_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.index ["indirect_activity_id"], name: "index_indirect_activity_by_products_on_indirect_activity_id", using: :btree
    t.index ["product_id"], name: "index_indirect_activity_by_products_on_product_id", using: :btree
  end

  create_table "indirect_activity_by_resources", force: :cascade do |t|
    t.integer  "resource_id"
    t.integer  "subresource_id"
    t.decimal  "quantity"
    t.decimal  "cost"
    t.integer  "meter_id"
    t.integer  "indirect_activity_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.index ["indirect_activity_id"], name: "index_indirect_activity_by_resources_on_indirect_activity_id", using: :btree
    t.index ["meter_id"], name: "index_indirect_activity_by_resources_on_meter_id", using: :btree
    t.index ["resource_id"], name: "index_indirect_activity_by_resources_on_resource_id", using: :btree
    t.index ["subresource_id"], name: "index_indirect_activity_by_resources_on_subresource_id", using: :btree
  end

  create_table "kardex_acs", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "kardex_aps", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "kardex_generators", force: :cascade do |t|
    t.decimal  "quantity"
    t.boolean  "status_month"
    t.date     "day_of_entry"
    t.integer  "generator_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["generator_id"], name: "index_kardex_generators_on_generator_id", using: :btree
  end

  create_table "kardex_management_units", force: :cascade do |t|
    t.integer  "management_unit_id"
    t.decimal  "quantity"
    t.date     "day_of_entry"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["management_unit_id"], name: "index_kardex_management_units_on_management_unit_id", using: :btree
  end

  create_table "kardex_mos", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "kardex_products", force: :cascade do |t|
    t.date     "registre_date"
    t.decimal  "quantity"
    t.decimal  "total_value"
    t.integer  "meter_id"
    t.integer  "production_order_id"
    t.integer  "number_sale"
    t.integer  "product_id"
    t.boolean  "type_kpo"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.index ["meter_id"], name: "index_kardex_products_on_meter_id", using: :btree
    t.index ["product_id"], name: "index_kardex_products_on_product_id", using: :btree
    t.index ["production_order_id"], name: "index_kardex_products_on_production_order_id", using: :btree
  end

  create_table "kardexes", force: :cascade do |t|
    t.date     "registration_date"
    t.integer  "provider_id"
    t.integer  "subresource_id"
    t.decimal  "quantity"
    t.decimal  "total_value"
    t.integer  "meter_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.boolean  "type_kardex"
    t.index ["meter_id"], name: "index_kardexes_on_meter_id", using: :btree
    t.index ["provider_id"], name: "index_kardexes_on_provider_id", using: :btree
    t.index ["subresource_id"], name: "index_kardexes_on_subresource_id", using: :btree
  end

  create_table "macroprocesses", force: :cascade do |t|
    t.string   "name"
    t.integer  "business_unit_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["business_unit_id"], name: "index_macroprocesses_on_business_unit_id", using: :btree
  end

  create_table "macroproducts", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "management_units", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "description"
  end

  create_table "meters", force: :cascade do |t|
    t.string   "unity"
    t.string   "type_unity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "op_cost_by_resources", force: :cascade do |t|
    t.decimal  "quantity"
    t.integer  "meter_id"
    t.integer  "resource_id"
    t.integer  "subresource_id"
    t.integer  "activity_by_product_id"
    t.decimal  "cost"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "production_order_id"
    t.index ["activity_by_product_id"], name: "index_op_cost_by_resources_on_activity_by_product_id", using: :btree
    t.index ["meter_id"], name: "index_op_cost_by_resources_on_meter_id", using: :btree
    t.index ["production_order_id"], name: "index_op_cost_by_resources_on_production_order_id", using: :btree
    t.index ["resource_id"], name: "index_op_cost_by_resources_on_resource_id", using: :btree
    t.index ["subresource_id"], name: "index_op_cost_by_resources_on_subresource_id", using: :btree
  end

  create_table "positions", force: :cascade do |t|
    t.string   "name"
    t.string   "area"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "procedures", force: :cascade do |t|
    t.string   "name"
    t.integer  "macroprocess_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["macroprocess_id"], name: "index_procedures_on_macroprocess_id", using: :btree
  end

  create_table "production_order_identifiers", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date     "date_start"
    t.date     "date_end"
    t.integer  "status"
  end

  create_table "production_orders", force: :cascade do |t|
    t.integer  "product_id"
    t.decimal  "quantity"
    t.decimal  "total_cost"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "production_order_identifier_id"
    t.index ["product_id"], name: "index_production_orders_on_product_id", using: :btree
    t.index ["production_order_identifier_id"], name: "index_production_orders_on_production_order_identifier_id", using: :btree
  end

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.integer  "macroproduct_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.decimal  "sale_price"
    t.index ["macroproduct_id"], name: "index_products_on_macroproduct_id", using: :btree
  end

  create_table "providers", force: :cascade do |t|
    t.string   "name"
    t.string   "nit"
    t.string   "sector"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "resources", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sessions", force: :cascade do |t|
    t.datetime "time_init"
    t.datetime "time_end"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_sessions_on_user_id", using: :btree
  end

  create_table "subprocedures", force: :cascade do |t|
    t.string   "name"
    t.integer  "procedure_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["procedure_id"], name: "index_subprocedures_on_procedure_id", using: :btree
  end

  create_table "subresources", force: :cascade do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "properties"
    t.string   "identity_card"
    t.decimal  "salary"
    t.decimal  "hours_worked"
    t.decimal  "value_hour"
    t.decimal  "unit_cost"
    t.decimal  "stock_minimum"
    t.decimal  "stock_maximum"
    t.decimal  "current_stock"
    t.string   "identifier"
    t.decimal  "useful_life"
    t.float    "market_valuer"
    t.integer  "provider_id"
    t.integer  "position_id"
    t.string   "category"
    t.integer  "meter_id"
    t.string   "reference"
    t.index ["meter_id"], name: "index_subresources_on_meter_id", using: :btree
    t.index ["position_id"], name: "index_subresources_on_position_id", using: :btree
    t.index ["provider_id"], name: "index_subresources_on_provider_id", using: :btree
    t.index ["resource_id"], name: "index_subresources_on_resource_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "email"
    t.string   "encrypted_password"
    t.string   "salt"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "role_id"
    t.index ["role_id"], name: "index_users_on_role_id", using: :btree
  end

  add_foreign_key "activities", "subprocedures"
  add_foreign_key "activity_by_products", "activities"
  add_foreign_key "activity_by_products", "products"
  add_foreign_key "cost_by_resources", "activity_by_products"
  add_foreign_key "cost_by_resources", "meters"
  add_foreign_key "cost_by_resources", "resources"
  add_foreign_key "cost_by_resources", "subresources"
  add_foreign_key "human_usages", "meters"
  add_foreign_key "human_usages", "subresources"
  add_foreign_key "indirect_activities", "management_units"
  add_foreign_key "indirect_activities", "subprocedures"
  add_foreign_key "indirect_activity_by_products", "indirect_activities"
  add_foreign_key "indirect_activity_by_products", "products"
  add_foreign_key "indirect_activity_by_resources", "indirect_activities"
  add_foreign_key "indirect_activity_by_resources", "meters"
  add_foreign_key "indirect_activity_by_resources", "resources"
  add_foreign_key "indirect_activity_by_resources", "subresources"
  add_foreign_key "kardex_generators", "generators"
  add_foreign_key "kardex_management_units", "management_units"
  add_foreign_key "kardex_products", "meters"
  add_foreign_key "kardex_products", "production_orders"
  add_foreign_key "kardex_products", "products"
  add_foreign_key "kardexes", "meters"
  add_foreign_key "kardexes", "providers"
  add_foreign_key "kardexes", "subresources"
  add_foreign_key "macroprocesses", "business_units"
  add_foreign_key "op_cost_by_resources", "activity_by_products"
  add_foreign_key "op_cost_by_resources", "meters"
  add_foreign_key "op_cost_by_resources", "production_orders"
  add_foreign_key "op_cost_by_resources", "resources"
  add_foreign_key "op_cost_by_resources", "subresources"
  add_foreign_key "procedures", "macroprocesses"
  add_foreign_key "production_orders", "production_order_identifiers"
  add_foreign_key "production_orders", "products"
  add_foreign_key "products", "macroproducts"
  add_foreign_key "sessions", "users"
  add_foreign_key "subprocedures", "procedures"
  add_foreign_key "subresources", "meters"
  add_foreign_key "subresources", "positions"
  add_foreign_key "subresources", "providers"
  add_foreign_key "subresources", "resources"
  add_foreign_key "users", "roles"
end
