# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject

    # Search using elastic search
    field :search_books, [Types::BookType], null: false do
      argument :query, String, required: true
    end

    def search_books(query:)
      Book.search(query).records
    end

     # Fetch all books
    field :books, [Types::BookType], null: false

    def books
      Book.includes(:author).all
    end

    # Fetch one book by ID
    field :book, Types::BookType, null: false do
      argument :id, ID, required: true
    end

    def book(id:)
      Book.find(id)
    end

    # Fetch all authors
    field :authors, [Types::AuthorType], null: false

    def authors
      Author.all
    end
  end
end
