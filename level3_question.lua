-----------------------------------------------------------------------------------------
--
-- level1_screen.lua
-- Created by: Allison
-- Date: May 16, 2017
-- Description: This is the level 1 screen of the game. the charater can be dragged to move
--If character goes off a certain araea they go back to the start. When a user interactes
--with piant a trivia question will come up. they will have a limided time to click on the answer
-----------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------
-- INITIALIZATIONS
-----------------------------------------------------------------------------------------

-- Use Composer Libraries
local composer = require( "composer" )
local widget = require( "widget" )


-----------------------------------------------------------------------------------------

-- Naming Scene
sceneName = "level3_question"

-----------------------------------------------------------------------------------------

-- Creating Scene Object
local scene = composer.newScene( sceneName )

-----------------------------------------------------------------------------------------
-- LOCAL VARIABLES
-----------------------------------------------------------------------------------------

-- The local variables for this scene


local answerPosition = 1
local bkg
local cover

local X1 = display.contentWidth*2/7
local X2 = display.contentWidth*4/7
local Y1 = display.contentHeight*1/2
local Y2 = display.contentHeight*5.5/7

local userAnswer
local textTouched = false
local questionNumber1
local questionNumber2
local questionNumber3
local questionNumber4

-- question1
local question1Text
local question1CorrectAnswer
local question1Answer1
local question1Answer2
local question1Answer3

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
local question5CorrectAnswer
local question5Answer1
local question5Answer2
local question5Answer3

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
local question16CorrectAnswer
local question16Answer1
local question16Answer2
local question16Answer3

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
--LOCAL FUNCTIONS
-----------------------------------------------------------------------------------------

--making transition to next scene
function BackToLevel3() 
    composer.hideOverlay("crossFade", 400 )
  
    ResumeGame()
end 

-----------------------------------------------------------------------------------------
--checking to see if the user pressed the right answer and bring them back to level 1
local function TouchListenerCorrectAnswer(touch)
    userAnswer = answerText.text
    
    if (touch.phase == "ended") then

        BackToLevel3()
    end 
end

--checking to see if the user pressed the right answer and bring them back to level 1
local function TouchListenerAnswer(touch)
    userAnswer = wrongText3.text
    
    if (touch.phase == "ended") then
        
        BackToLevel3()  
    end 
end

--checking to see if the user pressed the right answer and bring them back to level 1
local function TouchListenerAnswer2(touch)
    userAnswer = wrongText2.text
    
    if (touch.phase == "ended") then

        BackToLevel3()
        
    end 
end

local function TouchListenerAnswer3(touch)
    userAnswer = wrongText3.text
    
    if (touch.phase == "ended") then

        BackToLevel3()
        
    end 
end


--adding the event listeners 
local function AddTextListeners ( )
    answerText:addEventListener( "touch", TouchListenerCorrectAnswer )
    wrongText1:addEventListener( "touch", TouchListenerAnswer)
    wrongText2:addEventListener( "touch", TouchListenerAnswer2)
    wrongText3:addEventListener( "touch", TouchListenerAnswer3)

end

--removing the event listeners
local function RemoveTextListeners()
    answerText:removeEventListener( "touch", TouchListenerCorrectAnswer )
    wrongText1:removeEventListener( "touch", TouchListenerAnswer1)
    wrongText2:removeEventListener( "touch", TouchListenerAnswer2)
    wrongText3:removeEventListener( "touch", TouchListenerAnswer3)
end

-- ask a question
local function AskQuestion1()
    -- set the question text
    question1Text = display.newText("What are the three main parts of a plant", 0, 0, Arial, textSize)

    -- set the correct answer text, text color, and position
    question1CorrectAnswer = display.newText("roots, leaves, stem", 0, 0, Arial, textSize)
    question1CorrectAnswer:setTextColor(1, 0, 0)

    -- set the first wrong answer text, text color, and position
    question1Answer1 = display.newText("roots, stem, branches", 0, 0, Arial, textSize)
    question1Answer1:setTextColor(0, 1, 0)

    -- set the second wrong answer text, text color, and position
    question1Answer2 = display.newText("", 0, 0, Arial, textSize)
    question1Answer2:setTextColor(127/255, 0, 1)

    -- set the third wrong answer text, text color, and position
    question1Answer3 = display.newText("", 0, 0, Arial, textSize)
    question1Answer3:setTextColor(1, 51/255, 1)
