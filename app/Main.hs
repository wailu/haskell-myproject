module Main where

import Lib (Writer (runWriter), someFunc, tell)

foo :: Writer String Int
foo = do
  tell "starting computation"
  let x = 1 + 2
  tell ("x = " ++ show x)
  let y = x * 2
  tell ("y = " ++ show y)
  return y

printList :: [String] -> IO ()
printList [] = return ()
printList (x : xs) = do
  putStrLn x
  printList xs

main :: IO Int
main = do
  putStrLn "Hello, Haskell!!"
  someFunc
  let (a, log) = runWriter foo
  printList log
  return a
