require 'rails_helper'

describe Api::V1::BookSuggestionsController, type: :controller do
  describe 'POST #create' do
    subject(:http_request) do
      post :create, params: { book_suggestion: attr_book_suggestion }
    end

    context 'When creating an valid BookSuggestion' do
      let(:attr_book_suggestion) { attributes_for(:book_suggestion) }

      it 'creates a new book_suggestion' do
        http_request_valid_parsed = JSON.parse(http_request.parsed_body)

        expect(http_request_valid_parsed['author']).to eq(attr_book_suggestion[:author])
        expect(http_request_valid_parsed['title']).to eq(attr_book_suggestion[:title])
        expect(http_request_valid_parsed['link']).to eq(attr_book_suggestion[:link])
        expect(http_request_valid_parsed['publisher']).to eq(attr_book_suggestion[:publisher])
        expect(http_request_valid_parsed['year']).to eq(attr_book_suggestion[:year])
      end

      it 'responds with 201 status' do
        expect(http_request).to have_http_status(:created)
      end
    end

    context 'When creating an invalid BookSuggestion' do
      let(:attr_book_suggestion) { attributes_for(:book_suggestion, year: nil) }

      it 'cant create a new book_suggestion' do
        expect(http_request.body.to_json) =~ JSON.parse(
          { 'error': "Validation failed: Year can't be blank" }.to_json
        )
      end

      it 'responds with 422 status' do
        expect(http_request).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