end

local function AskQuestion2()
    -- set the question text
    question2Text = display.newText("What do roots do", 0, 0, Arial, textSize)

    -- set the correct answer text, text color, and position
    question2CorrectAnswer = display.newText("soak up food and water", 0, 0, Arial, textSize)
    question2CorrectAnswer:setTextColor(1, 0, 0)

    -- set the first wrong answer text, text color, and position
    question2Answer1 = display.newText("grow food", 0, 0, Arial, textSize)
    question2Answer1:setTextColor(1, 51/255, 1)

    -- set the second wrong answer text, text color, and position
    question2Answer2 = display.newText("", 0, 0, Arial, textSize)
    question2Answer2:setTextColor(1, 128/255, 0)

    -- set the third wrong answer text, text color, and position
    question2Answer3 = display.newText("", 0, 0, Arial, textSize) 
    question2Answer3:setTextColor(1, 1, 0)

local function AskQuestion3()
    -- set the question text
    question3Text = display.newText("What do plants do to help animals", 0, 0, Arial, textSize)

    -- set the correct answer text, text color, and position
    question3CorrectAnswer = display.newText("provide food for certain animals", 0, 0, Arial, textSize)
    question3CorrectAnswer:setTextColor(0, 0, 1)

    -- set the first wrong answer text, text color, and position
    question3Answer1 = display.newText("release carbon dioxide animals need", 0, 0, Arial, textSize)
    question3Answer1:setTextColor(1, 0, 0)

    -- set the second wrong answer text, text color, and position
    question3Answer2 = display.newText("", 0, 0, Arial, textSize)
    question3Answer2:setTextColor(127/255, 0, 1)

    -- set the third wrong answer text, text color, and position
    question3Answer3 = display.newText("", 0, 0, Arial, textSize)
    question3Answer3:setTextColor(0, 1, 0)
end

local function AskQuestion4()
    -- set the question text
    question4Text = display.newText("Some plants grow bulbs, what do the bubls do", 0, 0, Arial, textSize)

    -- set the correct answer text, text color, and position
    question4CorrectAnswer = display.newText("turn into flowers", 0, 0, Arial, textSize)
    question4CorrectAnswer:setTextColor(0, 0, 0)

    -- set the first wrong answer text, text color, and position
    question4Answer1 = display.newText("turn into seeds", 0, 0, Arial, textSize)
    question4Answer1:setTextColor(1, 0, 0)

    -- set the second wrong answer text, text color, and position
    question4Answer2 = display.newText("turn into trees", 0, 0, Arial, textSize)
    question4Answer2:setTextColor(0, 0, 1)

    -- set the third wrong answer text, text color, and position
    question4Answer3 = display.newText("turn into grass", 0, 0, Arial, textSize)
    question4Answer3:setTextColor(1, 51/255, 1)
end

local function AskQuestion5()
    -- set the question text
    question5Text = display.newText("how does the sun help plants", 0, 0, Arial, textSize)

    -- set the correct answer text, text color, and position
    question5CorrectAnswerFirst = display.newText("turn the energy from the sun into food", 0, 0, Arial, textSize)
    question5CorrectAnswerFirst:setTextColor(1, 0, 0)

    -- set the first wrong answer text, text color, and position
    question5Answer1First = display.newText("uses the enegy to create pollen", 0, 0, Arial, textSize)
    question5Answer1First:setTextColor(0, 1, 0)


    -- set the second wrong answer text, text color, and position
    question5Answer2First = display.newText("", 0, 0, Arial, textSize)
    question5Answer2First:setTextColor(127/255, 0, 1)


    -- set the third wrong answer text, text color, and position
    question5Answer3First = display.newText("", 0, 0, Arial, textSize)
    question5Answer3First:setTextColor(1, 51/255, 1)

end

local function AskQuestion6()
    -- set the question text
    question6Text = display.newText("What structures are NOT natural", 0, 0, Arial, textSize)

    -- set the correct answer text, text color, and position
    question6CorrectAnswer = display.newText("pyramid", 0, 0, Arial, textSize)
    question6CorrectAnswer:setTextColor(1, 0, 0)

    -- set the first wrong answer text, text color, and position
    question6Answer1 = display.newText("mountain", 0, 0, Arial, textSize)
    question6Answer1:setTextColor(0, 1, 0)

    -- set the second wrong answer text, text color, and position
    question6Answer2 = display.newText("tree", 0, 0, Arial, textSize)
    question6Answer2:setTextColor(127/255, 0, 1)

    -- set the third wrong answer text, text color, and position
    question6Answer3 = display.newText("", 0, 0, Arial, textSize)
    question6Answer3:setTextColor(1, 51/255, 1)
