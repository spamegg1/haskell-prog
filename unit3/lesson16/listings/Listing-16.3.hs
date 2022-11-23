data AuthorName = AuthorName String String
data Book = Book {
    author :: AuthorName,
    isbn :: String,
    title :: String,
    year :: Int,
    price :: Double
}

-- GHCi> book = Book { author = AuthorName "spam" "egg", isbn = "isbn", title = "title", year = 2020, price = 23.45 }
