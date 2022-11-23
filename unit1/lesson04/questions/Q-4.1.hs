-- Q4.1
-- Anything that can be compared in Haskell (for example, [Char] ,
-- which you use for the names in your name tuples)
-- can be compared with a function called compare .
-- The compare function returns GT , LT , or EQ .
-- Rewrite compareLastNames by using compare.

compareLastNames :: (String, String) -> (String, String) -> Ordering
compareLastNames name1 name2 =
    if result == EQ
    then compare (fst name1) (fst name2)
    else result
    where result = compare (snd name1) (snd name2)
