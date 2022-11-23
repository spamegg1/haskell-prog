type FirstName = String
type LastName = String
type MiddleName = String
data Name = Name FirstName LastName
    | NameWithMiddleName FirstName MiddleName LastName


data Author = Author Name
data Artist = Person Name | Band String

data Creator = AuthorCreator Author | ArtistCreator Artist
