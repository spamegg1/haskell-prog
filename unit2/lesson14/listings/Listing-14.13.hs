data Name = Name (String, String) deriving (Show, Eq)
-- newtype Name = Name (String, String) deriving (Show, Eq)

instance Ord Name where
    compare (Name(f1,l1)) (Name(f2,l2)) = compare (l1,f1) (l2,f2)

names :: [Name]
names = [ Name ("Emil","Cioran")
        , Name ("Eugene","Thacker")
        , Name ("Friedrich","Nietzsche")]

-- GHCi> import Data.List
-- GHCi> sort names
-- [Name ("Emil","Cioran"),Name ("Friedrich","Nietzsche"),
-- ➥ Name ("Eugene","Thacker")]
