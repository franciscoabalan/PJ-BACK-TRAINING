require 'rails_helper'

describe Api::V1::OpenLibrariesController, type: :controller do
  describe 'GET #show' do
    subject(:http_request) do
      get :book, params: { isbn: isbn }
    end

    context 'When search a exist book' do
      let(:isbn) { '0385472579' }
      let(:book_service) { instance_double(OpenLibrary::BookService) }
      let(:mock_response) do
        {
          isbn: '0385472579',
          title: 'Zen speaks',
          subtitle: 'shouts of nothingness',
          number_of_pages: 159,
          authors: [
            'Zhizhong Cai'
          ]
        }
      end

      before do
        allow(OpenLibrary::BookService).to receive(:new).and_return(book_service)
        allow(book_service).to receive(:find).and_return(mock_response)
      end

      it 'returns the book' do
        expect(http_request.body).to eq mock_response.to_json
      end

      it 'responds with 200 status code' do
        expect(http_request).to have_http_status :ok
      end
    end

    context 'When search a non-exist book' do
      let(:isbn) { '0385472570' }
      let(:book_service) { instance_double(OpenLibrary::BookService) }
      let(:mock_response) do
        {
          'error': "Book #{isbn}, Not found"
        }
      end

      before do
        allow(OpenLibrary::BookService).to receive(:new).and_return(book_service)
        allow(book_service).to receive(:find).and_return(nil)
      end

      it 'returns the error message' do
        expect(http_request.body).to eq mock_response.to_json
      end

      it 'responds with 404 status code' do
        expect(http_request).to have_http_status(:not_found)
      end
    end
  end
end
