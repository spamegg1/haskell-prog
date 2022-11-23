-- Q29.2
-- Translate the following expression into one where the result is a Maybe Int.
-- The catch is that you may not add (or remove) anything to the code
-- except pure and <*>. You can’t use the Just constructor or any extra
-- parentheses.
example :: Int
example = (*) ((+) 2 4) 6
-- Here’s the type signature for your answer:
exampleMaybe :: Maybe Int

-- Answer:
exampleMaybe = pure (*) <*> (pure (+) <*> pure 2 <*> pure 4) <*> pure 6
-- Just 36
