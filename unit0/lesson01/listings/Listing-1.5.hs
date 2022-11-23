toPart :: String -> String
toPart recipient = "Dear " ++ recipient ++ ",\n"

bodyPart :: String -> String
bodyPart bookTitle = "Thanks for buying " ++ bookTitle ++ ".\n"

fromPart :: String -> String
fromPart author = "Thanks,\n" ++ author

createEmail :: String -> String -> String -> String
createEmail recipient bookTitle author =
    toPart recipient ++ bodyPart bookTitle ++ fromPart author
