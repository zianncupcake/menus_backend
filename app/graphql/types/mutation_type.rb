# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :create_menu, mutation: Mutations::CreateMenu
    field :update_menu, mutation: Mutations::UpdateMenu
    field :delete_menu, mutation: Mutations::DeleteMenu
  end
end
