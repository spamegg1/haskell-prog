import System.Random                                                -- randomRIO
import qualified Data.ByteString.Char8 as BC

sortSection :: Int -> Int -> BC.ByteString -> BC.ByteString
sortSection start size bytes = mconcat [before, changed, after] where
    (before, rest) = BC.splitAt start bytes-- ([BC.ByteString], [BC.ByteString])
    (target, after) = BC.splitAt size rest -- ([BC.ByteString], [BC.ByteString])
    changed = BC.reverse $ BC.sort target                       -- BC.ByteString

randomSortSection :: BC.ByteString -> IO BC.ByteString
randomSortSection bytes = do
    let sectionSize = 25                                                  -- Int
    let range = BC.length bytes - sectionSize                             -- Int
    start <- randomRIO (0, range)                               -- Int <- IO Int
    return $ sortSection start sectionSize bytes             -- IO BC.ByteString
