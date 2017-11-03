module Helpers exposing (blankCompositeDecoder, blankDecoder, expectDecodesTo, me____x, testDecodesTo, x____replace)

import Expect
import Json.Decode as Decode
import Utils.Test as Test exposing (Test, describe, test)


type FILL_ME_IN
    = Blank


me____x : FILL_ME_IN
me____x =
    Blank


x____replace : FILL_ME_IN -> a
x____replace _ =
    Debug.crash "FILL IN THE BLANK"


blankDecoder : Decode.Decoder a
blankDecoder =
    -- Decode.fail "Fill in the blankDecoder to make this test pass."
    Decode.andThen (\a -> Debug.crash "Fill in the blank") (Decode.succeed "")


blankCompositeDecoder : Decode.Decoder a -> Decode.Decoder b
blankCompositeDecoder nestedDecoder =
    Decode.andThen (\a -> Debug.crash "Fill in the blank") (Decode.succeed "")


testDecodesTo : String -> Decode.Decoder a -> String -> a -> Test
testDecodesTo description decoder jsonString decodesTo =
    test description <|
        \() ->
            Decode.decodeString decoder jsonString
                |> Expect.equal (Ok decodesTo)


expectDecodesTo : Decode.Decoder a -> String -> a -> Expect.Expectation
expectDecodesTo decoder jsonString decodesTo =
    Decode.decodeString decoder jsonString
        |> Expect.equal (Ok decodesTo)
