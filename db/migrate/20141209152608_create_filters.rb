class CreateFilters < ActiveRecord::Migration
  def change
    create_table :filters do |t|
      t.belongs_to :tag
      t.belongs_to :entry
      t.timestamps
    end
  end
end
