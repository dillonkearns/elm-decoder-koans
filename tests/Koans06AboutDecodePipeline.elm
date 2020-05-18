module Koans06AboutDecodePipeline exposing (suite)

{-
   See:
      http://package.elm-lang.org/packages/NoRedInk/elm-decode-pipeline/3.0.0/Json-Decode-Pipeline
-}

import Helpers exposing (blankCompositeDecoder, blankDecoder, expectDecodesTo, me____x, testDecodesTo, x____replace)
import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Pipeline as Pipeline
import Utils.Test exposing (Test, describe, test)


type alias Name =
    { first : String, last : String }


type alias Mission =
    { description : String, years : Maybe Int }


type alias FourThings =
    { a : Int, b : Int, c : Int, d : Int }


suite : Test
suite =
    describe "About Decode Pipeline Syntax"
        [ test "NoRedInk's Decode.Pipeline allows uses pipes instead of map2, map3, etc." <|
            \_ ->
                x____replace me____x
                    |> expectDecodesTo
                        (Decode.succeed Name
                            |> Pipeline.required "first" Decode.string
                            |> Pipeline.required "last" Decode.string
                        )
                        """{ "first": "Beverly", "last": "Crusher" }"""
        , test "It allows you to specify default values for optional fields" <|
            \_ ->
                x____replace me____x
                    |> expectDecodesTo
                        (Decode.succeed Name
                            |> Pipeline.required "first" Decode.string
                            |> Pipeline.optional "last" Decode.string "Doe"
                        )
                        """{ "first": "John" }"""
        , test "Pipeline.requiredAt allows you to reach into nested fields similar to Decode.at" <|
            \_ ->
                x____replace me____x
                    |> expectDecodesTo
                        (Decode.succeed Name
                            |> Pipeline.requiredAt [ "name", "first" ] Decode.string
                            |> Pipeline.requiredAt [ "name", "last" ] Decode.string
                        )
                        """{ "name": { "first": "Miles", "last": "O'Brien" } }"""
        , test "There's no built-in syntax for getting optional fields as Maybes but you achieve that with Decode.map" <|
            \_ ->
                { description = "Go where no man has gone before."
                , years = x____replace me____x
                }
                    |> expectDecodesTo
                        (Decode.succeed Mission
                            |> Pipeline.required "description" Decode.string
                            |> Pipeline.optional "years" (Decode.map Just Decode.int) Nothing
                        )
                        """{
                               "description": "Go where no man has gone before.",
                               "years": 5
                          }"""
        , test "If the value exists it will decode to a Just" <|
            \_ ->
                { description = "Go where no man has gone before."
                , years = Nothing
                }
                    |> expectDecodesTo
                        (Decode.succeed Mission
                            |> Pipeline.required "description" Decode.string
                            |> Pipeline.optional "years" (Decode.map Just Decode.int) Nothing
                        )
                        """{
                               "description": "Go where no man has gone before."
                            }"""
        ]


pipelineMaybe : String -> Decoder a -> Decoder (Maybe a -> b) -> Decoder b
pipelineMaybe field decoder =
    Pipeline.optional field (Decode.map Just decoder) Nothing
