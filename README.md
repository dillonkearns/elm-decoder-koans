# Elm Katas
One of the best ways to learn a new language, or improve a skill
(TDD, refactoring, or any other pattern or technique) is using a simple
exercise to focus in on what you want to learn or improve. This is
sometimes called deliberate practice.

## Setup
1. Install dependencies with `npm install`.
1. Run tests with `npm run test-watch` (or run them just once with `npm test`).
1. Start the app with `npm start` (this will automatically open the browser for you, and the page will auto-reload whenever you save your code).

## Tennis Kata
Goal: use TDD to create a tennis scoreboard page. Clicking on the
`Player 1 Scored` and `Player 2 Scored` buttons will update the scoreboard.

#### Recommended approach
The trick is to do the simplest step possible, but also integrate end-to-end as often as possible. That means that:
* You should start with a single case and make that work simply (like player 1 can score a point).
* But before moving to the next case (both players can score, player score can go above 15, etc.), get that wired in to the `Main.elm` page so you can actually demo it (don't wait to integrate till the end, the feedback from using it on the page will make sure it works and is a nice design).

Elm makes refactoring incredibly easy and safe (the compiler will step you through the changes you need to make when you update your types). Take advantage of that by starting with the simplest solution for a given test case, then refactoring to allow for more complexity just-in-time.
