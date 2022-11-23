-- See which flavor Haskell thinks is superior by deriving the Ord type class.
data Icecream = Chocolate | Vanilla deriving (Show, Eq, Ord)

-- Answer:
-- If you add deriving Ord to your definition of Icecream,
-- Haskell defaults to the order of the data constructors for
-- determining Ord. So Vanilla will be greater than Chocolate.
