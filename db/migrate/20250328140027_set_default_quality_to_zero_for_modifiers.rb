class SetDefaultQualityToZeroForModifiers < ActiveRecord::Migration[7.2]
  def change
    change_column :modifiers, :default_quality, :integer, default: 0
  end
end
