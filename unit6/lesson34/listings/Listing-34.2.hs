class Monoid m where
    mempty :: m
    mappend :: m -> m -> m
    mconcat :: [m] -> m
