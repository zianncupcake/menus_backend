class RenameDefaultQualityToDefaultQuantityInModifiers < ActiveRecord::Migration[7.2]
  def change
    rename_column :modifiers, :default_quality, :default_quantity
  end
end
