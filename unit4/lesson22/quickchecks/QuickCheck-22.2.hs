-- Write your own version of replicateM, myReplicateM, that uses mapM.
-- (Don’t worry too much about the type signature.)

-- Answer: I completely disagree, we should care a TON about the type signature.
myReplicateM :: Monad m => Int -> m a -> m [a]
myReplicateM int action = mapM (\_ -> action) [1..int]
