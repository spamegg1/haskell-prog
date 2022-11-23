-- (<>) :: Semigroup a => a -> a -> a
instance Semigroup Integer where
    (<>) x y = x + y
