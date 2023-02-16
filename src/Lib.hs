module Lib (someFunc
           ,Writer(runWriter)
           ,tell
           ) where

import Control.Monad (liftM, ap)

someFunc:: IO ()
someFunc = putStrLn "someFunc"

newtype Writer w a = Writer { runWriter :: (a, [w]) }

instance Functor (Writer w) where
  fmap = liftM

instance Applicative (Writer w) where
  pure x = Writer (x, [])
  (<*>) = ap

instance Monad (Writer w) where
  m >>= f = Writer (y, w1 ++ w2)
    where (x, w1) = runWriter m
          (y, w2) = runWriter (f x)

tell :: w -> Writer w ()
tell w = Writer ((), [w])
