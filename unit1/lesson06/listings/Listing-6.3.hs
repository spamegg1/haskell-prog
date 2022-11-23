respond :: String -> String
respond phrase =
    if '!' ` elem ` phrase
    then "wow!"
    else "uh.. okay"
