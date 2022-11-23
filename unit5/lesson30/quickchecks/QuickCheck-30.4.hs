-- Turn (+ 2) from type Num a => a -> a to type Num a => a -> IO a using a
-- lambda and return. Use :t in GHCi to double-check that you’re getting the
-- correct type.

-- Answer:
addTwo :: Num a => a -> a
addTwo = (+ 2)

addTwoIO :: Num a => a -> IO a
addTwoIO = (\n -> return (addTwo n))
