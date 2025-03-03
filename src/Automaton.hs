{-
-- EPITECH PROJECT, 2025
-- Wolfram
-- File description:
-- Automaton logic
-}

module Automaton (intToBinaryRule, runAutomaton, nextGen) where

import Data.Bits (testBit)
import Display (printFullLine)

intToBinaryRule :: Int -> [Bool]
intToBinaryRule n = [testBit n i | i <- [7,6..0]]

nextGen :: [Bool] -> [Bool] -> [Bool]
nextGen rule cells =
    let extCells = [False] ++ cells ++ [False]
    in [ applyRule rule (extCells !! i, extCells !! (i+1), extCells !! (i+2))
         | i <- [0 .. length cells - 1] ]

applyRule :: [Bool] -> (Bool, Bool, Bool) -> Bool
applyRule rule (l, c, r) =
    let i = (if l then 4 else 0) + (if c then 2 else 0) + (if r then 1 else 0)
    in rule !! (7 - i)

runAutomaton :: [Bool] -> [Bool] -> Maybe Int -> Int -> Int -> IO ()
runAutomaton _ _ (Just 0) _ _ = return ()
runAutomaton rule state Nothing width move =
    printFullLine state width move >>
    runAutomaton rule (nextGen rule state) Nothing width move
runAutomaton rule state (Just n) width move =
    printFullLine state width move >>
    runAutomaton rule (nextGen rule state) (Just (n-1)) width move