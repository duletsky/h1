{-# LANGUAGE OverloadedStrings #-}
module Main where

import Web.Scotty
import Data.Monoid ((<>))

main = do
  putStrLn "Starting Server..."
  scotty 3000 $ do
        get "/hello" $ do
            text "hello world!"
        get "/" $ do
            text "hello index!"
        get "/hello/:name" $ do
            name <- param "name"
            text ("hello " <> name <> "!")
