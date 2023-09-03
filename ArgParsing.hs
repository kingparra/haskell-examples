#!/usr/bin/env stack
-- stack --resolver lts-20.18 script --package optparse-applicative
{-# LANGUAGE OverloadedStrings #-}
import Options.Applicative
import Data.List (replicate, intersperse)

data Options = Options
  { count :: Int
  , character :: String  -- Change the type to String
  , nlines :: Int
  }

parseOptions :: Parser Options
parseOptions = Options
  <$> option auto
      ( long "count"
     <> short 'n'
     <> help "Number of characters to print in each line"
     <> metavar "countOpt" )
  <*> strOption  -- Use strOption to parse a String
      ( long "character"
     <> short 'c'
     <> help "Character(s) to repeat"  -- Update the help text
     <> metavar "charOpt" )
  <*> option auto
      ( long "lines"
     <> short 'l'
     <> help "Number of lines to print"
     <> metavar "linesOpt" )

-- Example use
-- $ ./ArgParsing.hs -n 4 -l 5 -c '&'
-- &&&&
-- &&&&
-- &&&&
-- &&&&
-- &&&&

main :: IO ()
main = do

  options <- execParser opts
  let line = concat [(character options) | _ <- [1..(count options)]] ++ "\n"
  putStrLn $ concat [ line | _ <- [1..(nlines options)]]

  where
    opts = info (parseOptions <**> helper)
      ( fullDesc
     <> progDesc "Print repeated characters"
     <> header "box - a simple character repetition program" )
