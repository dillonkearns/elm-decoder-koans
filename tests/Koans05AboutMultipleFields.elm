module Koans05AboutMultipleFields exposing (suite)

{-
   See:
      http://package.elm-lang.org/packages/elm-lang/core/5.1.1/Json-Decode#mapping
-}

import Helpers exposing (blankCompositeDecoder, blankDecoder, expectDecodesTo, me____x, testDecodesTo, x____replace)
import Json.Decode as Decode exposing (Decoder)
import Utils.Test exposing (Test, describe, test)


type alias Name =
    { first : String, last : String }


type alias FullName =
    { first : String, middle : String, last : String }


suite : Test
suite =
    describe "About Multiple Fileds"
        [ test "Decode.map2 takes two decoders and sends the results to a function" <|
            \_ ->
                let
                    toPerson first last =
                        { first = first, last = last }
                in
                { first = "Deanna"
                , last = x____replace me____x
                }
                    |> expectDecodesTo
                        (Decode.map2 toPerson
                            (Decode.field "first" Decode.string)
                            (Decode.field "last" Decode.string)
                        )
                        """{ "first": "Deanna", "last": "Troi" }"""
        , test "It can be any kind of function" <|
            \_ ->
                let
                    multiply n1 n2 =
                        n1 * n2
                in
                x____replace me____x
                    |> expectDecodesTo
                        (Decode.map2 multiply
                            (Decode.field "width" Decode.int)
                            (Decode.field "height" Decode.int)
                        )
                        """{ "width": 10, "height": 12 }"""
        , test "But often it's just the constructor that Elm generates from a record type alias" <|
            \_ ->
                x____replace me____x
                    |> expectDecodesTo
                        (Decode.map2 Name
                            (Decode.field "first" Decode.string)
                            (Decode.field "last" Decode.string)
                        )
                        """{ "first": "Beverly", "last": "Crusher" }"""
        , test "Decode.map3 is also available" <|
            \_ ->
                x____replace me____x
                    |> expectDecodesTo
                        (Decode.map3 FullName
                            (Decode.field "first" Decode.string)
                            (Decode.field "middle" Decode.string)
                            (Decode.field "last" Decode.string)
                        )
                        """{ "first": "William", "middle": "Thomas", "last": "Riker" }"""
        , test "You can even use Decode.map4 (and all the way up to map8)" <|
            \_ ->
                { a = 1, b = 2, c = 3, d = 4 }
                    |> expectDecodesTo
                        (Decode.map4 FourThings
                            (Decode.field "a" Decode.int)
                            (Decode.field "b" Decode.int)
                            (Decode.field "c" Decode.int)
                            (Decode.field "d" Decode.int)
                        )
                        """{ "a": 1, "b": 2, "c": 3, "d": 4 }"""
        ]


type alias FourThings =
    { a : Int, b : Int, c : Int, d : Int }
