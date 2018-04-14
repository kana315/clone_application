ActiveRecord::Schema.define(version: 20180413013928) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "notes", force: :cascade do |t|
    t.text "content"
  end

end
