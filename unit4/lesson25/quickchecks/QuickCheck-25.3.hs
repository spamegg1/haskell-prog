-- Write an IO action that returns a random Char.

-- Answer:
import System.Random                                                -- randomRIO
randomChar :: IO Char
randomChar = do
    int <- randomRIO (0, 255)
    return $ toEnum int
