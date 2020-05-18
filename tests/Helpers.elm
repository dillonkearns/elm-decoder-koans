module Helpers exposing (blankCompositeDecoder, blankDecoder, expectDecodesTo, me____x, testDecodesTo, x____replace)

import Expect
import Json.Decode as Decode
import Utils.Test as Test exposing (Test, describe, test)


type FILL_ME_IN
    = Blank


me____x : FILL_ME_IN
me____x =
    Blank


x____replace : a -> b
x____replace _ =
    Debug.todo "FILL IN THE BLANK"


blankDecoder : Decode.Decoder a
blankDecoder =
    Decode.fail "Replace the blankDecoder to solve this koan."


blankCompositeDecoder : Decode.Decoder a -> Decode.Decoder b
blankCompositeDecoder nestedDecoder =
    Decode.andThen (\a -> Debug.todo "Fill in the blank") (Decode.succeed "")


testDecodesTo : String -> Decode.Decoder a -> String -> a -> Test
testDecodesTo description decoder jsonString decodesTo =
    test description <|
        \() ->
            Decode.decodeString decoder jsonString
                |> Expect.equal (Ok decodesTo)


expectDecodesTo : Decode.Decoder a -> String -> a -> Expect.Expectation
expectDecodesTo decoder jsonString expectedValue =
    case Decode.decodeString decoder jsonString of
        Ok decoded ->
            decoded
                |> Expect.equal expectedValue

        Err error ->
            Expect.fail <| Decode.errorToString error
