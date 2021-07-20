
ShiftHeld = false
local gcheck = true
urspeed = -1 -- The lower it is the faster. So don't worry about it being minus 1


function ChangeFaster(inputObject, gameProcessedEvent)
    if inputObject.KeyCode == Enum.KeyCode.Minus and gameProcessedEvent == false then        
urspeed = urspeed - 0.1
    end
end
 


function ChangeSlower(inputObject, gameProcessedEvent)
    if inputObject.KeyCode == Enum.KeyCode.Equals and gameProcessedEvent == false then        
urspeed = urspeed + 0.1
    end
end
 


function GChecker(inputObject, gameProcessedEvent)
    if inputObject.KeyCode == Enum.KeyCode.K and gameProcessedEvent == false then        
if gcheck == false then
gcheck = true
elseif gcheck == true then
gcheck = false
end

    end
end
 
game:GetService("UserInputService").InputBegan:connect(GChecker)



function PressShift(inputObject,gameProcessedEvent)
    if inputObject.KeyCode == Enum.KeyCode.LeftShift and gameProcessedEvent == false and gcheck == true then
        ShiftHeld = true
    end
end

function ReleaseShift(inputObject,gameProcessed)
    if inputObject.KeyCode == Enum.KeyCode.LeftShift then
        ShiftHeld = false
    end
end

game:GetService("UserInputService").InputBegan:connect(PressShift)
game:GetService("UserInputService").InputEnded:connect(ReleaseShift)
game:GetService("UserInputService").InputBegan:connect(ChangeFaster)
game:GetService("UserInputService").InputBegan:connect(ChangeSlower)


game:GetService('RunService').Stepped:connect(function()
if ShiftHeld == true then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0,0,urspeed)
end
end)
