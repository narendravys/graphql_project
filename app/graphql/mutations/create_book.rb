# frozen_string_literal: true

module Mutations
  class CreateBook < BaseMutation
    argument :title, String, required: true
    argument :description, String, required: false
    argument :author_id, ID, required: true

    field :book, Types::BookType, null: false

    def resolve(title:, description:, author_id:)
      book = Book.create!(
        title: title,
        description: description,
        author_id: author_id
      )
      { book: book }
    end
  end
end
