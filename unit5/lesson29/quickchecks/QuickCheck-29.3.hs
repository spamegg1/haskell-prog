-- Suppose you want to make it so that
-- (pure +) <*> (1,2) <*> (3,4) = (1+2,1+4,2+3,2+4) = (3,5,5,6)
-- Why doesn’t this work?

-- Answer:
-- This doesn’t work because (3,5,5,6) is an entirely different type than
-- (1,2) or (3,4). The first is type (a,b,c,d), and the other two are (a,b).
