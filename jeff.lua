local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")
local ContextActionService = game:GetService("ContextActionService")
local TweenService = game:GetService("TweenService")

-- Блокируем Escape и Leave
ContextActionService:BindAction("BlockExit", function() 
    return Enum.ContextActionResult.Sink 
end, false, Enum.KeyCode.Escape)

-- ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = PlayerGui

-- Фрейм на весь экран
local frame = Instance.new("Frame")
frame.Size = UDim2.new(1,0,1,0)
frame.Position = UDim2.new(0,0,0,0)
frame.BackgroundColor3 = Color3.new(0,0,0)
frame.Parent = screenGui

-- Скример изображение
local image = Instance.new("ImageLabel")
image.Size = UDim2.new(1,0,1,0)
image.Position = UDim2.new(0,0,0,0)
image.Image = "rbxassetid://6404704466" -- вставьте ID картинки
image.BackgroundTransparency = 1
image.Parent = frame

-- Скример звук
local sound = Instance.new("Sound")
sound.SoundId = "rbxassetid://1835337424" -- вставьте ID звука
sound.Volume = 1
sound.Parent = frame
sound:Play()

-- Мигающий эффект
local function flash()
    while true do
        frame.BackgroundColor3 = Color3.new(1,0,0)
        wait(0.1)
        frame.BackgroundColor3 = Color3.new(0,0,0)
        wait(0.1)
    end
end
spawn(flash)

-- Опционально: скрытая кнопка для безопасного закрытия
-- local safeBtn = Instance.new("TextButton")
-- safeBtn.Size = UDim2.new(0,50,0,50)
-- safeBtn.Position = UDim2.new(0,10,0,10)
-- safeBtn.Text = ""
-- safeBtn.BackgroundTransparency = 1
-- safeBtn.Parent = frame
-- safeBtn.MouseButton1Click:Connect(function()
--     screenGui:Destroy()
-- end)
