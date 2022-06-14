module Main where

import Coalmine.Prelude
import Coalmine.Tasty
import qualified TestSuites.Serialization as Serialization

main =
  defaultMain . testGroup "All"
    =<< sequence
      [ testGroup "Serialization" <$> Serialization.initializeTests
      ]
