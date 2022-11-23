-- Write filter by using guard and do-notation.

-- Answer:
import Control.Monad                   -- guard :: Alternative f => Bool -> f ()
import Control.Applicative

myFilter :: (b -> Bool) -> [b] -> [b]
myFilter pred bs = do
    b <- bs
    guard $ pred b
    return b

-- Optional: implement guard
-- class Applicative f => Alternative f where
--     empty :: f a
--     (<|>) :: f a -> f a -> f a
myGuard :: Alternative f => Bool -> f ()
myGuard False = empty
myGuard True = pure ()                  -- f is also Applicative, so it has pure

guardIO :: IO ()
guardIO = guard True
