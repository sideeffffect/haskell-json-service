#!/usr/bin/env stack
-- stack --resolver lts-13.21 script
{-# LANGUAGE DeriveGeneric     #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
{-# LANGUAGE RecordWildCards   #-}
{-# LANGUAGE TemplateHaskell   #-}
{-# LANGUAGE TypeFamilies      #-}

module Lib
    ( main
    , performSum
    , Sum(..)
    , Result(..)
    ) where

import           Data.Text (Text)
import           Yesod
import           GHC.Generics

data Person = Person
    { name :: Text
    , age  :: Int
    }
    deriving Generic
instance ToJSON Person

{-
instance ToJSON Person where
    toJSON Person {..} = object
        [ "name" .= name
        , "age"  .= age
        ]
-}

data Sum = Sum
    { getX :: Int
    , getY :: Int
    }
    deriving (Show, Generic)
instance FromJSON Sum

{- HLINT ignore Result -}
data Result = Result
    { getResult :: Int
    }
    deriving (Show, Eq, Generic)
instance ToJSON Result

performSum :: Sum -> Result
performSum s = let r = getX s + getY s
               in Result { getResult = r }

data App = App

mkYesod "App" [parseRoutes|
/ HomeR GET
/sum SumR POST
|]

instance Yesod App

getHomeR :: Handler Value
getHomeR = returnJson $ Person "Michael" 28

postSumR :: Handler Value
postSumR = do
    s <- requireCheckJsonBody :: Handler Sum
    returnJson $ performSum s

main :: IO ()
main = warp 8080 App
