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

    # add/remove section to menu
    field :add_section_to_menu, mutation: Mutations::AddSectionToMenu
    field :remove_section_from_menu, mutation: Mutations::RemoveSectionFromMenu
  end
end
