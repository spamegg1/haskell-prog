-- Make a builder function that’s specifically for http://example.com, the
-- 1337hAsk3ll API key, and the book resource.
-- That’s a function that requires only the ID of a specific
-- book and then generates the full URL.

getRequestURL :: String -> String -> String -> String -> String
getRequestURL host apiKey resource id =
    host ++ "/" ++ resource ++ "/" ++ id ++ "?token=" ++ apiKey

myBuilder :: String -> String
myBuilder = getRequestURL "http://example.com" "1337hAsk3ll" "books"
