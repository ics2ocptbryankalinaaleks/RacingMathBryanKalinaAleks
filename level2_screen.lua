-----------------------------------------------------------------------------------------
-- level2_screen.lua
-- Created by: Kalina Dunne Farrell
-- Date: May 23, 2019
-- Description: This is the level 2 screen of the game. (Art)
-----------------------------------------------------------------------------------------
-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)
-----------------------------------------------------------------------------------------
-- INITIALIZATIONS
-----------------------------------------------------------------------------------------

-- Use Composer Libraries
local composer = require( "composer" )
local widget = require( "widget" )


-----------------------------------------------------------------------------------------

-- Naming Scene
sceneName = "level2_screen"

-----------------------------------------------------------------------------------------

-- Creating Scene Object
local scene = composer.newScene( sceneName )

-----------------------------------------------------------------------------------------
-- LOCAL VARIABLES
-----------------------------------------------------------------------------------------

-- The local variables for this scene
local bkg_image
local questionNumber
local textSize = 50

-- cars
local logocar = display.newImage("Images/CompanyLogo.png", 0, 0)
local car1 = display.newImage("Images/BlueCar.png", 0, 0)
local car2 = display.newImage("Images/GreenCar.png", 0, 0)
local car3 = display.newImage("Images/OrangeCar.png", 0, 0)

-- scrollspeeds
local scrollSpeedLogo = 1
local scrollSpeedCar1 = 1
local scrollSpeedCar2 = 1.5
local scrollSpeedCar3 = 2

-- QUESTIONS

-- question1
local question1Text
local question1CorrectAnswerFirst
local question1CorrectAnswerPlus
local question1CorrectAnswerSecond
local question1Answer1First
local question1Answer1Plus
local question1Answer1Second
local question1Answer2First
local question1Answer2Plus
local question1Answer2Second
local question1Answer3First
local question1Answer3Plus
local question1Answer3Second

-- question2
local question2Text
local question2CorrectAnswer
local question2Answer1
local question2Answer2
local question2Answer3

-- question3
local question3Text
local question3CorrectAnswer
local question3Answer1
local question3Answer2
local question3Answer3

-- question4
local question4Text
local question4CorrectAnswer
local question4Answer1
local question4Answer2
local question4Answer3

-- question5
local question5Text
local question5CorrectAnswerFirst
local question5CorrectAnswerPlus
local question5CorrectAnswerSecond
local question5Answer1First
local question5Answer1Plus
local question5Answer1Second
local question5Answer2First
local question5Answer2Plus
local question5Answer2Second
local question5Answer3First
local question5Answer3Plus
local question5Answer3Second

-- question6
local question6Text
local question6CorrectAnswer
local question6Answer1
local question6Answer2
local question6Answer3

-- question7
local question7Text
local question7CorrectAnswer
local question7Answer1
local question7Answer2
local question7Answer3

-- question8
local question8Text
local question8CorrectAnswer
local question8Answer1
local question8Answer2
local question8Answer3

-- question9
local question9Text
local question9CorrectAnswer
local question9Answer1
local question9Answer2
local question9Answer3

-- question10
local question10Text
local question10CorrectAnswer
local question10Answer1
local question10Answer2
local question10Answer3

-- question11
local question11Text
local question11CorrectAnswer
local question11Answer1
local question11Answer2
local question11Answer3

-- question12
local question12Text
local question12CorrectAnswer
local question12Answer1
local question12Answer2
local question12Answer3

-- question13
local question13Text
local question13CorrectAnswer
local question13Answer1
local question13Answer2
local question13Answer3

-- question14
local question14Text
local question14CorrectAnswer
local question14Answer1
local question14Answer2
local question14Answer3

-- question15
local question15Text
local question15CorrectAnswer
local question15Answer1
local question15Answer2
local question15Answer3

-- question16
local question16Text
local question16CorrectAnswerFirst
local question16CorrectAnswerPlus
local question16CorrectAnswerSecond
local question16Answer1First
local question16Answer1Plus
local question16Answer1Second
local question16Answer2First
local question16Answer2Plus
local question16Answer2Second
local question16Answer3First
local question16Answer3Plus
local question16Answer3Second

-- question17
local question17Text
local question17CorrectAnswer
local question17Answer1
local question17Answer2
local question17Answer3

-- question18
local question18Text
local question18CorrectAnswer
local question18Answer1
local question18Answer2
local question18Answer3

