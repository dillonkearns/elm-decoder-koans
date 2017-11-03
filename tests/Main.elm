module Main exposing (main)

{-| HOW TO RUN THIS EXAMPLE

1.  Run elm-reactor from the same directory as your tests' elm-package.json. (For example, if you have tests/elm-package.json, then cd into tests/ and
    run elm-reactor.)
2.  Visit <http://localhost:8000> and bring up this file.

-}

import Koan01AboutPrimitives
import Koan02AboutComposites
import Test exposing (..)
import Test.Runner.Html


main : Test.Runner.Html.TestProgram
main =
    [ Koan01AboutPrimitives.suite
    , Koan02AboutComposites.suite
    ]
        |> concat
        |> Test.Runner.Html.run
