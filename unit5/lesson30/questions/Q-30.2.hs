-- Q30.2
-- To prove that Monad is strictly more powerful than Applicative , write a
-- universal version of <*>, called allApp, that defines <*> for all members of
-- the Monad type class. Because it works for all instances of Monad, the only
-- functions you can use are the methods required by the Monad type class
-- (and lambda functions). To get you started, here’s your type signature:
-- This question is much trickier than the last one. Two hints:
-- Try to think exclusively in terms of the type signatures.
-- Use <$> if you want and replace it with your answer to Q29.1
allApp :: Monad m => m (a -> b) -> m a -> m b
allApp mab ma = mab >>= (\ab -> ma >>= (\a -> return (ab a)))

test = allApp (pure (+ 2)) (Just 2) -- Just 4
