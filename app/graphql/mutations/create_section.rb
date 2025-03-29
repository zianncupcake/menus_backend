module Mutations
  class CreateSection < BaseMutation
    argument :identifier, String, required: true
    argument :label, String, required: true
    argument :description, String, required: true

    field :section, Types::SectionType, null: true
    field :errors, [String], null: false

    def resolve(identifier:, label:, description:)
      section = Section.new(
        identifier: identifier,
        label: label,
        description: description
      )

      if section.save
        { section: section, errors: [] }
      else
        { section: nil, errors: section.errors.full_messages }
      end
    end
  end
end