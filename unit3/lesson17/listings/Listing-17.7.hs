class Monoid a where        -- list examples:
    mempty :: a             -- mempty :: [a] = []
    mappend :: a -> a -> a  -- mappend [1] [2,3] = [1,2,3]
    mconcat :: [a] -> a     -- mconcat [[1], [2,3]] = [1,2,3]

-- mempty and mappend are required, mconcat is not.
-- implement mempty and mappend, you get mconcat for free:
--
-- mconcat = foldr mappend mempty
--
-- another mconcat example:
-- mconcat :: [[Char]] -> [Char]
-- GHCi> mconcat ["does"," this"," make"," sense?"]
-- "does this make sense?"

-- MONOID LAWS:
-- 1. right identity
-- mappend mempty x = x                           (e.g. [] ++ [1,2,3] = [1,2,3])
--
-- 2. left identity
-- mappend x mempty = x                           (e.g. [1,2,3] ++ [] = [1,2,3])
--
-- 3. associativity (from semigroup)
-- mappend x (mappend y z) = mappend (mappend x y) z
--
-- ex. [1] ++ ([2] ++ [3]) = ([1] ++ [2]) ++ [3]
--
-- 4. definition of mconcat
-- mconcat = foldr mappend mempty
--
