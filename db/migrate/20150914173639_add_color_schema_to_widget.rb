class AddColorSchemaToWidget < ActiveRecord::Migration
  def change
    add_column :widgets, :color_schema, :string, default: "purple"
  end
end
