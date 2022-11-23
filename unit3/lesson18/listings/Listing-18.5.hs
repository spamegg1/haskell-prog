data Triple a = Triple a a a deriving Show
type Initials = Triple Char

initials :: Initials
initials = Triple 'H' 'P' 'L'
