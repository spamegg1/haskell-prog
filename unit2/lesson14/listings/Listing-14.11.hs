type Name = (String, String)

instance Ord Name where                                                -- error!
    compare (f1,l1) (f2,l2) = compare (l1,f1) (l2,f2)

names :: [Name]
names = [ ("Emil","Cioran")
        , ("Eugene","Thacker")
        , ("Friedrich","Nietzsche")]
