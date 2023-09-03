#!/usr/bin/env stack
-- stack --resolver lts-20.18 script --package cassava --package bytestring --package vector
{-# LANGUAGE OverloadedStrings #-}
import qualified Data.ByteString.Lazy as BL
import qualified Data.Vector as V
-- cassava provides Data.Csv
import Data.Csv


main :: IO ()
main = do
  records <- BL.readFile "records.csv"
  case decode NoHeader records of
    Left err -> putStrLn err
    Right v  ->
      V.forM_ v (\(name, age, job) ->
        putStrLn (name ++ " is a " ++ age ++ "yr old " ++ job))


-- What is a bytestring?
-- What is a vector?
