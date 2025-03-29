class AddUniqueIndexToMenuSections < ActiveRecord::Migration[7.2]
  def up
    add_index :menu_sections, [:menu_id, :section_id], 
              unique: true,
              name: 'unique_menu_section_association'
  end

  def down
    remove_index :menu_sections, 
                 name: 'unique_menu_section_association'
  end
end
