module TestSuites.Serialization where

import qualified Coalmine.CerealExtras.Get as Get
import Coalmine.Inter
import Coalmine.Prelude
import Coalmine.Tasty
import Coalmine.Tasty.TestTrees.Cereal
import qualified Data.Serialize as Cereal
import qualified PgenieProtocol.V1 as Protocol

initializeTests :: IO [TestTree]
initializeTests =
  return
    [ testEncodeDecode @Protocol.Request Proxy,
      testEncodeDecode @Protocol.Response Proxy
    ]
