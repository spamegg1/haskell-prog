data Color = Red | Yellow | Blue | Green | Purple | Orange | Brown
    deriving (Eq, Show)

-- this is not associative, but it still passes the Haskell compiler:
instance Semigroup Color where
    (<>) Red Blue = Purple
    (<>) Blue Red = Purple
    (<>) Yellow Blue = Green
    (<>) Blue Yellow = Green
    (<>) Red Yellow = Orange
    (<>) Yellow Red = Orange
    (<>) a b = if a == b then a else Brown
