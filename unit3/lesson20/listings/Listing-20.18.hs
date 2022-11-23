import Data.List
import qualified Data.Map as Map
import Data.Semigroup
import Data.Maybe                                        -- isNothing and isJust

-- YOUR DATA
file1 :: [(Int,Double)]
file1 = [(1, 200.1), (2, 199.5), (3, 199.4), (4, 198.9)
        ,(5, 199.0), (6, 200.2) ,(9, 200.3), (10, 201.2), (12, 202.9)]

file2 :: [(Int,Double)]
file2 = [(11, 201.6), (12, 201.5), (13, 201.5), (14, 203.5)
        ,(15, 204.9), (16, 207.1), (18, 210.5), (20, 208.8)]

file3 :: [(Int,Double)]
file3 = [(10, 201.2), (11, 201.6), (12, 201.5), (13, 201.5)
        ,(14, 203.5), (17, 210.5), (24, 215.1), (25, 218.7)]

file4 :: [(Int,Double)]
file4 = [(26, 219.8), (27, 220.5), (28, 223.8), (29, 222.8)
        ,(30, 223.8), (31, 221.7), (32, 222.3), (33, 220.8)
        ,(34, 219.4), (35, 220.1), (36, 220.6)]


-- YOUR TIME SERIES TYPE
data TS a = TS [Int] [Maybe a]

createTS :: [Int] -> [a] -> TS a
createTS times values = TS completeTimes extendedValues where
    completeTimes = [minimum times .. maximum times]                    -- [Int]
    timeValueMap = Map.fromList (zip times values)                  -- Map Int a
    extendedValues = map (\v -> Map.lookup v timeValueMap) completeTimes -- [Maybe a]

fileToTS :: [(Int, a)] -> TS a
fileToTS timeValuePairs = createTS times values
    where (times, values) = unzip timeValuePairs

showTVpair :: Show a => Int -> Maybe a -> String
showTVpair time (Just value) = concat [show time, "|", show value, "\n"]
showTVpair time Nothing = concat [show time, "|NA\n"]

-- Show instance for your TS type
instance Show a => Show (TS a) where
    show (TS times values) = concat $ zipWith showTVpair times values

-- CONVERT FILES TO TIME SERIES
ts1 :: TS Double
ts1 = fileToTS file1
ts2 :: TS Double
ts2 = fileToTS file2
ts3 :: TS Double
ts3 = fileToTS file3
ts4 :: TS Double
ts4 = fileToTS file4

-- HELPER
insertMaybePair :: Ord k => Map.Map k v -> (k, Maybe v) -> Map.Map k v
insertMaybePair myMap (_, Nothing) = myMap
insertMaybePair myMap (k, Just v) = Map.insert k v myMap

-- COMBINE TIME SERIES
combineTS :: TS a -> TS a -> TS a
combineTS (TS [] []) ts2 = ts2
combineTS ts1 (TS [] []) = ts1
combineTS (TS t1 v1) (TS t2 v2) = TS completeTimes combinedValues
    where
        bothTimes = concat [t1, t2]                                     -- [Int]
        completeTimes = [minimum bothTimes .. maximum bothTimes]        -- [Int]
        tvMap = foldl insertMaybePair Map.empty (zip t1 v1)         -- Map Int a
        updatedMap = foldl insertMaybePair tvMap (zip t2 v2)        -- Map Int a
        combinedValues = map (\t -> Map.lookup t updatedMap) completeTimes -- [Maybe a]

-- SEMIGROUP INSTANCE FOR TIME SERIES
instance Semigroup (TS a) where
    (<>) = combineTS

-- MONOID INSTANCE FOR TIME SERIES
instance Monoid (TS a) where
    mempty = TS [] []
    mappend = (<>)

-- STITCH TOGETHER DATA FROM ALL 4 FILES
tsAll :: TS Double
tsAll = mconcat [ts1,ts2,ts3,ts4]

-- AVERAGING
mean :: Real a => [a] -> Double
mean xs = total / count where
    total = (realToFrac . sum) xs
    count = (realToFrac . length) xs

meanTS :: Real a => TS a -> Maybe Double
meanTS (TS _ []) = Nothing
meanTS (TS times values) = if all isNothing values then Nothing else Just avg
    where
        justVals = filter isJust values
        cleanVals = map fromJust justVals
        avg = mean cleanVals

-- MAKING GENERIC COMPARISON FUNCTIONS
type CompareFunc a = a -> a -> a
type TSCompareFunc a = (Int, Maybe a) -> (Int, Maybe a) -> (Int, Maybe a)

makeTSCompare :: Eq a => CompareFunc a -> TSCompareFunc a
makeTSCompare func = newFunc where
    newFunc (i, Nothing) (_, Nothing) = (i, Nothing)
    newFunc (_, Nothing) (i, val) = (i, val)
    newFunc (i, val) (_, Nothing) = (i, val)
    newFunc (i1, Just v1) (i2, Just v2) =
        if func v1 v2 == v1 then (i1, Just v1) else (i2, Just v2)

-- FUNCTIONS FOR COMPARING TIME SERIES
compareTS :: Eq a => CompareFunc a -> TS a -> Maybe (Int, Maybe a)
compareTS func (TS [] []) = Nothing
compareTS func (TS times values) =
    if all isNothing values then Nothing else Just best
    where
        pairs = zip times values
        best = foldl (makeTSCompare func) (0, Nothing) pairs

-- CREATING min AND max for TIME SERIES
minTS :: Ord a => TS a -> Maybe (Int, Maybe a)
minTS = compareTS min

maxTS :: Ord a => TS a -> Maybe (Int, Maybe a)
maxTS = compareTS max

-- DIFF
diffPair :: Num a => Maybe a -> Maybe a -> Maybe a
