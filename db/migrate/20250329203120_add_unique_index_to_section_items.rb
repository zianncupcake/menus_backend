class AddUniqueIndexToSectionItems < ActiveRecord::Migration[7.2]
  def up
    add_index :section_items, [:section_id, :item_id], 
              unique: true,
              name: 'unique_section_item_association'
  end

  def down
    remove_index :section_items, 
                 name: 'unique_section_item_association'
  end
end
