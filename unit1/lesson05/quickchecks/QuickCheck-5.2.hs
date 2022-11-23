-- Write a version of genApiRequestBuilder that also
-- takes the resource as an argument.
genApiRequestBuilder :: (String -> String -> String -> String) -> String -> String -> (String -> String)
genApiRequestBuilder hostBuilder apiKey resource =
    (\id -> hostBuilder apiKey resource id)
