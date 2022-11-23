-- What’s the type of wrap (Box 'a')?

-- Answer: Box (Box Char)

data Box a = Box a deriving Show

wrap :: a -> Box a
wrap x = Box x

unwrap :: Box a -> a
unwrap (Box x) = x

-- GHCi> :t wrap (Box 'a')
-- Box (Box Char)
