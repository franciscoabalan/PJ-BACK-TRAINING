module OpenLibraryMocks
  class BookService
    include WebMock::API

    def find_request_success
      stub_request(:get, 'https://openlibrary.org/api/books?bibkeys=ISBN:0385472579&format=json&jscmd=data')
        .to_return(
          status: 200,
          body: File.read('./spec/support/fixtures/open_library/book_service.json')
        )
    end
  end
end
