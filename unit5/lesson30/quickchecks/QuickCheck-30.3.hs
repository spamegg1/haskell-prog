-- Combine readInt and printDouble (defined next) into a single IO action:
readInt :: IO Int
readInt = read <$> getLine

printDouble :: Int -> IO ()
printDouble n = print (n*2)

-- Answer:
main :: IO ()
main = readInt >>= printDouble