-- question19
local question19Text
local question19CorrectAnswer
local question19Answer1
local question19Answer2
local question19Answer3

-- question20
local question20Text
local question20CorrectAnswer
local question20Answer1
local question20Answer2
local question20Answer3

-----------------------------------------------------------------------------------------
--LOCAL SOUNDS
-----------------------------------------------------------------------------------------
local bkgSound = audio.loadStream("Sounds/bkgslevel2.mp3")
local bkgSoundChannel
-----------------------------------------------------------------------------------------
-- LOCAL SCENE FUNCTIONS
-----------------------------------------------------------------------------------------
-- first question 
local function AskQuestion1()
    -- set the question text
    question1Text = display.newText("Click on the Primary Color", 0, 0, Arial, textSize)

    -- set the correct answer text, text color, and position
    question1CorrectAnswer = display.newText("RED", 0, 0, Arial, textSize)
    question1CorrectAnswer:setTextColor(1, 0, 0)

    -- set the first wrong answer text, text color, and position
    question1Answer1 = display.newText("GREEN", 0, 0, Arial, textSize)
    question1Answer1:setTextColor(0, 1, 0)

    -- set the second wrong answer text, text color, and position
    question1Answer2 = display.newText("PURPLE", 0, 0, Arial, textSize)
    question1Answer2:setTextColor(127/255, 0, 1)

    -- set the third wrong answer text, text color, and position
    question1Answer3 = display.newText("PINK", 0, 0, Arial, textSize)
    question1Answer3:setTextColor(1, 51/255, 1)
end

