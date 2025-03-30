# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    # menu
    field :create_menu, mutation: Mutations::CreateMenu
    field :update_menu, mutation: Mutations::UpdateMenu
    field :delete_menu, mutation: Mutations::DeleteMenu

    # section
    field :create_section, mutation: Mutations::CreateSection
    field :update_section, mutation: Mutations::UpdateSection
    field :delete_section, mutation: Mutations::DeleteSection

    # menu --> section
    field :add_section_to_menu, mutation: Mutations::AddSectionToMenu
    field :remove_section_from_menu, mutation: Mutations::RemoveSectionFromMenu

    #item
    field :create_item, mutation: Mutations::CreateItem
    field :update_item, mutation: Mutations::UpdateItem
    field :delete_item, mutation: Mutations::DeleteItem

    #section --> item
    field :add_item_to_section, mutation: Mutations::AddItemToSection
    field :remove_item_from_section, mutation: Mutations::RemoveItemFromSection

    #modifier group 
    field :create_modifier_group_with_modifiers, mutation: Mutations::CreateModifierGroupWithModifiers
    field :update_modifier_group_with_modifiers, mutation: Mutations::UpdateModifierGroupWithModifiers
    field :delete_modifier_group, mutation: Mutations::DeleteModifierGroup

    #item --> modifier group
    field :add_modifier_group_to_item, mutation: Mutations::AddModifierGroupToItem
  end
end
