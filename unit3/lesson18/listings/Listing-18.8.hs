data Triple a = Triple a a a deriving Show

transform :: (a -> a) -> Triple a -> Triple a
transform f (Triple x y z) = Triple (f x) (f y) (f z)

type Point3D = Triple Double

aPoint :: Point3D
aPoint = Triple 0.1 53.2 12.3

-- GHCi> transform (* 3) aPoint
-- Triple 0.30000000000000004 159.60000000000002 36.900000000000006

type FullName = Triple String

aPerson :: FullName
aPerson = Triple "Howard" "Phillips" "Lovecraft"

-- GHCi> transform reverse aPerson
-- Triple "drawoH" "spillihP" "tfarcevoL"
