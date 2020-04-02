require 'rails_helper'

describe Api::V1::BookSuggestionsController, type: :controller do
  describe 'POST #create' do
    let(:attr_valid) { attributes_for(:book_suggestion) }
    let(:attr_invalid) { attributes_for(:book_suggestion, year: nil) }

    subject(:http_request_valid) do
      post :create, params: { book_suggestion: attr_valid }
    end

    subject(:http_request_invalid) do
      post :create, params: { book_suggestion: attr_invalid }
    end

    context 'When creating an valid BookSuggestion' do
      it 'creates a new book_suggestion' do
        http_request_valid_parsed = JSON.parse(http_request_valid.parsed_body)

        expect(http_request_valid_parsed['author']).to eq(attr_valid[:author])
        expect(http_request_valid_parsed['title']).to eq(attr_valid[:title])
        expect(http_request_valid_parsed['link']).to eq(attr_valid[:link])
        expect(http_request_valid_parsed['publisher']).to eq(attr_valid[:publisher])
        expect(http_request_valid_parsed['year']).to eq(attr_valid[:year])
      end

      it 'responds with 201 status' do
        expect(http_request_valid).to have_http_status(:created)
      end
    end

    context 'When creating an invalid BookSuggestion' do
      it 'cant create a new book_suggestion' do
        expect(http_request_invalid.body.to_json) =~ JSON.parse(
          { 'error': "Validation failed: Year can't be blank" }.to_json
        )
      end

      it 'responds with 422 status' do
        expect(http_request_invalid).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
