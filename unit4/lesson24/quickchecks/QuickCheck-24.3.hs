-- Why is it preferable to use unwords instead of combining your strings
-- with ++?

-- Answer:
-- The ++ operator is specific to lists. In lesson 23, we talked at
-- length about the other text types beyond String.
-- The unwords function has a version for Text as well as String, whereas ++
-- works only on type String. Using unwords makes it much, much easier
-- to refactor your code if you decide to swap out String for Text.
