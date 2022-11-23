-- Q16.1
-- To further complicate the items in your store, you eventually keep an
-- inventory of free pamphlets. Pamphlets have a title, a description,
-- and a contact field for the organization that provides the pamphlet.
-- Create the Pamphlet type and add it to StoreItem .
-- Additionally, modify the price so that it works with Pamphlet .

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
    toyDescription :: String,
    toyPrice :: Double
}

data Pamphlet = Pamphlet {
    pamphletTitle :: String,
    pamphletDescription :: String,
    contact :: String
}

data StoreItem = BookItem Book
    | RecordItem VinylRecord
    | ToyItem CollectibleToy
    | PamphletItem Pamphlet

price :: StoreItem -> Double
price (BookItem book) = bookPrice book
price (RecordItem record) = recordPrice record
price (ToyItem toy) = toyPrice toy
price (PamphletItem _) = 0.0
