type FirstName = String
type LastName = String
type MiddleName = String

data Name = Name FirstName LastName
    | NameWithMiddle FirstName MiddleName LastName
    | TwoInitialsWithLast Char Char LastName deriving Show

data Author = Author Name deriving Show
data Artist = Person Name | Band String deriving Show
data Creator = AuthorCreator Author | ArtistCreator Artist deriving Show

hpLoveCraft :: Creator
hpLoveCraft = AuthorCreator (Author (TwoInitialsWithLast 'H' 'P' "Lovecraft"))

-- *Main> :l Listing-16.14
-- [1 of 1] Compiling Main             ( Listing-16.14.hs, interpreted )
-- Ok, one module loaded.
-- *Main> hpLoveCraft
-- AuthorCreator (Author (TwoInitialsWithLast 'H' 'P' "Lovecraft"))
-- *Main>
