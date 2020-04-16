require 'rails_helper'

describe OpenLibrary::BookService do
  describe '#find' do
    subject(:book) { described_class.new.find(isbn) }

    context 'When request a valid ISBN' do
      let(:isbn) { '0385472579' }
      let(:body) do
        {
          query: {
            format: 'json',
            bibkeys: "ISBN:#{isbn}",
            jscmd: 'data'
          }
        }
      end
      let(:path) { 'https://openlibrary.org/api/books' }

      before do
        OpenLibraryMocks::BookService.new.find_request_success
      end

      it 'return a success data from openlibrary' do
        book
        expect(WebMock).to(have_requested(:get, path).with(body))
      end

      it 'return a Hash' do
        expect(book).to be_a(Hash)
      end

      it 'return a quering isbn' do
        expect(book[:isbn]).to be(isbn)
      end
    end
  end
end
