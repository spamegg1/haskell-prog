-- Can you use (/) to make Int a Semigroup?

-- Answer: NO.
-- Because you cannot divide by zero, and division does not
-- always return an integer.

instance Semigroup Integer where
    (<>) x y = x / y

-- *Main> :l QuickCheck-17.2
-- [1 of 1] Compiling Main             ( QuickCheck-17.2.hs, interpreted )

-- QuickCheck-17.2.hs:5:16: error:
--     • No instance for (Fractional Integer) arising from a use of ‘/’
--     • In the expression: x / y
--       In an equation for ‘<>’: (<>) x y = x / y
--       In the instance declaration for ‘Semigroup Integer’
--   |
-- 5 |     (<>) x y = x / y
--   |                ^^^^^
-- Failed, no modules loaded.
