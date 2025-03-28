# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    # menu
    field :menus, resolver: Resolvers::MenusResolver
    field :menu, resolver: Resolvers::MenuResolver

    # section
    field :sections, resolver: Resolvers::SectionsResolver
    field :section, resolver: Resolvers::SectionResolver

  end
end
