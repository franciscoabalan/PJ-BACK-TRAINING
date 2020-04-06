module OpenLibrary
  class BaseService
    include HTTParty
    base_uri 'https://openlibrary.org/api'
    attr_reader :format, :jscmd

    def initialize
      @format = 'json'
      @jscmd = 'data'
    end
  end
end
