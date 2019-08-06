class AddColumnToRecord < ActiveRecord::Migration[5.2]
  def change
    add_column :records, :day, :date
  end
end
