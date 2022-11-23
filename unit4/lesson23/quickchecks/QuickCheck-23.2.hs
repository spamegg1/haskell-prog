-- There’s a language extension called TemplateHaskell.
-- How would you compile templates.hs to use this extension?
-- How would you add it using a LANGUAGE pragma?

-- Answer:
-- compiling: ghc template.hs -XTemplateHaskell
-- using PRAGMA:
{-# LANGUAGE TemplateHaskell #-}
