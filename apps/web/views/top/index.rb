module Web::Views::Top
  class Index
    include Web::View
    def header
      html.h2 "Hello"
    end
  end
end
