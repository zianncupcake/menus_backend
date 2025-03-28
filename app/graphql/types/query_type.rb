# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    # menu
    field :menus, resolver: Resolvers::MenusResolver
    field :menu, resolver: Resolvers::MenuResolver

    # section
    field :section, resolver: Resolvers::SectionResolver

    # item
    field :item, resolver: Resolvers::ItemResolver

  end
end
