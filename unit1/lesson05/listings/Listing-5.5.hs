getRequestURL :: String -> String -> String -> String -> String
getRequestURL host apiKey resource id =
    host ++ "/" ++ resource ++ "/" ++ id ++ "?token=" ++ apiKey

genHostRequestBuilder :: String -> String -> String -> String -> String
genHostRequestBuilder host = (\apiKey resource id ->
    getRequestURL host apiKey resource id)

exampleUrlBuilder :: String -> String -> String -> String
exampleUrlBuilder = genHostRequestBuilder "http://example.com"

genApiRequestBuilder :: (String -> String -> String -> String) -> String -> (String -> String -> String)
genApiRequestBuilder hostBuilder apiKey =
    (\resource id -> hostBuilder apiKey resource id)

myExampleUrlBuilder :: String -> String -> String
myExampleUrlBuilder = genApiRequestBuilder exampleUrlBuilder "1337hAsk3ll"

-- myExampleUrlBuilder "book" "1234"
