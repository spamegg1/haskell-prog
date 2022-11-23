-- Does your implementation of Semigroup for Integers support associativity?
instance Semigroup Integer where
    (<>) x y = x + y

-- Answer: YES.
-- Because addition of integers is associative: 1 + (2 + 3) = (1 + 2) + 3.

-- *Main> (1<>2)<>3
-- 6
-- *Main> 1<>(2<>3)
-- 6
-- *Main>
