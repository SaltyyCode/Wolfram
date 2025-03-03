{-
-- EPITECH PROJECT, 2025
-- Wolfram
-- File description:
-- Wolfram execution logic
-}

module Wolfram (runWithArgs) where

import Arguments (parseArgs, handleError, Options(..))
import Automaton (intToBinaryRule, runAutomaton, nextGen)

runWithArgs :: [String] -> IO ()
runWithArgs args = either handleError launchWolfram (parseArgs args)

launchWolfram :: Options -> IO ()
launchWolfram opts =
    let ruleBin = intToBinaryRule (rule opts)
        width = maybe 80 id (window opts)
        moveOffset = maybe 0 id (move opts)
        padding = replicate (width + 2 * abs moveOffset) False
        initialState = padding ++ [True] ++ padding
        finalState =
            iterate (nextGen ruleBin) initialState
                !! maybe 0 id (start opts)
    in runAutomaton ruleBin finalState (linesCount opts) width moveOffset
