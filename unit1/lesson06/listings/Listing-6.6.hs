assignToGroups :: Int -> [a] -> [(Int, a)]
assignToGroups n aList = zip groups aList
    where groups = cycle [1..n]
