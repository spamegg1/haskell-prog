-- Rewrite SixSidedDie to derive both Eq and Ord.
data SixSidedDie = S1 | S2 | S3 | S4 | S5 | S6 deriving (Show, Eq, Ord)
