module TestSuites.Serialization where

import qualified Coalmine.CerealExtras.Get as Get
import Coalmine.Inter
import Coalmine.Prelude
import Coalmine.Tasty
import Coalmine.Tasty.TestTrees.Cereal
import qualified Data.Serialize as Cereal
import qualified Pgenie.Protocol.V1 as Protocol

initializeTests :: IO [TestTree]
initializeTests =
  return
    [ testEncodeDecode @Protocol.Request Proxy,
      testEncodeDecode @Protocol.Response Proxy,
      testCase "Deserialization golden" $
        let input = "\NUL\ETX\STXmy\EOTuser\ENQspace\STX\ENQmusic\tcatalogue\NUL\NUL\NUL\NUL\NUL\NUL\NUL\NUL\NUL\NUL\NUL\NUL\NUL\NUL\NUL\NUL"
            value =
              Protocol.ProcessRequest $
                Protocol.RequestProcess "my-user-space" "music-catalogue" [] []
         in assertEqual "" (Right value) $
              Cereal.runGet @Protocol.Request Cereal.get input
    ]
