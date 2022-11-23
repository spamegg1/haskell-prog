import System.Environment                   -- needed for getArgs :: IO [String]
import Control.Monad                                    -- needed for replicateM

-- example:
-- ./sum 3  (this means "I'm gonna input 3 numbers")
-- 4       (each new number is inputted on a different line after hitting Enter)
-- 7
-- 8
-- 19 (this is 4+7+8 = 19)
main :: IO ()
main = do
    args <- getArgs                                   -- [String] <- IO [String]
    let linesToRead = if length args > 0 then read (head args) else 0

    -- replicateM :: Applicative m => Int -> m a -> m [a]
    -- linesToRead :: Int
    -- getLine :: IO String = m a
    -- this means m = IO, a = String, and IO is an instance of Applicative
    -- so replicateM becomes: Applicative IO => Int -> IO String -> IO [String]
    -- so replicateM linesToRead getLine is: IO [String]

    numbers <- replicateM linesToRead getLine         -- [String] <- IO [String]
    print "sum goes here"            -- we don't know how to compute the sum yet