-- ask a question
local function AskQuestion()
    -- choose out of the possoble 20 questions
    questionNumber = math.random(1, 20)

    -- based on the questionNumber, call the function that will create that question. They are seperate because there was too
    --many lines of code in a single function if theye ere all together - there was an error because of it
    if (questionNumber == 1) then
        AskQuestion1

    elseif (questionNumber == 2) then

        local function AskQuestion2()
            -- set the question text
            question2Text = display.newText("Which mixture will make brown?", 0, 0, Arial, textSize)

            -- set the correct answer text, text color, and position
            question2CorrectAnswerFirst = display.newText("RED", 0, 0, Arial, textSize)
            question2CorrectAnswerFirst:setTextColor(1, 0, 0)
            question2CorrectAnswerPlus = display.newText(" + ", 0, 0, Arial, textSize)
            question2CorrectAnswerPlus:setTextColor(0, 0, 0)
            question2CorrectAnswerSecond = display.newText("BROWN", 0, 0, Arial, textSize)
            question2CorrectAnswerSecond:setTextColor(102/255, 51/255, 0)

            -- set the first wrong answer text, text color, and position
            question2Answer1First = display.newText("PINK", 0, 0, Arial, textSize)
            question2Answer1First:setTextColor(1, 51/255, 1)
            question2Answer1Plus = display.newText(" + ", 0, 0, Arial, textSize)
            question2Answer1Plus:setTextColo(0, 0, 0)
            question2Answer1Second = display.newText("BLUE", 0, 0, Arial, textSize)
            question2Answer1Second:setTextColor(0, 1, 0)

            -- set the second wrong answer text, text color, and position
            question2Answer2First = display.newText("ORANGE", 0, 0, Arial, textSize)
            question2Answer2First:setTextColor(1, 128/255, 0)
            question2Answer2Plus = display.newText(" + ", 0, 0, Arial, textSize)
            question2Answer2Plus:setTextColor(0, 0, 0)
            question2Answer2Second = display.newText("PURPLE", 0, 0, Arial, textSize)
            question2Answer2Second:setTextColor(127/255, 0, 1)

            -- set the third wrong answer text, text color, and position
            question2Answer3First = display.newText("YELLOW", 0, 0, Arial, textSize) 
            question2Answer3First:setTextColor(1, 1, 0)
            question2Answer3Plus = display.newText(" + ", 0, 0, Arial, textSize)
            question2Answer3Plus:setTextColor(0, 0, 0)
            question2Answer3Second = display.newText("GREEN", 0, 0, Arial, textSize)
            question2Answer3Second:setTextColor(0, 1, 0)
        end

    elseif (questionNumber == 3) then

        local function AskQuestion3()
            -- set the question text
            question3Text = display.newText("Which color is the opposite of orange?", 0, 0, Arial, textSize)

            -- set the correct answer text, text color, and position
            question3CorrectAnswer = display.newText("BLUE", 0, 0, Arial, textSize)
            question3CorrectAnswer:setTextColor(0, 0, 1)

            -- set the first wrong answer text, text color, and position
            question3Answer1 = display.newText("RED", 0, 0, Arial, textSize)
            question3Answer1:setTextColor(1, 0, 0)

            -- set the second wrong answer text, text color, and position
            question3Answer2 = display.newText("PURPLE", 0, 0, Arial, textSize)
            question3Answer2:setTextColor(127/255, 0, 1)

            -- set the third wrong answer text, text color, and position
            question3Answer3 = display.newText("GREEN", 0, 0, Arial, textSize)
            question3Answer3:setTextColor(0, 1, 0)
        end

    elseif (questionNumber == 4) then

        local function AskQuestion4()
            -- set the question text
            question4Text = display.newText("Which color is the opposite of purple?", 0, 0, Arial, textSize)

            -- set the correct answer text, text color, and position
            question4CorrectAnswer = display.newText("BLACK", 0, 0, Arial, textSize)
            question4CorrectAnswer:setTextColor(0, 0, 0)

            -- set the first wrong answer text, text color, and position
            question4Answer1 = display.newText("RED", 0, 0, Arial, textSize)
            question4Answer1:setTextColor(1, 0, 0)

            -- set the second wrong answer text, text color, and position
            question4Answer2 = display.newText("BLUE", 0, 0, Arial, textSize)
            question4Answer2:setTextColor(0, 0, 1)

            -- set the third wrong answer text, text color, and position
            question4Answer3 = display.newText("PINK", 0, 0, Arial, textSize)
            question4Answer3:setTextColor(1, 51/255, 1)
        end

    elseif (questionNumber == 5) then

        local function AskQuestion5()
            -- set the question text
            question5Text = display.newText("Which mixture will create green?", 0, 0, Arial, textSize)

            -- set the correct answer text, text color, and position
            question5CorrectAnswerFirst = display.newText("", 0, 0, Arial, textSize)
            question5CorrectAnswerFirst:setTextColor(1, 0, 0)
            question5CorrectAnswerPlus = display.newText("", 0, 0, Arial, textSize)
            question5CorrectAnswerPlus:setTextColor(0, 0, 0)
            question5CorrectAnswerSecond = display.newText("", 0, 0, Arial, textSize)
            question5CorrectAnswerSecond:setTextColor(1, 0, 0)

            -- set the first wrong answer text, text color, and position
            question5Answer1First = display.newText("", 0, 0, Arial, textSize)
            question5Answer1First:setTextColor(0, 1, 0)
            question5Answer1Plus = display.newText("", 0, 0, Arial, textSize)
            question5Answer1Plus:setTextColor(0, 0, 0)
            question5Answer1Second = display.newText("", 0, 0, Arial, textSize)
            question5Answer1Second:setTextColor(0, 1, 0)

            -- set the second wrong answer text, text color, and position
            question5Answer2First = display.newText("", 0, 0, Arial, textSize)
            question5Answer2First:setTextColor(127/255, 0, 1)
            question5Answer2Plus = display.newText("", 0, 0, Arial, textSize)
            question5Answer2Plus:setTextColor(0, 0, 0)
            question5Answer2Second = display.newText("", 0, 0, Arial, textSize)
            question5Answer2Second:setTextColor(127/255, 0, 1)

            -- set the third wrong answer text, text color, and position
            question5Answer3First = display.newText("", 0, 0, Arial, textSize)
            question5Answer3First:setTextColor(1, 51/255, 1)
            question5Answer3Plus = display.newText("", 0, 0, Arial, textSize)
            question5Answer3Plus:setTextColor(0, 0, 0)
            question5Answer3Second = display.newText("", 0, 0, Arial, textSize)
            question5Answer3Second:setTextColor(1, 51/255, 1)
        end

    elseif (questionNumber == 6) then

        local function AskQuestion6()
            -- set the question text
            question6Text = display.newText("", 0, 0, Arial, textSize)

            -- set the correct answer text, text color, and position
            question6CorrectAnswer = display.newText("", 0, 0, Arial, textSize)
            question6CorrectAnswer:setTextColor(1, 0, 0)

            -- set the first wrong answer text, text color, and position
            question6Answer1 = display.newText("", 0, 0, Arial, textSize)
            question6Answer1:setTextColor(0, 1, 0)

            -- set the second wrong answer text, text color, and position
            question6Answer2 = display.newText("", 0, 0, Arial, textSize)
            question6Answer2:setTextColor(127/255, 0, 1)

            -- set the third wrong answer text, text color, and position
            question6Answer3 = display.newText("", 0, 0, Arial, textSize)
            question6Answer3:setTextColor(1, 51/255, 1)
        end

    elseif (questionNumber == 7) then

        local function AskQuestion7()
            -- set the question text
            question7Text = display.newText("", 0, 0, Arial, textSize)

            -- set the correct answer text, text color, and position
            question7CorrectAnswer = display.newText("", 0, 0, Arial, textSize)
            question7CorrectAnswer:setTextColor(1, 0, 0)

            -- set the first wrong answer text, text color, and position
            question7Answer1 = display.newText("", 0, 0, Arial, textSize)
            question7Answer1:setTextColor(0, 1, 0)

            -- set the second wrong answer text, text color, and position
            question7Answer2 = display.newText("", 0, 0, Arial, textSize)
            question7Answer2:setTextColor(127/255, 0, 1)

            -- set the third wrong answer text, text color, and position
            question7Answer3 = display.newText("", 0, 0, Arial, textSize)
            question7Answer3:setTextColor(1, 51/255, 1)
        end

    elseif (questionNumber == 8) then

        local function AskQuestion8()
            -- set the question text
            question8Text = display.newText("", 0, 0, Arial, textSize)

            -- set the correct answer text, text color, and position
            question8CorrectAnswer = display.newText("", 0, 0, Arial, textSize)
            question8CorrectAnswer:setTextColor(1, 0, 0)

            -- set the first wrong answer text, text color, and position
            question8Answer1 = display.newText("", 0, 0, Arial, textSize)
            question8Answer1:setTextColor(0, 1, 0)

            -- set the second wrong answer text, text color, and position
            question8Answer2 = display.newText("", 0, 0, Arial, textSize)
            question8Answer2:setTextColor(127/255, 0, 1)

            -- set the third wrong answer text, text color, and position
            question8Answer3 = display.newText("", 0, 0, Arial, textSize)
            question8Answer3:setTextColor(1, 51/255, 1)
        end

    elseif (questionNumber == 9) then

        local function AskQuestion9()
            -- set the question text
            question9Text = display.newText("", 0, 0, Arial, textSize)

            -- set the correct answer text, text color, and position
            question9CorrectAnswer = display.newText("", 0, 0, Arial, textSize)
            question9CorrectAnswer:setTextColor(1, 0, 0)

            -- set the first wrong answer text, text color, and position
            question9Answer1 = display.newText("", 0, 0, Arial, textSize)
            question9Answer1:setTextColor(0, 1, 0)

            -- set the second wrong answer text, text color, and position
            question9Answer2 = display.newText("", 0, 0, Arial, textSize)
            question9Answer2:setTextColor(127/255, 0, 1)

            -- set the third wrong answer text, text color, and position
            question9Answer3 = display.newText("", 0, 0, Arial, textSize)
            question9Answer3:setTextColor(1, 51/255, 1)
        end

    elseif (questionNumber == 10) then

        local function AskQuestion10()
            -- set the question text
            question10Text = display.newText("", 0, 0, Arial, textSize)

            -- set the correct answer text, text color, and position
            question10CorrectAnswer = display.newText("", 0, 0, Arial, textSize)
            question10CorrectAnswer:setTextColor(1, 0, 0)

            -- set the first wrong answer text, text color, and position
            question10Answer1 = display.newText("", 0, 0, Arial, textSize)
            question10Answer1:setTextColor(0, 1, 0)

            -- set the second wrong answer text, text color, and position
            question10Answer2 = display.newText("", 0, 0, Arial, textSize)
            question10Answer2:setTextColor(127/255, 0, 1)

            -- set the third wrong answer text, 2text color, and position
            question10Answer3 = display.newText("", 0, 0, Arial, textSize)
            question10Answer3:setTextColor(1, 51/255, 1)
        end

    elseif (questionNumber == 11) then

        local function AskQuestion11()
            -- set the question text
            question11Text = display.newText("Click on the Primary Color", 0, 0, Arial, textSize)

            -- set the correct answer text, text color, and position
            question11CorrectAnswer = display.newText("RED", 0, 0, Arial, textSize)
            question11CorrectAnswer:setTextColor(1, 0, 0)

            -- set the first wrong answer text, text color, and position
            question11Answer1 = display.newText("GREEN", 0, 0, Arial, textSize)
            question11Answer1:setTextColor(0, 1, 0)

            -- set the second wrong answer text, text color, and position
            question11Answer2 = display.newText("PURPLE", 0, 0, Arial, textSize)
            question11Answer2:setTextColor(127/255, 0, 1)

            -- set the third wrong answer text, text color, and position
            question11Answer3 = display.newText("PINK", 0, 0, Arial, textSize)
            question11Answer3:setTextColor(1, 51/255, 1)
        end

    elseif (questionNumber == 12) then

        local function AskQuestion12()
            -- set the question text
            question12Text = display.newText("", 0, 0, Arial, textSize)

            -- set the correct answer text, text color, and position
            question12CorrectAnswer = display.newText("", 0, 0, Arial, textSize)
            question12CorrectAnswer:setTextColor(1, 0, 0)

            -- set the first wrong answer text, text color, and position
            question12Answer1 = display.newText("", 0, 0, Arial, textSize)
            question12Answer1:setTextColor(0, 1, 0)

            -- set the second wrong answer text, text color, and position
            question12Answer2 = display.newText("", 0, 0, Arial, textSize)
            question12Answer2:setTextColor(127/255, 0, 1)

            -- set the third wrong answer text, text color, and position
            question12Answer3 = display.newText("", 0, 0, Arial, textSize)
            question12Answer3:setTextColor(1, 51/255, 1)
        end

    elseif (questionNumber == 13) then

        local function AskQuestion13()
            -- set the question text
            question13Text = display.newText("", 0, 0, Arial, textSize)

            -- set the correct answer text, text color, and position
            question13CorrectAnswer = display.newText("", 0, 0, Arial, textSize)
            question13CorrectAnswer:setTextColor(1, 0, 0)

            -- set the first wrong answer text, text color, and position
            question13Answer1 = display.newText("", 0, 0, Arial, textSize)
            question13Answer1:setTextColor(0, 1, 0)

            -- set the second wrong answer text, text color, and position
            question13Answer2 = display.newText("", 0, 0, Arial, textSize)
            question13Answer2:setTextColor(127/255, 0, 1)

            -- set the third wrong answer text, text color, and position
            question13Answer3 = display.newText("", 0, 0, Arial, textSize)
            question13Answer3:setTextColor(1, 51/255, 1)
        end

    elseif (questionNumber == 14) then

        local function AskQuestion14()
            -- set the question text
            question14Text = display.newText("", 0, 0, Arial, textSize)

            -- set the correct answer text, text color, and position
            question14CorrectAnswer = display.newText("", 0, 0, Arial, textSize)
            question14CorrectAnswer:setTextColor(1, 0, 0)

            -- set the first wrong answer text, text color, and position
            question14Answer1 = display.newText("", 0, 0, Arial, textSize)
            question14Answer1:setTextColor(0, 1, 0)

            -- set the second wrong answer text, text color, and position
            question14Answer2 = display.newText("", 0, 0, Arial, textSize)
            question14Answer2:setTextColor(127/255, 0, 1)

            -- set the third wrong answer text, text color, and position
            question14Answer3 = display.newText("", 0, 0, Arial, textSize)
            question14Answer3:setTextColor(1, 51/255, 1)
        end

    elseif (questionNumber == 15) then

        local function AskQuestion15()
            -- set the question text
            question15Text = display.newText("", 0, 0, Arial, textSize)

            -- set the correct answer text, text color, and position
            question15CorrectAnswer = display.newText("", 0, 0, Arial, textSize)
            question15CorrectAnswer:setTextColor(1, 0, 0)

            -- set the first wrong answer text, text color, and position
            question15Answer1 = display.newText("", 0, 0, Arial, textSize)
            question15Answer1:setTextColor(0, 1, 0)

            -- set the second wrong answer text, text color, and position
            question15Answer2 = display.newText("", 0, 0, Arial, textSize)
            question15Answer2:setTextColor(127/255, 0, 1)

            -- set the third wrong answer text, text color, and position
            question15Answer3 = display.newText("", 0, 0, Arial, textSize)
            question15Answer3:setTextColor(1, 51/255, 1)
        end

    elseif (questionNumber == 16) then

        local function AskQuestion16()
            -- set the question text
            question16Text = display.newText("", 0, 0, Arial, textSize)

            -- set the correct answer text, text color, and position
            question16CorrectAnswerFirst = display.newText("WHITE", 0, 0, Arial, textSize)
            question16CorrectAnswerFirst:setTextColor(1, 0, 0)
            question16CorrectAnswerPlus = display.newText(" + ", 0, 0, Arial, textSize)
            question16CorrectAnswerPlus:setTextColor(0, 0, 0)
            question16CorrectAnswer = display.newText("RED", 0, 0, Arial, textSize)
            question16CorrectAnswer:setTextColor(1, 0, 0)

            -- set the first wrong answer text, text color, and position
            question16Answer1First = display.newText("RED", 0, 0, Arial, textSize)
            question16Answer1First:setTextColor(1, 0, 0)
            question16Answer1Plus = display.newText(" + ", 0, 0, Arial, textSize)
            question16Answer1Plus:setTextColor(0, 0, 0)
            question16Answer1Second = display.newText("BLUE", 0, 0, Arial, textSize)
            question16Answer1Second:setTextColor(0, 0, 1)

            -- set the second wrong answer text, text color, and position
            question16Answer2First = display.newText("ORANGE", 0, 0, Arial, textSize)
            question16Answer2First:setTextColor(127/255, 0, 1)
            question16Answer2Plus = display.newText(" + ", 0, 0, Arial, textSize)
            question16Answer2Plus:setTextColor(0, 0, 0)
            question16Answer2Second = display.newText("GREEN", 0, 0, Arial, textSize)
            question16Answer2Second:setTextColor(127/255, 0, 1)

            -- set the third wrong answer text, text color, and position
            question16Answer3First = display.newText("YELLOW", 0, 0, Arial, textSize)
            question16Answer3First:setTextColor(1, 51/255, 1)
            question16Answer3Plus = display.newText(" + ", 0, 0, Arial, textSize)
            question16Answer3Plus:setTextColor(0, 0, 0)
            question16Answer3Second = display.newText("PURPLE", 0, 0, Arial, textSize)
            question16Answer3Second:setTextColor(1, 51/255, 1)
        end

    elseif (questionNumber == 17) then

        local function AskQuestion17()
            -- set the question text
            question17Text = display.newText("", 0, 0, Arial, textSize)

            -- set the correct answer text, text color, and position
            question17CorrectAnswer = display.newText("", 0, 0, Arial, textSize)
            question17CorrectAnswer:setTextColor(1, 0, 0)

            -- set the first wrong answer text, text color, and position
            question17Answer1 = display.newText("", 0, 0, Arial, textSize)
            question17Answer1:setTextColor(0, 1, 0)

            -- set the second wrong answer text, text color, and position
            question17Answer2 = display.newText("", 0, 0, Arial, textSize)
            question17Answer2:setTextColor(127/255, 0, 1)

            -- set the third wrong answer text, text color, and position
            question17Answer3 = display.newText("", 0, 0, Arial, textSize)
            question17Answer3:setTextColor(1, 51/255, 1)
        end

    elseif (questionNumber == 18) then

        local function AskQuestion18()
            -- set the question text
            question18Text = display.newText("", 0, 0, Arial, textSize)

            -- set the correct answer text, text color, and position
            question18CorrectAnswer = display.newText("", 0, 0, Arial, textSize)
            question18CorrectAnswer:setTextColor(1, 0, 0)

            -- set the first wrong answer text, text color, and position
            question18Answer1 = display.newText("", 0, 0, Arial, textSize)
            question18Answer1:setTextColor(0, 1, 0)

            -- set the second wrong answer text, text color, and position
            question18Answer2 = display.newText("", 0, 0, Arial, textSize)
            question18Answer2:setTextColor(127/255, 0, 1)

            -- set the third wrong answer text, text color, and position
            question18Answer3 = display.newText("", 0, 0, Arial, textSize)
            question18Answer3:setTextColor(1, 51/255, 1)
        end

    elseif (questionNumber == 19) then

        local function AskQuestion19()
            -- set the question text
            question19Text = display.newText("", 0, 0, Arial, textSize)

            -- set the correct answer text, text color, and position
            question19CorrectAnswer = display.newText("", 0, 0, Arial, textSize)
            question19CorrectAnswer:setTextColor(1, 0, 0)

            -- set the first wrong answer text, text color, and position
            question19Answer1 = display.newText("", 0, 0, Arial, textSize)
            question19Answer1:setTextColor(0, 1, 0)

            -- set the second wrong answer text, text color, and position
            question19Answer2 = display.newText("", 0, 0, Arial, textSize)
            question19Answer2:setTextColor(127/255, 0, 1)

            -- set the third wrong answer text, text color, and position
            question19Answer3 = display.newText("", 0, 0, Arial, textSize)
            question19Answer3:setTextColor(1, 51/255, 1)
        end

    elseif (questionNumber == 20) then

        local function AskQuestion20()
            -- set the question text
            question20Text = display.newText("", 0, 0, Arial, textSize)

            -- set the correct answer text, text color, and position
            question20CorrectAnswer = display.newText("", 0, 0, Arial, textSize)
            question20CorrectAnswer:setTextColor(1, 0, 0)

            -- set the first wrong answer text, text color, and position
            question20Answer1 = display.newText("", 0, 0, Arial, textSize)
            question20Answer1:setTextColor(0, 1, 0)

            -- set the second wrong answer text, text color, and position
            question20Answer2 = display.newText("", 0, 0, Arial, textSize)
            question20Answer2:setTextColor(127/255, 0, 1)

            -- set the third wrong answer text, text color, and position
            question20Answer3 = display.newText("", 0, 0, Arial, textSize)
            question20Answer3:setTextColor(1, 51/255, 1)
        end

    end
