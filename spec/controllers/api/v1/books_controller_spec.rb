require 'rails_helper'

describe Api::V1::BooksController, type: :controller do
  include_context 'Authenticated User'
  describe 'GET #index' do
    context 'When fetching all the books' do
      let(:books) { create_list(:book, 3) }

      subject(:http_request) { get :index }

      it 'responses with the books json' do
        expected = ActiveModel::Serializer::CollectionSerializer.new(
          books, each_serializer: BookSerializer
        ).to_json

        expect(subject.body.to_json) =~ JSON.parse(expected)
      end

      it 'responds with 200 status' do
        expect(subject).to have_http_status(:ok)
      end
    end
  end

  describe 'GET #show' do
    context 'When fetching a book' do
      let(:book) { create(:book) }

      subject(:http_request) { get :show, params: { id: book.id } }

      it 'responses with the book json' do
        expect(subject.body).to eq BookSerializer.new(
          book, root: false
        ).to_json
      end

      it 'responds with 200 status' do
        expect(subject).to have_http_status(:ok)
      end
    end

    context 'When request a book and this is\'n exist' do
      let(:book_id) { 100 }
      subject(:http_request) { get :show, params: { id: book_id } }

      it 'responses with the book json have error message' do
        expect(subject.body.to_json) =~ JSON.parse(
          { 'error': 'Couldn\'t find Book with \'id\'=' + book_id.to_s }.to_json
        )
      end

      it 'responds with 401 status' do
        expect(subject).to have_http_status(:not_found)
      end
    end
  end
end
