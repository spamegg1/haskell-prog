-- Why doesn’t readFile close the handle?

-- Answer: it couldn't know when to close it.

-- Because of lazy evaluation, if readFile closes the handle,
-- you’d never be able to use the contents of the file.
-- This is because a function acting on the contents of the file
-- wouldn’t be called until after the file handle was closed.

-- readFile :: FilePath -> IO String
-- readFile name = do
--     inputFile <- openFile name ReadMode
--     hGetContents inputFile
