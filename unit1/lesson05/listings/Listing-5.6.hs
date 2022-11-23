getRequestURL :: String -> String -> String -> String -> String
getRequestURL host apiKey resource id =
    host ++ "/" ++ resource ++ "/" ++ id ++ "?token=" ++ apiKey

exampleUrlBuilder :: String -> String -> String -> String
exampleUrlBuilder = getRequestURL "http://example.com"

myExampleUrlBuilder :: String -> String -> String
myExampleUrlBuilder = exampleUrlBuilder "1337hAsk3ll"
