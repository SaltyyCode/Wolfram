{-
-- EPITECH PROJECT, 2025
-- Wolfram
-- File description:
-- Wolfram Main
-}

module Main (main) where

import System.Environment (getArgs)
import Wolfram (runWithArgs)

main :: IO ()
main = getArgs >>= runWithArgs