data User = User {
    name :: String, gamerId :: Int, score :: Int
} deriving Show


serverUsername :: Maybe String
serverUsername = Just "Sue"

serverGamerId :: Maybe Int
serverGamerId = Just 1337

serverScore :: Maybe Int
serverScore = Just 9001

user = User <$> serverUsername <*> serverGamerId <*> serverScore
