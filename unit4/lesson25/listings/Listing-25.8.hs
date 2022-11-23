import qualified Data.ByteString.Char8 as BC

sortSection :: Int -> Int -> BC.ByteString -> BC.ByteString
sortSection start size bytes = mconcat [before, changed, after] where
    (before, rest) = BC.splitAt start bytes-- ([BC.ByteString], [BC.ByteString])
    (target, after) = BC.splitAt size rest -- ([BC.ByteString], [BC.ByteString])
    changed = BC.reverse $ BC.sort target                       -- BC.ByteString
