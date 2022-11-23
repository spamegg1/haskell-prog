echoVerbose :: IO ()
echoVerbose =
    putStrLn "Enter a string and we'll echo it!" >> getLine >>= putStrLn

main :: IO ()
main = echoVerbose
