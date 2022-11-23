-- As each argument is passed to makeAddress,
-- write out the type signature of the returned function.

-- Answer:
-- Starting with our type original type signature:
-- makeAddress :: Int -> String -> String -> (Int,String,String)
-- And your type signatures is now as follows:
-- String -> String -> (Int,String,String)
-- Then pass in the first String:
-- ((makeAddress 123) "Happy St")
-- And here’s the type signature:
-- String -> (Int,String,String)
-- Finally, if you pass in all of your arguments, you get the type of the result:
-- (((makeAddress 123) "Happy St") "Haskell Town")
-- (Int,String,String)