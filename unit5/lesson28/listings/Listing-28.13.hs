data User = User {
    name :: String, gamerId :: Int, score :: Int
} deriving Show

readInt :: IO Int
readInt = read <$> getLine

main :: IO ()
main = do
    putStrLn "Enter username, gamerId and score"
    user <- User <$> getLine <*> readInt <*> readInt
    print user
