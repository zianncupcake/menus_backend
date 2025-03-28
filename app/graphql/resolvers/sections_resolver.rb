module Resolvers
  class SectionsResolver < BaseResolver
    type [Types::SectionType], null: false
    description "Returns all sections for a menu in ordered by display_order"

    argument :menu_id, ID, required: true

    def resolve(menu_id:)
      Section.joins(:menu_section)
               .where(menu_sections: { menu_id: menu_id })
               .order('menu_sections.display_order')
    end  
  end
end