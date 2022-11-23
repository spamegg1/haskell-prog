toPart :: String -> String
toPart recipient = "Dear " ++ recipient ++ ",\n"

bodyPart :: String -> String
bodyPart bookTitle = "Thanks for buying " ++ bookTitle ++ ".\n"

fromPart :: String -> String
fromPart author = "Thanks,\n" ++ author

createEmail :: String -> String -> String -> String
createEmail recipient bookTitle author =
    toPart recipient ++ bodyPart bookTitle ++ fromPart author

main :: IO ()
main = do
    print "Who is the email for?"
    recipient <- getLine
    print "What is the title?"
    bookTitle <- getLine
    print "Who is the Author?"
    author <- getLine
    print $ createEmail recipient bookTitle author
