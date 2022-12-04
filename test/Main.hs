module Main where

import Coalmine.Prelude
import Coalmine.Tasty
import TestSuites.Serialization qualified as Serialization

main =
  defaultMain . testGroup "All"
    =<< sequence
      [ testGroup "Serialization" <$> Serialization.initializeTests
      ]