end

local function Movelogocar(event)

end

local function MoveCar1(event)

end

local function MoveCar2(event)

end

local function MoveCar3(event)

end

-------------------------------------------------------------
--Objects
-------------------------------------------------------------

-----------------------------------------------------------------------------------------
-- GLOBAL SCENE FUNCTIONS
-----------------------------------------------------------------------------------------

-- The function called when the screen doesn't exist
function scene:create( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------

    -- Insert the background image
    bkg_image = display.newImageRect("Images/Level2ScreenKalinaD.F..png", display.contentWidth, display.contentHeight)
    bkg_image.x = display.contentCenterX
    bkg_image.y = display.contentCenterY
    bkg_image.width = display.contentWidth
    bkg_image.height = display.contentHeight

    -- Send the background image to the back layer so all other objects can be on top
    bkg_image:toBack()

        -- Insert background image into the scene group in order to ONLY be associated with this scene
    sceneGroup:insert( bkg_image )    

end --function scene:create( event )

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to appear on screen
function scene:show( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view
    local phase = event.phase

    -----------------------------------------------------------------------------------------

    if ( phase == "will" ) then

        -- Called when the scene is still off screen (but is about to come on screen).
        logocar.x = display.contentWidth*1/8
        logocar.y = display.contentHeight*5.9/8
        logocar:scale(0.1, 0.1)
    -----------------------------------------------------------------------------------------

    elseif ( phase == "did" ) then
        bkgSoundChannel = audio.play( bkgSound, {channel=1, loops=-1})
        -- Called when the scene is now on screen.
        -- Insert code here to make the scene come alive.
        -- Example: start timers, begin animation, play audio, etc.


        -- Ask a question

        Runtime:addEventListener("enterFrame", Movelogocar)

    end
end 
-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to leave the screen
function scene:hide( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view
    local phase = event.phase
    -----------------------------------------------------------------------------------------

    if ( phase == "will" ) then
        -- Called when the scene is on screen (but is about to go off screen).
        -- Insert code here to "pause" the scene.
        -- Example: stop timers, stop animation, stop audio, etc.

    -----------------------------------------------------------------------------------------

    elseif ( phase == "did" ) then
        audio.stop(bkgSoundChannel)
        -- Called immediately after scene goes off screen.
        Runtime:removeEventListener("enterFrame", Movelogocar)
        Runtime:removeEventListener("enterFrame", MovelogocarDown)
        Runtime:removeEventListener("enterFrame", Stop)
    end

end --function scene:hide( event )

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to be destroyed
function scene:destroy( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------

    -- Called prior to the removal of scene's view ("sceneGroup").
    -- Insert code here to clean up the scene.
    -- Example: remove display objects, save state, etc.

end -- function scene:destroy( event )

-----------------------------------------------------------------------------------------
-- EVENT LISTENERS
-----------------------------------------------------------------------------------------

-- Adding Event Listeners
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
-----------------------------------------------------------------------------------------

return scene
