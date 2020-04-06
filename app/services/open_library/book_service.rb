module OpenLibrary
  class BookService < BaseService
    PATH = '/books'.freeze

    def find_by(params)
      bibkeys = params.map { |e| e.join(':') }.join(',')

      result = self.class.get(PATH, {
                                query: {
                                  format: @format,
                                  bibkeys: bibkeys,
                                  jscmd: @jscmd
                                }
                              }).body

      JSON.parse(result)
    end

    def find(isbn)
      data_book = find_by(ISBN: isbn)

      return unless data_book.key?("ISBN:#{isbn}")

      book = data_book["ISBN:#{isbn}"]

      {
        isbn: isbn, title: book['title'], subtitle: book['subtitle'],
        number_of_pages: book['number_of_pages'],
        authors: book['authors'].map { |author| author['name'] }
      }
    end
  end
end
