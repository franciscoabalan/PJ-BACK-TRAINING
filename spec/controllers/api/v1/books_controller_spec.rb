require 'rails_helper'

describe Api::V1::BooksController, type: :controller do
  include_context 'Authenticated User'
  describe 'GET #index' do
    subject(:http_request) { get :index }

    context 'When fetching all the books' do
      let(:books) { create_list(:book, 3) }

      it 'responses with the books json' do
        expected = ActiveModel::Serializer::CollectionSerializer.new(
          books, each_serializer: BookSerializer
        ).to_json

        expect(http_request.body.to_json) =~ JSON.parse(expected)
      end

      it 'responds with 200 status' do
        expect(http_request).to have_http_status(:ok)
      end
    end
  end

  describe 'GET #show' do
    subject(:http_request) { get :show, params: { id: book.id } }

    context 'When fetching a book' do
      let(:book) { create(:book) }

      it 'responses with the book json' do
        expect(http_request.body).to eq BookSerializer.new(
          book, root: false
        ).to_json
      end

      it 'responds with 200 status' do
        expect(http_request).to have_http_status(:ok)
      end
    end

    context 'When not found a requested book' do
      let(:book_id) { -1 }
      subject(:http_request) { get :show, params: { id: book_id } }

      it 'responses with the correct error' do
        expect(http_request.body.to_json) =~ JSON.parse(
          { 'error': "Couldn't find Book with 'id'= #{book_id}" }.to_json
        )
      end

      it 'responds with 404 status' do
        expect(http_request).to have_http_status(:not_found)
      end
    end
  end
end
