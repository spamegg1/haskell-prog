head :: Monoid a => [a] -> a
head (x : _) = x
head [] = mempty

