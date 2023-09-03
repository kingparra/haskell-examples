#!/usr/bin/env stack
-- stack --resolver lts-20.18 script --package http-conduit --package bytestring
{-# LANGUAGE OverloadedStrings #-}
-- https://github.com/snoyberg/http-client/blob/master/TUTORIAL.md

import Network.HTTP.Simple
import qualified Data.ByteString.Char8 as B8

main :: IO ()
main = do
  let url = "https://en.wikipedia.org/wiki/Sinking_of_SS_Princess_Alice"
  let urlParts = B8.split '/' $ B8.pack url
  let fileName = Prelude.last urlParts
  req <- parseRequest url
  resp <- httpBS req
  B8.putStrLn $ getResponseBody resp
