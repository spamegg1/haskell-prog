getRequestURL :: String -> String -> String -> String -> String
getRequestURL host apiKey resource id =
    host ++ "/" ++ resource ++ "/" ++ id ++ "?token=" ++ apiKey
