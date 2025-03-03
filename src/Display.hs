{-
-- EPITECH PROJECT, 2025
-- Wolfram
-- File description:
-- Display Module
-}

module Display (boolToString, printFullLine) where

boolToString :: [Bool] -> String
boolToString = map (\b -> if b then '*' else ' ')

printFullLine :: [Bool] -> Int -> Int -> IO ()
printFullLine line window move =
    putStrLn $
        take window $
            boolToString $
                drop shiftAmount line
  where
    shiftAmount = (length line - window) `div` 2 - move
