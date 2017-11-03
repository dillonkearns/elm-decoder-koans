module Helpers exposing (blankDecoder, testDecodesTo)

import Expect
import Json.Decode as Decode
import Test exposing (Test, describe, test)


blankDecoder : Decode.Decoder a
blankDecoder =
    Decode.fail "Fill in the blankDecoder to make this test pass."


testDecodesTo : String -> Decode.Decoder a -> String -> a -> Test
testDecodesTo description decoder jsonString decodesTo =
    test description <|
        \() ->
            Decode.decodeString decoder jsonString
                |> Expect.equal (Ok decodesTo)
