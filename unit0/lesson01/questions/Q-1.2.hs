-- Q1.2 Modify the text in each of the functions in first_prog.hs, test them out in GHCi
-- while you do this, and, finally, compile a new version of your email templating program
-- so that the executable is named email.

toPart :: String -> String
toPart recipient = "Hello " ++ recipient ++ ",\n"

bodyPart :: String -> String
bodyPart bookTitle = "Thanks for reading " ++ bookTitle ++ ".\n"

fromPart :: String -> String
fromPart author = "Sincerely,\n" ++ author

createEmail :: String -> String -> String -> String
createEmail recipient bookTitle author =
    toPart recipient ++ bodyPart bookTitle ++ fromPart author

main :: IO ()
main = do
    print "Who is the recipient of the email?"
    recipient <- getLine
    print "What's the book called??"
    bookTitle <- getLine
    print "Who wrote the book?"
    author <- getLine
    print (createEmail recipient bookTitle author)
