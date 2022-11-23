import System.Environment
import Control.Monad
-- usage: first provide a number that says how many numbers will be inputted
-- then input those numbers. Returns the sum.
-- example:
-- ./sum 3
-- 4
-- 7
-- 8
-- 19
main :: IO ()
main = do
    args <- getArgs                                   -- [String] <- IO [String]
    let linesToRead = if length args > 0 then read (head args) else 0     -- Int

    numbers <- replicateM linesToRead getLine         -- [String] <- IO [String]
    let ints = map read numbers :: [Int]                                -- [Int]

    -- print :: Show a => a -> IO (), so here a = [Int]
    print $ sum ints                                                    -- IO ()


-- SUMMARY

-- Function    Behavior
-- mapM        Takes an IO action and a regular list, performing the action
--             on each item in the list, and returning a list in the IO context
-- mapM_       Same as mapM, but it throws away the values (note the underscore)
-- replicateM  Takes an IO action, an Int n, and then repeats the IO action
--             n times, returning the results in an IO list
-- replicateM_ Same as replicateM, but it throws away the results

-- TYPES

-- mapM :: (Traversable t, Monad m) => (a -> m b) -> t a -> m (t b)
-- mapM_ :: (Foldable t, Monad m) => (a -> m b) -> t a -> m ()
-- replicateM :: Applicative m => Int -> m a -> m [a]
-- replicateM_ :: Applicative m => Int -> m a -> m ()
