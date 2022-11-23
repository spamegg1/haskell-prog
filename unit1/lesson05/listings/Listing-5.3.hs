getRequestURL :: String -> String -> String -> String -> String
getRequestURL host apiKey resource id =
    host ++ "/" ++ resource ++ "/" ++ id ++ "?token=" ++ apiKey

genHostRequestBuilder :: String -> String -> String -> String -> String
genHostRequestBuilder host = (\apiKey resource id ->
    getRequestURL host apiKey resource id)

exampleUrlBuilder :: String -> String -> String -> String
exampleUrlBuilder = genHostRequestBuilder "http://example.com"
