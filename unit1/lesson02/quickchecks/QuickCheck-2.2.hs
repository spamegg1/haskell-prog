-- Even languages that don’t have a ++ operator allow for a += operator, often
-- also used for incrementing a value. For example, x += 2 increments x by 2.
-- You can think of += as function that follows our rules:
-- it takes a value and returns a value.
-- Does this mean += can exist in Haskell?

-- Answer: NO.
-- Although the += operator returns and takes an argument, just like ++,
-- every time you call +=, you get a different result.
