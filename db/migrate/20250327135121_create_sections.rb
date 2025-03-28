class CreateSections < ActiveRecord::Migration[7.2]
  def change
    create_table :sections do |t|
      t.string :identifier
      t.string :label
      t.string :description

      t.timestamps
    end
  end
end
