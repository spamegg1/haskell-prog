-- instance Functor Maybe where
--     fmap func (Just n) = Just (func n)
--     fmap _ Nothing = Nothing

-- GHCi> :i Functor
-- instance Functor Maybe -- Defined in ‘GHC.Base’

-- GHCi> fmap (+ 1) successfulRequest
-- Just 7
-- GHCi> fmap (+ 1) failedRequest
-- Nothing

-- GHCi> (+ 1) <$> successfulRequest
-- Just 7
-- GHCi> (+ 1) <$> failedRequest
-- Nothing
