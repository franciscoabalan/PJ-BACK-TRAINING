module OpenLibrary
  class BookService < BaseService
    def find_by(params)
      params_string = params.map { |e| e.join(':') }.join(',')

      url = "/books?bibkeys=#{params_string}&format=#{@format}&jscmd=#{@jscmd}"
      JSON.parse(self.class.get(url).body)
    end

    def find(isbn)
      data_book = find_by ISBN: isbn

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
