genApiRequestBuilder :: (String -> String -> String -> String) -> String -> (String -> String -> String)
genApiRequestBuilder hostBuilder apiKey =
    (\resource id -> hostBuilder apiKey resource id)