end

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

local function AskQuestion11()
    -- set the question text
    question11Text = display.newText("Click on the Primary Color", 0, 0, Arial, textSize)

    -- set the correct answer text, text color, and position
    question11CorrectAnswer = display.newText("", 0, 0, Arial, textSize)
    question11CorrectAnswer:setTextColor(1, 0, 0)

    -- set the first wrong answer text, text color, and position
    question11Answer1 = display.newText("", 0, 0, Arial, textSize)
    question11Answer1:setTextColor(0, 1, 0)

    -- set the second wrong answer text, text color, and position
    question11Answer2 = display.newText("", 0, 0, Arial, textSize)
    question11Answer2:setTextColor(127/255, 0, 1)

    -- set the third wrong answer text, text color, and position
    question11Answer3 = display.newText("", 0, 0, Arial, textSize)
    question11Answer3:setTextColor(1, 51/255, 1)
end

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

local function AskQuestion16()
    -- set the question text
    question16Text = display.newText("", 0, 0, Arial, textSize)

    -- set the correct answer text, text color, and position
    question16CorrectAnswerFirst = display.newText("", 0, 0, Arial, textSize)
    question16CorrectAnswerFirst:setTextColor(1, 0, 0)
    question16CorrectAnswerPlus = display.newText(" + ", 0, 0, Arial, textSize)
    question16CorrectAnswerPlus:setTextColor(0, 0, 0)
    question16CorrectAnswer = display.newText("", 0, 0, Arial, textSize)
    question16CorrectAnswer:setTextColor(1, 0, 0)

    -- set the first wrong answer text, text color, and position
    question16Answer1First = display.newText("", 0, 0, Arial, textSize)
    question16Answer1First:setTextColor(1, 0, 0)
    question16Answer1Plus = display.newText(" + ", 0, 0, Arial, textSize)
    question16Answer1Plus:setTextColor(0, 0, 0)
    question16Answer1Second = display.newText("", 0, 0, Arial, textSize)
    question16Answer1Second:setTextColor(0, 0, 1)

    -- set the second wrong answer text, text color, and position
    question16Answer2First = display.newText("", 0, 0, Arial, textSize)
    question16Answer2First:setTextColor(127/255, 0, 1)
    question16Answer2Plus = display.newText(" + ", 0, 0, Arial, textSize)
    question16Answer2Plus:setTextColor(0, 0, 0)
    question16Answer2Second = display.newText("", 0, 0, Arial, textSize)
    question16Answer2Second:setTextColor(127/255, 0, 1)

    -- set the third wrong answer text, text color, and position
    question16Answer3First = display.newText("", 0, 0, Arial, textSize)
    question16Answer3First:setTextColor(1, 51/255, 1)
    question16Answer3Plus = display.newText(" + ", 0, 0, Arial, textSize)
    question16Answer3Plus:setTextColor(0, 0, 0)
    question16Answer3Second = display.newText("", 0, 0, Arial, textSize)
    question16Answer3Second:setTextColor(1, 51/255, 1)
end

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

-- ask a question
local function AskQuestion1()
    -- choose out of the possoble 20 questions
    questionNumber1 = math.random(1, 20)

    -- based on the questionNumber, call the function that will create that question. They are seperate because there was too
    --many lines of code in a single function if theye ere all together - there was an error because of it
    if (questionNumber == 1) then
        AskQuestion1()

    elseif (questionNumber == 2) then
        AskQuestion2()

    elseif (questionNumber == 3) then
        AskQuestion3()

    elseif (questionNumber == 4) then
        AskQuestion4()

    elseif (questionNumber == 5) then
        AskQuestion5()

    elseif (questionNumber == 6) then
        AskQuestion6()

    elseif (questionNumber == 7) then
        AskQuestion7()

    elseif (questionNumber == 8) then
        AskQuestion8()

    elseif (questionNumber == 9) then
        AskQuestion9()

    elseif (questionNumber == 10) then
        AskQuestion10()

    elseif (questionNumber == 11) then
        AskQuestion11()

    elseif (questionNumber == 12) then
        AskQuestion12()

    elseif (questionNumber == 13) then
        AskQuestion13()

    elseif (questionNumber == 14) then
        AskQuestion14()

    elseif (questionNumber == 15) then
        AskQuestion15()

    elseif (questionNumber == 16) then
        AskQuestion16()

    elseif (questionNumber == 17) then
        AskQuestion17()

    elseif (questionNumber == 18) then
        AskQuestion18()

    elseif (questionNumber == 19) then
        AskQuestion19()

    elseif (questionNumber == 20) then
        AskQuestion20()

    end
