class AddUniqueIndexToItemModifierGroups < ActiveRecord::Migration[7.2]
  def up
    add_index :item_modifier_groups, [:item_id, :modifier_group_id], 
              unique: true,
              name: 'unique_item_modifier_association'
  end

  def down
    remove_index :item_modifier_groups, 
                 name: 'unique_item_modifier_association'
  end
end
