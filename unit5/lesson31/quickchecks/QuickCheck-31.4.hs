-- Write a simple function Maybe String -> String that will print failed/passed
-- if there’s a result and error id not found for the Nothing constructor.

-- Answer:
fun :: Maybe String -> String
fun (Just str) = str
fun Nothing = "error id not found"
