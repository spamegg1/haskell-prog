-- Use <$> and <*> to combine two Maybe String types with ++.

-- Answer:
msg = (++) <$> Just "Learn" <*> Just " Haskell"

-- Some practice:
-- f = Maybe

-- (<$>) ::     (a -> b)                  -> f a -> f b
-- (++)  :: [Char] -> [Char] -> [Char]
-- this means a = [Char]
--            b = [Char] -> [Char]
--                       a                     b
--                     ------           ----------------
-- (<$>) (++) :: Maybe [Char] -> Maybe ([Char] -> [Char])
-- (<$>) (++)      Just "a"   :: Maybe ([Char] -> [Char])

-- (<*>) ::   f        (a -> b)      ->     f a      ->     f b
-- (<*>) :: Maybe ([Char] -> [Char]) -> Maybe [Char] -> Maybe [Char]
-- (<*>)     ((<$>) (++) (Just "a")) :: Maybe [Char] -> Maybe [Char]
-- (<*>)     ((<$>) (++) (Just "a"))      (Just "b") :: Maybe [Char]

x1 :: Maybe ([Char] -> [Char])
x1 = (++) <$> Just "a"         -- infix
x2 :: Maybe ([Char] -> [Char])
x2 = (<$>) (++) (Just "a")     -- prefix

y1 :: Maybe [Char]
y1 = x1 <*> Just "b"           -- infix
y2 :: Maybe [Char]
y2 = (<*>) x2 (Just "b")       -- prefix
