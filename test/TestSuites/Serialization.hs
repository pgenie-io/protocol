module TestSuites.Serialization where

import Coalmine.CerealExtras.Get qualified as Get
import Coalmine.Inter
import Coalmine.Prelude
import Coalmine.Tasty
import Coalmine.Tasty.TestTrees.Cereal
import Data.Serialize qualified as Cereal
import Pgenie.Protocol qualified as Protocol

initializeTests :: IO [TestTree]
initializeTests =
  return
    [ testEncodeDecode @Protocol.Request Proxy,
      testEncodeDecode @Protocol.Response Proxy
    ]
