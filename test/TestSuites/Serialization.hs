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
              Cereal.runGet @Protocol.Request Cereal.get input,
      testCase "Deserialization golden 2" $
        let input = "\NUL\ETX\STXmy\EOTuser\ENQspace\STX\ENQmusic\tcatalogue\NUL\NUL\NUL\NUL\NUL\NUL\NUL\NUL\NUL\NUL\NUL\NUL\NUL\NUL\NUL\SOH\NUL\STX\NUL\NUL\NUL\NUL\NUL\NUL\NUL\SYNselect-genre-by-artist\SOH\NUL\NUL\NUL\NUL\NUL\NUL\NUL\ETXsql\NUL\NUL\NUL\NUL\NUL\NUL\NUL\aqueries\NUL\NUL\NUL\NUL\NUL\NUL\NUL\NUL\239\191\189select id, genre.name\nfrom genre\nleft join album_genre on album_genre.genre = genre.id\nleft join album_artist on album_artist.album = album_genre.album\nwhere album_artist.artist = $artist\n"
            value =
              Protocol.ProcessRequest $
                Protocol.RequestProcess "my-user-space" "music-catalogue" [] []
         in assertEqual "" (Right value) $
              Cereal.runGet @Protocol.Request Cereal.get input
    ]
