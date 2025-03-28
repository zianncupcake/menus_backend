module Resolvers
  class SectionResolver < BaseResolver
    type Types::SectionType, null: true
    description "Returns a single section by ID"

    argument :id, ID, required: true

    def resolve(id:)
      Section.find_by(id: id)
    end
  end
end