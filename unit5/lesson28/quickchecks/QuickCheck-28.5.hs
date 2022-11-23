-- Show the result of creating a user with a missing (Nothing) userName.

-- Answer:
data User = User {
    name :: String, gamerId :: Int, score :: Int
} deriving Show

serverUsername :: Maybe String
serverUsername = Just "Sue"

serverGamerId :: Maybe Int
serverGamerId = Just 1337

serverScore :: Maybe Int
serverScore = Just 9001

user = User <$> Nothing <*> serverGamerId <*> serverScore
-- GHCi> user
-- Nothing
