-- If you ran the :info examples, you likely noticed that the type
-- Word has come up a few times. Without looking at external resources,
-- use :info to explore Word and the relevant type classes to come up with
-- your own explanation for the Word type. How is it different from Int ?

-- Answer:
-- If you look at the type classes that each belongs to,
-- you get a good sense of your answer.
-- For Word :
instance Bounded Word
instance Enum Word
instance Eq Word
instance Integral Word
instance Num Word
instance Ord Word
instance Read Word
instance Real Word
instance Show Word
-- For Int :
instance Bounded Int
instance Enum Int
instance Eq Int
instance Integral Int
instance Num Int
instance Ord Int
instance Read Int
instance Real Int
instance Show Int

-- You can see that they share identical type classes.
-- The best guess would be that Word has different bounds than Int .
-- If you look at maxBound , you can see that Word is larger than Int :
-- GHCi> maxBound :: Word
-- 18446744073709551615
-- GHCi> maxBound :: Int
-- 9223372036854775807572
-- But Word also has minBound of 0, whereas Int is much lower:
-- GHCi> minBound :: Word
-- 0
-- GHCi> minBound :: Int
-- -9223372036854775808
-- So as you might have guessed, Word is an Int that takes
-- on only positive values, essentially an unsigned Int .
