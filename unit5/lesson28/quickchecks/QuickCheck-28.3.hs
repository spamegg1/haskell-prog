-- Use the pattern for using binary values in a context for the functions (*),
-- div, and mod on these two values:
val1 = Just 10
val2 = Just 5

-- Answer:
res1 = (*) <$> val1 <*> val2
res2 = div <$> val1 <*> val2
res3 = mod <$> val1 <*> val2
