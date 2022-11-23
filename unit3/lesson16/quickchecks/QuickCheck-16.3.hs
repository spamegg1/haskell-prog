-- Assume that Creator is an instance of Show. Write a madeBy function that
-- has the type StoreItem -> String and
-- does its best to determine who made the StoreItem.

-- Answer:
type FirstName = String
type LastName = String
type MiddleName = String

data Name = Name FirstName LastName
    | NameWithMiddle FirstName MiddleName LastName
    | TwoInitialsWithLast Char Char LastName
    | FirstNameWithTwoInits FirstName Char Char
    deriving Show

data Author = Author Name deriving Show
data Artist = Person Name | Band String deriving Show
data Creator = AuthorCreator Author | ArtistCreator Artist deriving Show

data Book = Book {
    author :: Creator,
    isbn :: String,
    bookTitle :: String,
    bookYear :: Int,
    bookPrice :: Double
} deriving Show

data VinylRecord = VinylRecord {
    artist :: Creator,
    recordTitle :: String,
    recordYear :: Int,
    recordPrice :: Double
} deriving Show

data CollectibleToy = CollectibleToy {
    name :: String,
    description :: String,
    toyPrice :: Double
} deriving Show

data StoreItem = BookItem Book | RecordItem VinylRecord | ToyItem CollectibleToy
    deriving Show

madeBy :: StoreItem -> String
madeBy (BookItem book) = show (author book)
madeBy (RecordItem record) = show (artist record)
madeBy _ = "unknown"