end

-- ask a question
local function AskQuestion2()
    -- choose out of the possoble 20 questions
    questionNumber2 = math.random(1, 20)

    -- based on the questionNumber, call the function that will create that question. They are seperate because there was too
    --many lines of code in a single function if theye ere all together - there was an error because of it
    if (questionNumber == 1) then
        AskQuestion1()

    elseif (questionNumber == 2) then
        AskQuestion2()

    elseif (questionNumber == 3) then
        AskQuestion3()

    elseif (questionNumber == 4) then
        AskQuestion4()

    elseif (questionNumber == 5) then
        AskQuestion5()

    elseif (questionNumber == 6) then
        AskQuestion6()

    elseif (questionNumber == 7) then
        AskQuestion7()

    elseif (questionNumber == 8) then
        AskQuestion8()

    elseif (questionNumber == 9) then
        AskQuestion9()

    elseif (questionNumber == 10) then
        AskQuestion10()

    elseif (questionNumber == 11) then
        AskQuestion11()

    elseif (questionNumber == 12) then
        AskQuestion12()

    elseif (questionNumber == 13) then
        AskQuestion13()

    elseif (questionNumber == 14) then
        AskQuestion14()

    elseif (questionNumber == 15) then
        AskQuestion15()

    elseif (questionNumber == 16) then
        AskQuestion16()

    elseif (questionNumber == 17) then
        AskQuestion17()

    elseif (questionNumber == 18) then
        AskQuestion18()

    elseif (questionNumber == 19) then
        AskQuestion19()

    elseif (questionNumber == 20) then
        AskQuestion20()

    end
end

-- ask a question
local function AskQuestion3()
    -- choose out of the possoble 20 questions
    questionNumber3 = math.random(1, 20)

    -- based on the questionNumber, call the function that will create that question. They are seperate because there was too
    --many lines of code in a single function if theye ere all together - there was an error because of it
    if (questionNumber == 1) then
        AskQuestion1()

    elseif (questionNumber == 2) then
        AskQuestion2()

    elseif (questionNumber == 3) then
        AskQuestion3()

    elseif (questionNumber == 4) then
        AskQuestion4()

    elseif (questionNumber == 5) then
        AskQuestion5()

    elseif (questionNumber == 6) then
        AskQuestion6()

    elseif (questionNumber == 7) then
        AskQuestion7()

    elseif (questionNumber == 8) then
        AskQuestion8()

    elseif (questionNumber == 9) then
        AskQuestion9()

    elseif (questionNumber == 10) then
        AskQuestion10()

    elseif (questionNumber == 11) then
        AskQuestion11()

    elseif (questionNumber == 12) then
        AskQuestion12()

    elseif (questionNumber == 13) then
        AskQuestion13()

    elseif (questionNumber == 14) then
        AskQuestion14()

    elseif (questionNumber == 15) then
        AskQuestion15()

    elseif (questionNumber == 16) then
        AskQuestion16()

    elseif (questionNumber == 17) then
        AskQuestion17()

    elseif (questionNumber == 18) then
        AskQuestion18()

    elseif (questionNumber == 19) then
        AskQuestion19()

    elseif (questionNumber == 20) then
        AskQuestion20()

    end
end

local function PositionAnswers()

    -- creating random start position in a cretain area
    answerPosition = math.random(1,3)

    if (answerPosition == 1) then

        answer

sceneGroup:insert(question1Text)
sceneGroup:insert(question1CorrectAnswer)
sceneGroup:insert(question1Answer1)
sceneGroup:insert(question1Answer2)
sceneGroup:insert(question1Answer3)