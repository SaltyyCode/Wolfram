{-
-- EPITECH PROJECT, 2024
-- Wolfram
-- File description:
-- Arguments parser
-}
module Arguments (parseArgs, handleError, Options(..)) where
import System.Exit (exitWith, ExitCode(ExitFailure))
import Text.Read (readMaybe)
import Data.Char (isDigit)

data Options = Options
    { rule  :: Int
    , linesCount :: Maybe Int
    , window :: Maybe Int
    , move :: Maybe Int
    , start :: Maybe Int
    } deriving Show

isValidInt :: String -> Bool
isValidInt (x:xs) = (x == '-' && not (null xs) && all isDigit xs) ||
    all isDigit (x:xs)
isValidInt [] = False

isNonNegativeInt :: String -> Bool
isNonNegativeInt s = isValidInt s && (case readMaybe s :: Maybe Int of
                                         Just n -> n >= 0
                                         Nothing -> False)

atoi :: String -> Maybe Int
atoi s | isValidInt s = readMaybe s
       | otherwise = Nothing

parseRule :: [String] -> Either String Int
parseRule ("--rule":x:_)
    | not (isValidInt x) = Left "Rule must be a number"
    | not (isNonNegativeInt x) = Left "Rule cannot be negative"
    | otherwise = case atoi x of
        Just n | n >= 0 && n <= 255 -> Right n
        Just _ -> Left "Rule must be between 0 and 255"
        Nothing -> Left "Invalid rule format"
parseRule ("--rule":[]) = Left "Missing rule value"
parseRule (_:args) = parseRule args
parseRule [] = Left "Missing mandatory argument: --rule"

parseLines :: [String] -> Either String (Maybe Int)
parseLines ("--lines":x:_)
    | not (isValidInt x) = Left "Lines must be a number"
    | not (isNonNegativeInt x) = Left "Lines cannot be negative"
    | otherwise = case atoi x of
        Just n | n > 0 -> Right (Just n)
        Just _ -> Left "Lines must be greater than 0"
        Nothing -> Left "Invalid lines format"
parseLines ("--lines":[]) = Left "Missing lines value"
parseLines (_:args) = parseLines args
parseLines [] = Right Nothing

parseWindow :: [String] -> Either String (Maybe Int)
parseWindow ("--window":x:_)
    | not (isValidInt x) = Left "Window must be a number"
    | not (isNonNegativeInt x) = Left "Window cannot be negative"
    | otherwise = case atoi x of
        Just n -> Right (Just n)
        Nothing -> Left "Invalid window format"
parseWindow ("--window":[]) = Left "Missing window value"
parseWindow (_:args) = parseWindow args
parseWindow [] = Right (Just 80)

parseMove :: [String] -> Either String (Maybe Int)
parseMove ("--move":x:_)
    | not (isValidInt x) = Left "Move must be a number"
    | otherwise = case atoi x of
        Just n -> Right (Just n)
        Nothing -> Left "Invalid move format"
parseMove ("--move":[]) = Left "Missing move value"
parseMove (_:args) = parseMove args
parseMove [] = Right (Just 0)

parseStart :: [String] -> Either String (Maybe Int)
parseStart ("--start":x:_)
    | not (isValidInt x) = Left "Start must be a number"
    | not (isNonNegativeInt x) = Left "Start cannot be negative"
    | otherwise = case atoi x of
        Just n -> Right (Just n)
        Nothing -> Left "Invalid start format"
parseStart ("--start":[]) = Left "Missing start value"
parseStart (_:args) = parseStart args
parseStart [] = Right (Just 0)

parseArgs :: [String] -> Either String Options
parseArgs args =
    Options <$> parseRule args <*> parseLines args <*> parseWindow args
            <*> parseMove args <*> parseStart args

handleError :: String -> IO ()
handleError msg =
    putStrLn ("Error: " ++ msg) >> mapM_ putStrLn
        [ "Usage: wolfram --rule <rule> [--lines <m>] [--window <w>]"
        , "       [--move <x>] [--start <s>]"
        , "  --rule <rule>   Mandatory: Rule to apply (0-255)"
        , "  --lines <m>     Number of lines to display (positive integer)"
        , "  --window <w>    Window size (positive, default: 80)"
        , "  --move <x>      Horizontal shift (integer, default: 0)"
        , "  --start <s>     Initial generation (positive, default: 0)"
        ] >> exitWith (ExitFailure 84)
