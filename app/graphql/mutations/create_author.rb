module Mutations
  class CreateAuthor < BaseMutation
    argument :name, String, required: true

    field :author, Types::AuthorType, null: false

    def resolve(name:)
      author = Author.create!(name: name)
      { author: author }
    end
  end
end
