module Resolvers
  class SectionResolver < BaseResolver
    type Types::SectionType, null: true
    description "Returns a single section by ID + items"

    argument :id, ID, required: true

    def resolve(id:)
      Section.includes(section_items: :item)
           .find_by(id: id)
    end
  end
end