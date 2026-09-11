--[[
i decided to go open source this because i'm no longer to find this game fun anymore. sowwwyy :<
oh and credits to gemini 3.1 pro for some things like blackmarket stuffz

if you're here for the ui instead. it's honestly poorly written and wasn't made for public use. soo you might find this ui horribly made. font uses BuilderSansBold (GothamBold was removed by roblox).
--]]
if not IB_OBFUSCATED then
	IB_NO_VIRTUALIZE = function(fn)
		return fn
	end
end
if not CTN_OBFUSCATED then
	CTN_NO_VIRTUALIZE = function(fn)
		return fn
	end
end
if not GUF_OBFUSCATED then	
	GUF_NO_VIRTUALIZE = function(fn)
		return fn
	end
end
if not SOTR_OBFUSCATED then
    SOTR_EXPOSE = function(f)
        return f
    end
end

--local IconsV2 = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/Footagesus/Icons/main/Main-v2.lua"))()
local notification = loadstring(game:HttpGet("https://pastefy.app/GK511jPO/raw"))()
local Blackscreen = Instance.new("CanvasGroup")
Blackscreen.GroupTransparency = 1
Blackscreen.Visible = false
local mainui = {}
local ts = game:GetService("TweenService")
local resources = {}
local elements = {}
local options = {}

mainui = {
	Color = mainui.Color or Color3.new(1, 1, 0);
	ColorElements = {};
	Flags = {};
}

local function combineall(inst)
	local insts = {}
	insts[inst.Name] = inst
	for i,v in inst:GetDescendants() do
		insts[v.Name] = v
	end
	return insts
end

-- lowkenuinely forgot where this came from and how i got these.
resources.DraggingEnabled = (function(frame, parent)
	parent = parent or frame

	local gui = parent
	local dragging
	local dragInput
	local dragStart
	local startPos

	local function update(input)
		local delta = input.Position - dragStart
		game:GetService("TweenService"):Create(gui,TweenInfo.new(0), {
			Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
		}):Play()
		--gui.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
	end

	frame.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = input.Position
			startPos = gui.Position

			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)

	frame.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			dragInput = input
		end
	end)

	game:GetService("UserInputService").InputChanged:Connect(function(input)
		if input == dragInput and dragging then
			update(input)
		end
	end)
end)

resources.doripple = function(button)
	local player = game:GetService("Players").LocalPlayer
	if not player then
		return
	end
	local mouse = player:GetMouse()
	local circle = Instance.new("ImageLabel")
	circle.Name = "Circle"
	circle.BackgroundColor3 = Color3.new(1, 1, 1)
	circle.BackgroundTransparency = 1
	circle.Image = "rbxassetid://266543268"
	circle.ImageTransparency = 0.5
	circle.ZIndex = 1000
	circle.Parent = button
	button.ClipsDescendants = true
	local size = math.max(button.AbsoluteSize.X, button.AbsoluteSize.Y) 
	circle.Position = UDim2.new(0, mouse.X - button.AbsolutePosition.X, 0, mouse.Y - button.AbsolutePosition.Y)
	circle.Size = UDim2.new(0, 0, 0, 0)
	ts:Create(circle, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
		Size = UDim2.new(0, size, 0, size),
		Position = UDim2.new(0.5, -size / 2, 0.5, -size / 2),
	}):Play()
	ts:Create(circle, TweenInfo.new(0.7, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
		ImageTransparency = 1,
	}):Play()
	task.delay(0.7, function()
		if circle and circle.Parent then
			circle:Destroy()
		end
	end)
end

mainui.addcolorelements = (function(elementinst)
	mainui.ColorElements[#mainui.ColorElements + 1] = elementinst
end)

resources.switchframe = (function(inst)
	local SwitchFrame = Instance.new("TextButton")
	local SwitchFrameStroke = Instance.new("UIStroke")
	local SwitchFrameCorner = Instance.new("UICorner")
	local SwitchFramePadding = Instance.new("UIPadding")
	local SwitchFrameCircle = Instance.new("Frame")
	local SwitchFrameCircleCorner = Instance.new("UICorner")
	local SwitchFrameCircleStroke = Instance.new("UIStroke")

	SwitchFrame.Name = "SwitchFrame"
	SwitchFrame.Parent = inst
	SwitchFrame.AnchorPoint = Vector2.new(0, 0.5)
	SwitchFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 0)
	SwitchFrame.BackgroundTransparency = 1.000
	SwitchFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	SwitchFrame.BorderSizePixel = 0
	SwitchFrame.LayoutOrder = -1
	SwitchFrame.Position = UDim2.new(0, 0, 0.5, 0)
	SwitchFrame.Size = UDim2.new(0, 35, 0, 13)
	SwitchFrame.AutoButtonColor = false
	SwitchFrame.Font = Enum.Font.SourceSans
	SwitchFrame.Text = ""
	SwitchFrame.TextColor3 = Color3.fromRGB(0, 0, 0)
	SwitchFrame.TextSize = 14.000

	SwitchFrameStroke.Name = "SwitchFrameStroke"
	SwitchFrameStroke.Parent = SwitchFrame
	SwitchFrameStroke.Color = Color3.fromRGB(255, 255, 0)
	SwitchFrameStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

	SwitchFrameCorner.CornerRadius = UDim.new(0, 2)
	SwitchFrameCorner.Name = "SwitchFrameCorner"
	SwitchFrameCorner.Parent = SwitchFrame

	SwitchFramePadding.Name = "SwitchFramePadding"
	SwitchFramePadding.Parent = SwitchFrame
	SwitchFramePadding.PaddingBottom = UDim.new(0, 4)
	SwitchFramePadding.PaddingLeft = UDim.new(0, 1)
	SwitchFramePadding.PaddingRight = UDim.new(0, 1)
	SwitchFramePadding.PaddingTop = UDim.new(0, 4)

	SwitchFrameCircle.Name = "SwitchFrameCircle"
	SwitchFrameCircle.Parent = SwitchFrame
	SwitchFrameCircle.AnchorPoint = Vector2.new(0, 0.5)
	SwitchFrameCircle.BackgroundColor3 = Color3.fromRGB(170, 170, 170)
	SwitchFrameCircle.BorderColor3 = Color3.fromRGB(0, 0, 0)
	SwitchFrameCircle.BorderSizePixel = 0
	SwitchFrameCircle.Position = UDim2.new(0, 0, 0.5, 0)
	SwitchFrameCircle.Size = UDim2.new(0, 15, 0, 11)
	SwitchFrameCircle.ZIndex = 2

	SwitchFrameCircleCorner.CornerRadius = UDim.new(0, 2)
	SwitchFrameCircleCorner.Name = "SwitchFrameCircleCorner"
	SwitchFrameCircleCorner.Parent = SwitchFrameCircle

	SwitchFrameCircleStroke.Name = "SwitchFrameCircleStroke"
	SwitchFrameCircleStroke.Parent = SwitchFrameCircle
	SwitchFrameCircleStroke.Color = Color3.fromRGB(255, 255, 0)
	SwitchFrameCircleStroke.Thickness = 0.000

	return combineall(SwitchFrame)
end)

resources.toggle = (function(inst)
	local Toggle = Instance.new("Frame")
	local TogglePadding = Instance.new("UIPadding")
	local ToggleMain = Instance.new("Frame")
	local ToggleMainCorner = Instance.new("UICorner")
	local ToggleMainText = Instance.new("TextLabel")
	local ToggleMainPadding = Instance.new("UIPadding")
	local ToggleMainLayout = Instance.new("UIListLayout")
	local ToggleMainDesc = Instance.new("TextLabel")
	local ToggleFrame = Instance.new("Frame")
	local SwitchFrame = Instance.new("TextButton")
	local SwitchFrameStroke = Instance.new("UIStroke")
	local SwitchFrameCorner = Instance.new("UICorner")
	local SwitchFrameTextOn = Instance.new("TextLabel")
	local SwitchFramePadding = Instance.new("UIPadding")
	local SwitchFrameTextOff = Instance.new("TextLabel")
	local SwitchFrameCircle = Instance.new("Frame")
	local SwitchFrameCircleCorner = Instance.new("UICorner")
	local SwitchFrameCircleStroke = Instance.new("UIStroke")
	local ToggleFrameLayout = Instance.new("UIListLayout")
	local SwitchFrameStatus = Instance.new("TextLabel")
	local UIPadding = Instance.new("UIPadding")

	Toggle.Name = "Toggle"
	Toggle.Parent = inst
	Toggle.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	Toggle.BackgroundTransparency = 1.000
	Toggle.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Toggle.BorderSizePixel = 0
	Toggle.Size = UDim2.new(1, 0, 0, 40)
	Toggle.AutomaticSize = Enum.AutomaticSize.Y

	TogglePadding.Name = "TogglePadding"
	TogglePadding.Parent = Toggle
	TogglePadding.PaddingBottom = UDim.new(0, -5)
	TogglePadding.PaddingLeft = UDim.new(0, 5)
	TogglePadding.PaddingRight = UDim.new(0, 5)

	ToggleMain.Name = "ToggleMain"
	ToggleMain.Parent = Toggle
	ToggleMain.BackgroundColor3 = Color3.fromRGB(28, 30, 31)
	ToggleMain.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ToggleMain.BorderSizePixel = 0
	ToggleMain.Size = UDim2.new(1, 0, 1, 0)
	ToggleMain.AutomaticSize = Enum.AutomaticSize.Y

	ToggleMainCorner.CornerRadius = UDim.new(0, 3)
	ToggleMainCorner.Name = "ToggleMainCorner"
	ToggleMainCorner.Parent = ToggleMain

	ToggleMainText.Name = "ToggleMainText"
	ToggleMainText.Parent = ToggleMain
	ToggleMainText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ToggleMainText.BackgroundTransparency = 1.000
	ToggleMainText.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ToggleMainText.BorderSizePixel = 0
	ToggleMainText.Size = UDim2.new(1, -50, 0, 0)
	ToggleMainText.Font = Enum.Font.BuilderSansBold
	ToggleMainText.Text = "" --"Infinite Jump"
	ToggleMainText.TextColor3 = Color3.fromRGB(200, 200, 200)
	ToggleMainText.TextSize = 13.000
	ToggleMainText.TextWrapped = true
	ToggleMainText.TextXAlignment = Enum.TextXAlignment.Left
	ToggleMainText.TextYAlignment = Enum.TextYAlignment.Bottom
	ToggleMainText.AutomaticSize = Enum.AutomaticSize.Y

	ToggleMainPadding.Name = "ToggleMainPadding"
	ToggleMainPadding.Parent = ToggleMain
	ToggleMainPadding.PaddingBottom = UDim.new(0, 0)
	ToggleMainPadding.PaddingLeft = UDim.new(0, 10)
	ToggleMainPadding.PaddingRight = UDim.new(0, 5)
	ToggleMainPadding.PaddingTop = UDim.new(0, 5)

	ToggleMainLayout.Name = "ToggleMainLayout"
	ToggleMainLayout.Parent = ToggleMain
	ToggleMainLayout.SortOrder = Enum.SortOrder.LayoutOrder

	ToggleMainDesc.Name = "ToggleMainDesc"
	ToggleMainDesc.Parent = ToggleMain
	ToggleMainDesc.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ToggleMainDesc.BackgroundTransparency = 1.000
	ToggleMainDesc.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ToggleMainDesc.BorderSizePixel = 0
	ToggleMainDesc.Size = UDim2.new(1, -10, 0, 0)
	ToggleMainDesc.Font = Enum.Font.BuilderSansBold
	ToggleMainDesc.Text = "" --"Removes character jump limitations."
	ToggleMainDesc.TextColor3 = Color3.fromRGB(141, 141, 141)
	ToggleMainDesc.TextSize = 11.000
	ToggleMainDesc.TextWrapped = true
	ToggleMainDesc.TextXAlignment = Enum.TextXAlignment.Left
	ToggleMainDesc.TextYAlignment = Enum.TextYAlignment.Bottom
	ToggleMainDesc.AutomaticSize = Enum.AutomaticSize.Y

	ToggleFrame.Name = "ToggleFrame"
	ToggleFrame.Parent = ToggleMain
	ToggleFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ToggleFrame.BackgroundTransparency = 1.000
	ToggleFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ToggleFrame.BorderSizePixel = 0
	ToggleFrame.Size = UDim2.new(1, 0, 0, 0)
	ToggleFrame.AutomaticSize = Enum.AutomaticSize.Y

	SwitchFrame.Name = "SwitchFrame"
	SwitchFrame.Parent = ToggleFrame
	SwitchFrame.AnchorPoint = Vector2.new(0, 0.5)
	SwitchFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 0)
	SwitchFrame.BackgroundTransparency = 1.000
	SwitchFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	SwitchFrame.BorderSizePixel = 0
	SwitchFrame.Position = UDim2.new(0, 0, 0.5, 0)
	SwitchFrame.Size = UDim2.new(0, 40, 0, 14)
	SwitchFrame.AutoButtonColor = false
	SwitchFrame.Font = Enum.Font.SourceSans
	SwitchFrame.Text = ""
	SwitchFrame.TextColor3 = Color3.fromRGB(0, 0, 0)
	SwitchFrame.TextSize = 14.000

	SwitchFrameStroke.Name = "SwitchFrameStroke"
	SwitchFrameStroke.Parent = SwitchFrame
	SwitchFrameStroke.Color = Color3.fromRGB(255, 255, 0)
	SwitchFrameStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

	SwitchFrameCorner.CornerRadius = UDim.new(0, 2)
	SwitchFrameCorner.Name = "SwitchFrameCorner"
	SwitchFrameCorner.Parent = SwitchFrame

	SwitchFrameTextOn.Name = "SwitchFrameTextOn"
	SwitchFrameTextOn.Parent = SwitchFrame
	SwitchFrameTextOn.AnchorPoint = Vector2.new(0, 0.5)
	SwitchFrameTextOn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	SwitchFrameTextOn.BackgroundTransparency = 1.000
	SwitchFrameTextOn.BorderColor3 = Color3.fromRGB(0, 0, 0)
	SwitchFrameTextOn.BorderSizePixel = 0
	SwitchFrameTextOn.Position = UDim2.new(0, 0, 0.5, 0)
	SwitchFrameTextOn.Size = UDim2.new(0, 20, 0, 20)
	SwitchFrameTextOn.Visible = false
	SwitchFrameTextOn.ZIndex = 0
	SwitchFrameTextOn.Font = Enum.Font.BuilderSansBold
	SwitchFrameTextOn.Text = "On"
	SwitchFrameTextOn.TextColor3 = Color3.fromRGB(0, 0, 0)
	SwitchFrameTextOn.TextSize = 10.000

	SwitchFramePadding.Name = "SwitchFramePadding"
	SwitchFramePadding.Parent = SwitchFrame
	SwitchFramePadding.PaddingBottom = UDim.new(0, 4)
	SwitchFramePadding.PaddingLeft = UDim.new(0, 1)
	SwitchFramePadding.PaddingRight = UDim.new(0, 1)
	SwitchFramePadding.PaddingTop = UDim.new(0, 4)

	SwitchFrameTextOff.Name = "SwitchFrameTextOff"
	SwitchFrameTextOff.Parent = SwitchFrame
	SwitchFrameTextOff.AnchorPoint = Vector2.new(0, 0.5)
	SwitchFrameTextOff.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	SwitchFrameTextOff.BackgroundTransparency = 1.000
	SwitchFrameTextOff.BorderColor3 = Color3.fromRGB(0, 0, 0)
	SwitchFrameTextOff.BorderSizePixel = 0
	SwitchFrameTextOff.Position = UDim2.new(1, -20, 0.5, 0)
	SwitchFrameTextOff.Size = UDim2.new(0, 20, 0, 20)
	SwitchFrameTextOff.Visible = false
	SwitchFrameTextOff.ZIndex = 0
	SwitchFrameTextOff.Font = Enum.Font.BuilderSansBold
	SwitchFrameTextOff.Text = "Off"
	SwitchFrameTextOff.TextColor3 = Color3.fromRGB(255, 255, 255)
	SwitchFrameTextOff.TextSize = 10.000
	SwitchFrameTextOff.TextXAlignment = Enum.TextXAlignment.Left

	SwitchFrameCircle.Name = "SwitchFrameCircle"
	SwitchFrameCircle.Parent = SwitchFrame
	SwitchFrameCircle.AnchorPoint = Vector2.new(0, 0.5)
	SwitchFrameCircle.BackgroundColor3 = Color3.fromRGB(170, 170, 170)
	SwitchFrameCircle.BorderColor3 = Color3.fromRGB(0, 0, 0)
	SwitchFrameCircle.BorderSizePixel = 0
	SwitchFrameCircle.Position = UDim2.new(0, 0, 0.5, 0)
	SwitchFrameCircle.Size = UDim2.new(0, 20, 0, 12)
	SwitchFrameCircle.ZIndex = 2

	SwitchFrameCircleCorner.CornerRadius = UDim.new(0, 2)
	SwitchFrameCircleCorner.Name = "SwitchFrameCircleCorner"
	SwitchFrameCircleCorner.Parent = SwitchFrameCircle

	SwitchFrameCircleStroke.Name = "SwitchFrameCircleStroke"
	SwitchFrameCircleStroke.Parent = SwitchFrameCircle
	SwitchFrameCircleStroke.Color = Color3.fromRGB(255, 255, 0)
	SwitchFrameCircleStroke.BorderStrokePosition = Enum.BorderStrokePosition.Inner
	SwitchFrameCircleStroke.Thickness = 0

	ToggleFrameLayout.Name = "ToggleFrameLayout"
	ToggleFrameLayout.Parent = ToggleFrame
	ToggleFrameLayout.FillDirection = Enum.FillDirection.Horizontal
	ToggleFrameLayout.SortOrder = Enum.SortOrder.LayoutOrder
	ToggleFrameLayout.VerticalAlignment = Enum.VerticalAlignment.Center
	ToggleFrameLayout.Padding = UDim.new(0, 7)

	SwitchFrameStatus.Name = "SwitchFrameStatus"
	SwitchFrameStatus.Parent = ToggleFrame
	SwitchFrameStatus.AnchorPoint = Vector2.new(0, 0.5)
	SwitchFrameStatus.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	SwitchFrameStatus.BackgroundTransparency = 1.000
	SwitchFrameStatus.BorderColor3 = Color3.fromRGB(0, 0, 0)
	SwitchFrameStatus.BorderSizePixel = 0
	SwitchFrameStatus.Position = UDim2.new(0, 0, 0.5, 0)
	SwitchFrameStatus.Size = UDim2.new(0, 0, 0, 20)
	SwitchFrameStatus.ZIndex = 0
	SwitchFrameStatus.Font = Enum.Font.BuilderSansBold
	SwitchFrameStatus.Text = "Off"
	SwitchFrameStatus.TextColor3 = Color3.fromRGB(200, 200, 200)
	SwitchFrameStatus.TextSize = 12.000
	SwitchFrameStatus.AutomaticSize = Enum.AutomaticSize.X

	UIPadding.Parent = ToggleFrame
	UIPadding.PaddingBottom = UDim.new(0, 5)
	UIPadding.PaddingTop = UDim.new(0, 5)
	UIPadding.PaddingLeft = UDim.new(0, 2)

	return combineall(Toggle)
end)

resources.slider = (function(inst)
	local Slider = Instance.new("Frame")
	local SliderPadding = Instance.new("UIPadding")
	local SliderMain = Instance.new("Frame")
	local SliderMainCorner = Instance.new("UICorner")
	local SliderMainText = Instance.new("TextLabel")
	local SliderMainPadding = Instance.new("UIPadding")
	local SliderMainLayout = Instance.new("UIListLayout")
	local SliderMainDesc = Instance.new("TextLabel")
	local SliderMainFrame = Instance.new("Frame")
	local SliderMainBar = Instance.new("Frame")
	local SliderMainBarCorner = Instance.new("UICorner")
	local SliderMainBarFill = Instance.new("Frame")
	local SliderMainBarFillCorner = Instance.new("UICorner")
	local SliderMainBarFillCircle = Instance.new("TextButton")
	local SliderMainBarFillCircleCorner = Instance.new("UICorner")
	local SliderMainBarFillCircleStroke = Instance.new("UIStroke")
	local SliderMainBarFillCircleStrokeInner = Instance.new("UIStroke")
	local SliderMainBarFillPadding = Instance.new("UIPadding")
	local SliderMainValue = Instance.new("TextLabel")
	local SliderMainPadding_2 = Instance.new("UIPadding")

	Slider.Name = "Slider"
	Slider.Parent = inst
	Slider.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	Slider.BackgroundTransparency = 1.000
	Slider.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Slider.BorderSizePixel = 0
	Slider.Size = UDim2.new(1, 0, 0, 40)
	Slider.AutomaticSize = Enum.AutomaticSize.Y

	SliderPadding.Name = "SliderPadding"
	SliderPadding.Parent = Slider
	SliderPadding.PaddingBottom = UDim.new(0, -5)
	SliderPadding.PaddingLeft = UDim.new(0, 5)
	SliderPadding.PaddingRight = UDim.new(0, 5)

	SliderMain.Name = "SliderMain"
	SliderMain.Parent = Slider
	SliderMain.BackgroundColor3 = Color3.fromRGB(28, 30, 31)
	SliderMain.BorderColor3 = Color3.fromRGB(0, 0, 0)
	SliderMain.BorderSizePixel = 0
	SliderMain.Size = UDim2.new(1, 0, 1, 0)
	SliderMain.AutomaticSize = Enum.AutomaticSize.Y

	SliderMainCorner.CornerRadius = UDim.new(0, 3)
	SliderMainCorner.Name = "SliderMainCorner"
	SliderMainCorner.Parent = SliderMain

	SliderMainText.Name = "SliderMainText"
	SliderMainText.Parent = SliderMain
	SliderMainText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	SliderMainText.BackgroundTransparency = 1.000
	SliderMainText.BorderColor3 = Color3.fromRGB(0, 0, 0)
	SliderMainText.BorderSizePixel = 0
	SliderMainText.Size = UDim2.new(1, -50, 0, 0)
	SliderMainText.Font = Enum.Font.BuilderSansBold
	SliderMainText.Text = "Walkspeed"
	SliderMainText.TextColor3 = Color3.fromRGB(200, 200, 200)
	SliderMainText.TextSize = 13.000
	SliderMainText.TextWrapped = true
	SliderMainText.TextXAlignment = Enum.TextXAlignment.Left
	SliderMainText.TextYAlignment = Enum.TextYAlignment.Bottom
	SliderMainText.AutomaticSize = Enum.AutomaticSize.Y

	SliderMainPadding.Name = "SliderMainPadding"
	SliderMainPadding.Parent = SliderMain
	SliderMainPadding.PaddingBottom = UDim.new(0, 5)
	SliderMainPadding.PaddingLeft = UDim.new(0, 10)
	SliderMainPadding.PaddingRight = UDim.new(0, 5)
	SliderMainPadding.PaddingTop = UDim.new(0, 5)

	SliderMainLayout.Name = "SliderMainLayout"
	SliderMainLayout.Parent = SliderMain
	SliderMainLayout.SortOrder = Enum.SortOrder.LayoutOrder

	SliderMainDesc.Name = "SliderMainDesc"
	SliderMainDesc.Parent = SliderMain
	SliderMainDesc.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	SliderMainDesc.BackgroundTransparency = 1.000
	SliderMainDesc.BorderColor3 = Color3.fromRGB(0, 0, 0)
	SliderMainDesc.BorderSizePixel = 0
	SliderMainDesc.Size = UDim2.new(1, -50, 0, 0)
	SliderMainDesc.Font = Enum.Font.BuilderSansBold
	SliderMainDesc.Text = "Adjusts your character walking speed."
	SliderMainDesc.TextColor3 = Color3.fromRGB(141, 141, 141)
	SliderMainDesc.TextSize = 11.000
	SliderMainDesc.TextWrapped = true
	SliderMainDesc.TextXAlignment = Enum.TextXAlignment.Left
	SliderMainDesc.TextYAlignment = Enum.TextYAlignment.Bottom
	SliderMainDesc.AutomaticSize = Enum.AutomaticSize.Y

	SliderMainFrame.Name = "SliderMainFrame"
	SliderMainFrame.Parent = SliderMain
	SliderMainFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	SliderMainFrame.BackgroundTransparency = 1.000
	SliderMainFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	SliderMainFrame.BorderSizePixel = 0
	SliderMainFrame.Size = UDim2.new(1, 0, 0, 20)

	SliderMainBar.Name = "SliderMainBar"
	SliderMainBar.Parent = SliderMainFrame
	SliderMainBar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	SliderMainBar.BackgroundTransparency = 0.950
	SliderMainBar.BorderColor3 = Color3.fromRGB(0, 0, 0)
	SliderMainBar.BorderSizePixel = 0
	SliderMainBar.Position = UDim2.new(0, 0, 1, -12)
	SliderMainBar.Size = UDim2.new(1, 0, 0, 5)

	SliderMainBarCorner.CornerRadius = UDim.new(0, 2)
	SliderMainBarCorner.Name = "SliderMainBarCorner"
	SliderMainBarCorner.Parent = SliderMainBar

	SliderMainBarFill.Name = "SliderMainBarFill"
	SliderMainBarFill.Parent = SliderMainBar
	SliderMainBarFill.BackgroundColor3 = Color3.fromRGB(255, 255, 0)
	SliderMainBarFill.BorderColor3 = Color3.fromRGB(0, 0, 0)
	SliderMainBarFill.BorderSizePixel = 0
	SliderMainBarFill.Size = UDim2.new(0, 0, 1, 0)

	SliderMainBarFillCorner.CornerRadius = UDim.new(0, 2)
	SliderMainBarFillCorner.Name = "SliderMainBarFillCorner"
	SliderMainBarFillCorner.Parent = SliderMainBarFill

	SliderMainBarFillCircle.Name = "SliderMainBarFillCircle"
	SliderMainBarFillCircle.Parent = SliderMainBarFill
	SliderMainBarFillCircle.AnchorPoint = Vector2.new(0, 0.5)
	SliderMainBarFillCircle.BackgroundColor3 = Color3.fromRGB(216, 216, 0)
	SliderMainBarFillCircle.BorderColor3 = Color3.fromRGB(0, 0, 0)
	SliderMainBarFillCircle.BorderSizePixel = 0
	SliderMainBarFillCircle.Position = UDim2.new(1, -10, 0.5, 0)
	SliderMainBarFillCircle.Size = UDim2.new(0, 8, 0, 8)
	SliderMainBarFillCircle.AutoButtonColor = false
	SliderMainBarFillCircle.Font = Enum.Font.SourceSans
	SliderMainBarFillCircle.Text = ""
	SliderMainBarFillCircle.TextColor3 = Color3.fromRGB(0, 0, 0)
	SliderMainBarFillCircle.TextSize = 14.000

	SliderMainBarFillCircleCorner.CornerRadius = UDim.new(0, 99)
	SliderMainBarFillCircleCorner.Name = "SliderMainBarFillCircleCorner"
	SliderMainBarFillCircleCorner.Parent = SliderMainBarFillCircle

	SliderMainBarFillCircleStroke.Name = "SliderMainBarFillCircleStroke"
	SliderMainBarFillCircleStroke.Parent = SliderMainBarFillCircle
	SliderMainBarFillCircleStroke.Color = Color3.fromRGB(255, 255, 255)
	SliderMainBarFillCircleStroke.Thickness = 2.000
	SliderMainBarFillCircleStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

	SliderMainBarFillCircleStrokeInner.Name = "SliderMainBarFillCircleStrokeInner"
	SliderMainBarFillCircleStrokeInner.Parent = SliderMainBarFillCircle
	SliderMainBarFillCircleStrokeInner.Color = Color3.fromRGB(255, 255, 255)
	SliderMainBarFillCircleStrokeInner.Thickness = 0.000
	SliderMainBarFillCircleStrokeInner.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	SliderMainBarFillCircleStrokeInner.BorderStrokePosition = Enum.BorderStrokePosition.Inner

	SliderMainBarFillPadding.Name = "SliderMainBarFillPadding"
	SliderMainBarFillPadding.Parent = SliderMainBarFill
	SliderMainBarFillPadding.PaddingLeft = UDim.new(0, 10)

	SliderMainValue.Name = "SliderMainValue"
	SliderMainValue.Parent = SliderMainBar
	SliderMainValue.AnchorPoint = Vector2.new(1, 0)
	SliderMainValue.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	SliderMainValue.BackgroundTransparency = 1.000
	SliderMainValue.BorderColor3 = Color3.fromRGB(0, 0, 0)
	SliderMainValue.BorderSizePixel = 0
	SliderMainValue.Position = UDim2.new(1, 0, 0, -20)
	SliderMainValue.Size = UDim2.new(1, 0, 0, 13)
	SliderMainValue.Font = Enum.Font.BuilderSansBold
	SliderMainValue.Text = "123"
	SliderMainValue.TextColor3 = Color3.fromRGB(175, 175, 175)
	SliderMainValue.TextSize = 13.000
	SliderMainValue.TextXAlignment = Enum.TextXAlignment.Right

	SliderMainPadding_2.Name = "SliderMainPadding"
	SliderMainPadding_2.Parent = SliderMainFrame
	SliderMainPadding_2.PaddingRight = UDim.new(0, 5)

	return combineall(Slider)
end)

resources.optionframe = (function(inst, enablesearchbar)
	local Options = Instance.new("Frame")
	local OptionsPadding = Instance.new("UIPadding")
	local OptionsMain = Instance.new("Frame")
	local OptionsMainCorner = Instance.new("UICorner")
	local OptionsMainText = Instance.new("TextLabel")
	local OptionsMainPadding = Instance.new("UIPadding")
	local OptionsMainLayout = Instance.new("UIListLayout")
	local OptionsMainDesc = Instance.new("TextLabel")
	local OptionsFrame = Instance.new("Frame")
	local OptionsFrameLayout = Instance.new("UIListLayout")
	local OptionsFramePadding = Instance.new("UIPadding")

	Options.Name = "Options"
	Options.Parent = inst
	Options.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	Options.BackgroundTransparency = 1.000
	Options.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Options.BorderSizePixel = 0
	Options.Size = UDim2.new(1, 0, 0, 40)
	Options.AutomaticSize = Enum.AutomaticSize.Y

	OptionsPadding.Name = "OptionsPadding"
	OptionsPadding.Parent = Options
	OptionsPadding.PaddingBottom = UDim.new(0, -5)
	OptionsPadding.PaddingLeft = UDim.new(0, 5)
	OptionsPadding.PaddingRight = UDim.new(0, 5)

	OptionsMain.Name = "OptionsMain"
	OptionsMain.Parent = Options
	OptionsMain.BackgroundColor3 = Color3.fromRGB(28, 30, 31)
	OptionsMain.BorderColor3 = Color3.fromRGB(0, 0, 0)
	OptionsMain.BorderSizePixel = 0
	OptionsMain.Size = UDim2.new(1, 0, 1, 0)
	OptionsMain.AutomaticSize = Enum.AutomaticSize.Y

	OptionsMainCorner.CornerRadius = UDim.new(0, 3)
	OptionsMainCorner.Name = "OptionsMainCorner"
	OptionsMainCorner.Parent = OptionsMain

	OptionsMainText.Name = "OptionsMainText"
	OptionsMainText.Parent = OptionsMain
	OptionsMainText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	OptionsMainText.BackgroundTransparency = 1.000
	OptionsMainText.BorderColor3 = Color3.fromRGB(0, 0, 0)
	OptionsMainText.BorderSizePixel = 0
	OptionsMainText.Size = UDim2.new(1, -50, 0, 0)
	OptionsMainText.Font = Enum.Font.BuilderSansBold
	OptionsMainText.Text = "Infinite Jump Mode"
	OptionsMainText.TextColor3 = Color3.fromRGB(200, 200, 200)
	OptionsMainText.TextSize = 13.000
	OptionsMainText.TextWrapped = true
	OptionsMainText.TextXAlignment = Enum.TextXAlignment.Left
	OptionsMainText.TextYAlignment = Enum.TextYAlignment.Bottom
	OptionsMainText.AutomaticSize = Enum.AutomaticSize.Y

	OptionsMainPadding.Name = "OptionsMainPadding"
	OptionsMainPadding.Parent = OptionsMain
	OptionsMainPadding.PaddingBottom = UDim.new(0, 5)
	OptionsMainPadding.PaddingLeft = UDim.new(0, 10)
	OptionsMainPadding.PaddingRight = UDim.new(0, 5)
	OptionsMainPadding.PaddingTop = UDim.new(0, 5)

	OptionsMainLayout.Name = "OptionsMainLayout"
	OptionsMainLayout.Parent = OptionsMain
	OptionsMainLayout.SortOrder = Enum.SortOrder.LayoutOrder

	OptionsMainDesc.Name = "OptionsMainDesc"
	OptionsMainDesc.Parent = OptionsMain
	OptionsMainDesc.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	OptionsMainDesc.BackgroundTransparency = 1.000
	OptionsMainDesc.BorderColor3 = Color3.fromRGB(0, 0, 0)
	OptionsMainDesc.BorderSizePixel = 0
	OptionsMainDesc.Position = UDim2.new(0, 0, 0.311475396, 0)
	OptionsMainDesc.Size = UDim2.new(1, -10, 0, 0)
	OptionsMainDesc.Font = Enum.Font.BuilderSansBold
	OptionsMainDesc.Text = "Select different infinite jump method to use. Each of them behaves the same thing but just different ways."
	OptionsMainDesc.TextColor3 = Color3.fromRGB(141, 141, 141)
	OptionsMainDesc.TextSize = 11.000
	OptionsMainDesc.TextWrapped = true
	OptionsMainDesc.TextXAlignment = Enum.TextXAlignment.Left
	OptionsMainDesc.TextYAlignment = Enum.TextYAlignment.Bottom
	OptionsMainDesc.AutomaticSize = Enum.AutomaticSize.Y

	if enablesearchbar then
		local OptionsSearch = Instance.new("TextBox")
		local OptionsSearchPadding = Instance.new("UIPadding")
		local OptionsSearchCorner = Instance.new("UICorner")
		local OptionsSearchStroke = Instance.new("UIStroke")

		OptionsSearch.Name = "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"
		OptionsSearch.Parent = OptionsFrame
		OptionsSearch.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		OptionsSearch.BackgroundTransparency = 0.950
		OptionsSearch.BorderColor3 = Color3.fromRGB(0, 0, 0)
		OptionsSearch.BorderSizePixel = 0
		OptionsSearch.Size = UDim2.new(1, -5, 0, 16)
		OptionsSearch.Font = Enum.Font.BuilderSansBold
		OptionsSearch.PlaceholderText = "Search..."
		OptionsSearch.Text = ""
		OptionsSearch.TextColor3 = Color3.fromRGB(200, 200, 200)
		OptionsSearch.TextSize = 11.000
		OptionsSearch.TextXAlignment = Enum.TextXAlignment.Left
		OptionsSearch.LayoutOrder = -1

		OptionsSearchPadding.Name = "OptionsSearchPadding"
		OptionsSearchPadding.Parent = OptionsSearch
		OptionsSearchPadding.PaddingLeft = UDim.new(0, 5)

		OptionsSearchCorner.CornerRadius = UDim.new(0, 3)
		OptionsSearchCorner.Name = "OptionsSearchCorner"
		OptionsSearchCorner.Parent = OptionsSearch

		OptionsSearchStroke.Name = "OptionsSearchStroke"
		OptionsSearchStroke.Parent = OptionsSearch
		OptionsSearchStroke.Color = Color3.fromRGB(55, 61, 62)
		OptionsSearchStroke.Thickness = 2.000
		OptionsSearchStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	end

	OptionsFrame.Name = "OptionsFrame"
	OptionsFrame.Parent = OptionsMain
	OptionsFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	OptionsFrame.BackgroundTransparency = 1.000
	OptionsFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	OptionsFrame.BorderSizePixel = 0
	OptionsFrame.Size = UDim2.new(1, 0, 0, 0)
	OptionsFrame.AutomaticSize = Enum.AutomaticSize.Y

	OptionsFrameLayout.Name = "OptionsFrameLayout"
	OptionsFrameLayout.Parent = OptionsFrame
	OptionsFrameLayout.FillDirection = Enum.FillDirection.Horizontal
	OptionsFrameLayout.SortOrder = Enum.SortOrder.LayoutOrder
	OptionsFrameLayout.VerticalAlignment = Enum.VerticalAlignment.Center
	OptionsFrameLayout.Padding = UDim.new(0, 7)
    OptionsFrameLayout.Wraps = true

	OptionsFramePadding.Name = "OptionsFramePadding"
	OptionsFramePadding.Parent = OptionsFrame
	OptionsFramePadding.PaddingBottom = UDim.new(0, 5)
	OptionsFramePadding.PaddingLeft = UDim.new(0, 1)
	OptionsFramePadding.PaddingTop = UDim.new(0, 5)

	return combineall(Options)
end)

resources.optionbutton = (function(inst)
	local OptionsButton = Instance.new("TextButton")
	local OptionsButtonPadding = Instance.new("UIPadding")
	local OptionsButtonCorner = Instance.new("UICorner")
	local OptionsButtonStroke = Instance.new("UIStroke")

	OptionsButton.Name = "OptionsButton"
	OptionsButton.Parent = inst
	OptionsButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	OptionsButton.BackgroundTransparency = 1.000
	OptionsButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
	OptionsButton.BorderSizePixel = 0
	OptionsButton.Size = UDim2.new(0, 0, 0, 16)
	OptionsButton.AutoButtonColor = false
	OptionsButton.Font = Enum.Font.BuilderSansBold
	OptionsButton.Text = "Velocity"
	OptionsButton.TextColor3 = Color3.fromRGB(170, 170, 170)
	OptionsButton.TextSize = 10.000
	OptionsButton.TextXAlignment = Enum.TextXAlignment.Left
	OptionsButton.AutomaticSize = Enum.AutomaticSize.X

	OptionsButtonPadding.Name = "OptionsButtonPadding"
	OptionsButtonPadding.Parent = OptionsButton
	OptionsButtonPadding.PaddingLeft = UDim.new(0, 3)
	OptionsButtonPadding.PaddingRight = UDim.new(0, 3)

	OptionsButtonCorner.CornerRadius = UDim.new(0, 2)
	OptionsButtonCorner.Name = "OptionsButtonCorner"
	OptionsButtonCorner.Parent = OptionsButton

	OptionsButtonStroke.Name = "OptionsButtonStroke"
	OptionsButtonStroke.Parent = OptionsButton
	OptionsButtonStroke.Color = Color3.fromRGB(55, 61, 62)
	OptionsButtonStroke.Thickness = 2.000
	OptionsButtonStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

	return combineall(OptionsButton)
end)

resources.textbox = (function(inst)
	local Textbox = Instance.new("Frame")
	local TextboxPadding = Instance.new("UIPadding")
	local TextboxMain = Instance.new("Frame")
	local TextboxMainCorner = Instance.new("UICorner")
	local TextboxMainText = Instance.new("TextLabel")
	local TextboxMainPadding = Instance.new("UIPadding")
	local TextboxMainLayout = Instance.new("UIListLayout")
	local TextboxMainDesc = Instance.new("TextLabel")
	local TextboxFrame = Instance.new("Frame")
	local TextboxFrameLayout = Instance.new("UIListLayout")
	local TextboxFramePadding = Instance.new("UIPadding")
	local TextboxFrameBox = Instance.new("TextBox")
	local TextboxFrameBoxStroke = Instance.new("UIStroke")
	local TextboxFrameBoxCorner = Instance.new("UICorner")
	local TextboxFrameBoxPadding = Instance.new("UIPadding")

	Textbox.Name = "Textbox"
	Textbox.Parent = inst
	Textbox.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	Textbox.BackgroundTransparency = 1.000
	Textbox.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Textbox.BorderSizePixel = 0
	Textbox.Size = UDim2.new(1, 0, 0, 0)
	Textbox.AutomaticSize = Enum.AutomaticSize.Y

	TextboxPadding.Name = "TextboxPadding"
	TextboxPadding.Parent = Textbox
	TextboxPadding.PaddingBottom = UDim.new(0, -5)
	TextboxPadding.PaddingLeft = UDim.new(0, 5)
	TextboxPadding.PaddingRight = UDim.new(0, 5)

	TextboxMain.Name = "TextboxMain"
	TextboxMain.Parent = Textbox
	TextboxMain.BackgroundColor3 = Color3.fromRGB(28, 30, 31)
	TextboxMain.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TextboxMain.BorderSizePixel = 0
	TextboxMain.Size = UDim2.new(1, 0, 1, 0)
	TextboxMain.AutomaticSize = Enum.AutomaticSize.Y

	TextboxMainCorner.CornerRadius = UDim.new(0, 3)
	TextboxMainCorner.Name = "TextboxMainCorner"
	TextboxMainCorner.Parent = TextboxMain

	TextboxMainText.Name = "TextboxMainText"
	TextboxMainText.Parent = TextboxMain
	TextboxMainText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TextboxMainText.BackgroundTransparency = 1.000
	TextboxMainText.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TextboxMainText.BorderSizePixel = 0
	TextboxMainText.Size = UDim2.new(1, -50, 0, 0)
	TextboxMainText.Font = Enum.Font.BuilderSansBold
	TextboxMainText.Text = ""
	TextboxMainText.TextColor3 = Color3.fromRGB(200, 200, 200)
	TextboxMainText.TextSize = 13.000
	TextboxMainText.TextWrapped = true
	TextboxMainText.TextXAlignment = Enum.TextXAlignment.Left
	TextboxMainText.TextYAlignment = Enum.TextYAlignment.Bottom
	TextboxMainText.AutomaticSize = Enum.AutomaticSize.Y

	TextboxMainPadding.Name = "TextboxMainPadding"
	TextboxMainPadding.Parent = TextboxMain
	TextboxMainPadding.PaddingBottom = UDim.new(0, 5)
	TextboxMainPadding.PaddingLeft = UDim.new(0, 10)
	TextboxMainPadding.PaddingRight = UDim.new(0, 5)
	TextboxMainPadding.PaddingTop = UDim.new(0, 5)

	TextboxMainLayout.Name = "TextboxMainLayout"
	TextboxMainLayout.Parent = TextboxMain
	TextboxMainLayout.SortOrder = Enum.SortOrder.LayoutOrder

	TextboxMainDesc.Name = "TextboxMainDesc"
	TextboxMainDesc.Parent = TextboxMain
	TextboxMainDesc.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TextboxMainDesc.BackgroundTransparency = 1.000
	TextboxMainDesc.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TextboxMainDesc.BorderSizePixel = 0
	TextboxMainDesc.Position = UDim2.new(0, 0, 0.311475396, 0)
	TextboxMainDesc.Size = UDim2.new(1, -10, 0, 0)
	TextboxMainDesc.Font = Enum.Font.BuilderSansBold
	TextboxMainDesc.Text = ""
	TextboxMainDesc.TextColor3 = Color3.fromRGB(141, 141, 141)
	TextboxMainDesc.TextSize = 11.000
	TextboxMainDesc.TextWrapped = true
	TextboxMainDesc.TextXAlignment = Enum.TextXAlignment.Left
	TextboxMainDesc.TextYAlignment = Enum.TextYAlignment.Bottom
	TextboxMainDesc.AutomaticSize = Enum.AutomaticSize.Y

	TextboxFrame.Name = "TextboxFrame"
	TextboxFrame.Parent = TextboxMain
	TextboxFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TextboxFrame.BackgroundTransparency = 1.000
	TextboxFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TextboxFrame.BorderSizePixel = 0
	TextboxFrame.Size = UDim2.new(1, 0, 0, 0)
	TextboxFrame.AutomaticSize = Enum.AutomaticSize.Y

	TextboxFrameLayout.Name = "TextboxFrameLayout"
	TextboxFrameLayout.Parent = TextboxFrame
	TextboxFrameLayout.FillDirection = Enum.FillDirection.Horizontal
	TextboxFrameLayout.SortOrder = Enum.SortOrder.LayoutOrder
	TextboxFrameLayout.VerticalAlignment = Enum.VerticalAlignment.Center
	TextboxFrameLayout.Padding = UDim.new(0, 7)

	TextboxFramePadding.Name = "TextboxFramePadding"
	TextboxFramePadding.Parent = TextboxFrame
	TextboxFramePadding.PaddingBottom = UDim.new(0, 5)
	TextboxFramePadding.PaddingLeft = UDim.new(0, 1)
	TextboxFramePadding.PaddingTop = UDim.new(0, 5)

	TextboxFrameBox.Name = "TextboxFrameBox"
	TextboxFrameBox.Parent = TextboxFrame
	TextboxFrameBox.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	TextboxFrameBox.BackgroundTransparency = 0.950
	TextboxFrameBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TextboxFrameBox.BorderSizePixel = 0
	TextboxFrameBox.Size = UDim2.new(1, -8, 0, 16)
	TextboxFrameBox.ClearTextOnFocus = false
	TextboxFrameBox.Font = Enum.Font.BuilderSansBold
	TextboxFrameBox.PlaceholderColor3 = Color3.fromRGB(144, 144, 144)
	TextboxFrameBox.PlaceholderText = "Type here..."
	TextboxFrameBox.Text = ""
	TextboxFrameBox.TextColor3 = Color3.fromRGB(200, 200, 200)
	TextboxFrameBox.TextSize = 10.000
	TextboxFrameBox.TextWrapped = true
	TextboxFrameBox.TextXAlignment = Enum.TextXAlignment.Left
	TextboxFrameBox.AutomaticSize = Enum.AutomaticSize.Y

	TextboxFrameBoxStroke.Name = "TextboxFrameBoxStroke"
	TextboxFrameBoxStroke.Parent = TextboxFrameBox
	TextboxFrameBoxStroke.Color = Color3.fromRGB(55, 61, 62)
	TextboxFrameBoxStroke.Thickness = 2.000
	TextboxFrameBoxStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

	TextboxFrameBoxCorner.CornerRadius = UDim.new(0, 2)
	TextboxFrameBoxCorner.Name = "TextboxFrameBoxCorner"
	TextboxFrameBoxCorner.Parent = TextboxFrameBox

	TextboxFrameBoxPadding.Name = "TextboxFrameBoxPadding"
	TextboxFrameBoxPadding.Parent = TextboxFrameBox
	TextboxFrameBoxPadding.PaddingBottom = UDim.new(0, 2)
	TextboxFrameBoxPadding.PaddingLeft = UDim.new(0, 5)
	TextboxFrameBoxPadding.PaddingRight = UDim.new(0, 1)
	TextboxFrameBoxPadding.PaddingTop = UDim.new(0, 2)

	return combineall(Textbox)
end)

resources.dropdown = (function(inst, enablesearchbar, ismulti)
	local Dropdown = Instance.new("Frame")
	local DropdownPadding = Instance.new("UIPadding")
	local DropdownMain = Instance.new("Frame")
	local DropdownMainCorner = Instance.new("UICorner")
	local DropdownMainText = Instance.new("TextLabel")
	local DropdownMainPadding = Instance.new("UIPadding")
	local DropdownMainLayout = Instance.new("UIListLayout")
	local DropdownMainDesc = Instance.new("TextLabel")
	
	local DropdownFrame = Instance.new("Frame")
	local DropdownFrameLayout = Instance.new("UIListLayout")
	local DropdownFramePadding = Instance.new("UIPadding")
	
	local DropdownBox = Instance.new("Frame")
	local DropdownBoxStroke = Instance.new("UIStroke")
	local DropdownBoxCorner = Instance.new("UICorner")
	local DropdownBoxLayout = Instance.new("UIListLayout")
	
	local DropdownButton = Instance.new("TextButton")
	local DropdownButtonPadding = Instance.new("UIPadding")
	local DropdownButtonIcon = Instance.new("ImageLabel")

	local DropdownList = Instance.new("ScrollingFrame")
	local DropdownListLayout = Instance.new("UIListLayout")
	local DropdownListPadding = Instance.new("UIPadding")

	Dropdown.Name = "Dropdown"
	Dropdown.Parent = inst
	Dropdown.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	Dropdown.BackgroundTransparency = 1.000
	Dropdown.BorderSizePixel = 0
	Dropdown.Size = UDim2.new(1, 0, 0, 0)
	Dropdown.AutomaticSize = Enum.AutomaticSize.Y

	DropdownPadding.Name = "DropdownPadding"
	DropdownPadding.Parent = Dropdown
	DropdownPadding.PaddingBottom = UDim.new(0, -5)
	DropdownPadding.PaddingLeft = UDim.new(0, 5)
	DropdownPadding.PaddingRight = UDim.new(0, 5)

	DropdownMain.Name = "DropdownMain"
	DropdownMain.Parent = Dropdown
	DropdownMain.BackgroundColor3 = Color3.fromRGB(28, 30, 31)
	DropdownMain.BorderSizePixel = 0
	DropdownMain.Size = UDim2.new(1, 0, 1, 0)
	DropdownMain.AutomaticSize = Enum.AutomaticSize.Y
	DropdownMain.ClipsDescendants = true

	DropdownMainCorner.CornerRadius = UDim.new(0, 3)
	DropdownMainCorner.Parent = DropdownMain

	DropdownMainText.Name = "DropdownMainText"
	DropdownMainText.Parent = DropdownMain
	DropdownMainText.BackgroundTransparency = 1.000
	DropdownMainText.Size = UDim2.new(1, -50, 0, 0)
	DropdownMainText.Font = Enum.Font.BuilderSansBold
	DropdownMainText.TextColor3 = Color3.fromRGB(200, 200, 200)
	DropdownMainText.TextSize = 13.000
	DropdownMainText.TextXAlignment = Enum.TextXAlignment.Left
	DropdownMainText.AutomaticSize = Enum.AutomaticSize.Y
	DropdownMainText.LayoutOrder = 1

	DropdownMainPadding.Parent = DropdownMain
	DropdownMainPadding.PaddingBottom = UDim.new(0, 5)
	DropdownMainPadding.PaddingLeft = UDim.new(0, 10)
	DropdownMainPadding.PaddingRight = UDim.new(0, 5)
	DropdownMainPadding.PaddingTop = UDim.new(0, 5)

	DropdownMainLayout.Parent = DropdownMain
	DropdownMainLayout.SortOrder = Enum.SortOrder.LayoutOrder
	DropdownMainLayout.Padding = UDim.new(0, 0)

	DropdownMainDesc.Name = "DropdownMainDesc"
	DropdownMainDesc.Parent = DropdownMain
	DropdownMainDesc.BackgroundTransparency = 1.000
	DropdownMainDesc.Size = UDim2.new(1, -10, 0, 0)
	DropdownMainDesc.Font = Enum.Font.BuilderSansBold
	DropdownMainDesc.TextColor3 = Color3.fromRGB(141, 141, 141)
	DropdownMainDesc.TextSize = 11.000
	DropdownMainDesc.TextWrapped = true
	DropdownMainDesc.TextXAlignment = Enum.TextXAlignment.Left
	DropdownMainDesc.AutomaticSize = Enum.AutomaticSize.Y
	DropdownMainDesc.LayoutOrder = 2

	DropdownFrame.Name = "DropdownFrame"
	DropdownFrame.Parent = DropdownMain
	DropdownFrame.BackgroundTransparency = 1.000
	DropdownFrame.Size = UDim2.new(1, 0, 0, 0)
	DropdownFrame.AutomaticSize = Enum.AutomaticSize.Y
	DropdownFrame.LayoutOrder = 3
	
	DropdownFrameLayout.Parent = DropdownFrame
	DropdownFrameLayout.SortOrder = Enum.SortOrder.LayoutOrder
	
	DropdownFramePadding.Parent = DropdownFrame
	DropdownFramePadding.PaddingBottom = UDim.new(0, 5)
	DropdownFramePadding.PaddingLeft = UDim.new(0, 1)
	DropdownFramePadding.PaddingTop = UDim.new(0, 5)

	DropdownBox.Name = "DropdownBox"
	DropdownBox.Parent = DropdownFrame
	DropdownBox.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	DropdownBox.BackgroundTransparency = 0.950
	DropdownBox.BorderSizePixel = 0
	DropdownBox.Size = UDim2.new(1, -8, 0, 20)
	DropdownBox.ClipsDescendants = true
	DropdownBox.LayoutOrder = 1
	
	DropdownBoxCorner.CornerRadius = UDim.new(0, 2)
	DropdownBoxCorner.Parent = DropdownBox

	DropdownBoxStroke.Color = Color3.fromRGB(55, 61, 62)
	DropdownBoxStroke.Thickness = 2.000
	DropdownBoxStroke.Parent = DropdownBox
	
	DropdownBoxLayout.Parent = DropdownBox
	DropdownBoxLayout.SortOrder = Enum.SortOrder.LayoutOrder

	DropdownButton.Name = "DropdownButton"
	DropdownButton.Parent = DropdownBox
	DropdownButton.BackgroundTransparency = 1.000
	DropdownButton.Size = UDim2.new(1, 0, 0, 20)
	DropdownButton.Font = Enum.Font.BuilderSansBold
	DropdownButton.Text = "Select Option..."
	DropdownButton.TextColor3 = Color3.fromRGB(200, 200, 200)
	DropdownButton.TextSize = 10.000
	DropdownButton.TextXAlignment = Enum.TextXAlignment.Left
	DropdownButton.TextTruncate = Enum.TextTruncate.AtEnd
	DropdownButton.LayoutOrder = 1
	DropdownButton.TextWrapped = true
	DropdownButton.AutomaticSize = Enum.AutomaticSize.Y
	
	DropdownButtonPadding.Parent = DropdownButton
	DropdownButtonPadding.PaddingBottom = UDim.new(0, 2)
	DropdownButtonPadding.PaddingLeft = UDim.new(0, 5)
	DropdownButtonPadding.PaddingRight = UDim.new(0, 18)
	DropdownButtonPadding.PaddingTop = UDim.new(0, 2)

	DropdownButtonIcon.Name = "DropdownButtonIcon"
	DropdownButtonIcon.Parent = DropdownButton
	DropdownButtonIcon.AnchorPoint = Vector2.new(1, 0.5)
	DropdownButtonIcon.BackgroundTransparency = 1.000
	DropdownButtonIcon.Position = UDim2.new(1, 14, 0.5, 0)
	DropdownButtonIcon.Size = UDim2.new(0, 12, 0, 12)
	DropdownButtonIcon.Image = "rbxassetid://6031090401"
	DropdownButtonIcon.ImageColor3 = Color3.fromRGB(200, 200, 200)

	if enablesearchbar then
		local DropdownSearchContainer = Instance.new("Frame")
		DropdownSearchContainer.Name = "DropdownSearchContainer"
		DropdownSearchContainer.Parent = DropdownBox
		DropdownSearchContainer.BackgroundTransparency = 1.000
		DropdownSearchContainer.Size = UDim2.new(1, 0, 0, 20)
		DropdownSearchContainer.LayoutOrder = 2

		local DropdownSearchDividerTop = Instance.new("Frame")
		DropdownSearchDividerTop.Name = "DropdownSearchDividerTop"
		DropdownSearchDividerTop.Parent = DropdownSearchContainer
		DropdownSearchDividerTop.BackgroundColor3 = Color3.fromRGB(55, 61, 62)
		DropdownSearchDividerTop.BorderSizePixel = 0
		DropdownSearchDividerTop.Size = UDim2.new(1, 0, 0, 1)

		local DropdownSearchDividerBottom = Instance.new("Frame")
		DropdownSearchDividerBottom.Name = "DropdownSearchDividerBottom"
		DropdownSearchDividerBottom.Parent = DropdownSearchContainer
		DropdownSearchDividerBottom.BackgroundColor3 = Color3.fromRGB(55, 61, 62)
		DropdownSearchDividerBottom.BorderSizePixel = 0
		DropdownSearchDividerBottom.Position = UDim2.new(0, 0, 1, -1)
		DropdownSearchDividerBottom.Size = UDim2.new(1, 0, 0, 1)
		
		if ismulti then
			DropdownSearchDividerBottom.Visible = false
		end

		local DropdownSearchIcon = Instance.new("ImageLabel")
		DropdownSearchIcon.Name = "DropdownSearchIcon"
		DropdownSearchIcon.Parent = DropdownSearchContainer
		DropdownSearchIcon.AnchorPoint = Vector2.new(0, 0.5)
		DropdownSearchIcon.BackgroundTransparency = 1.000
		DropdownSearchIcon.Position = UDim2.new(0, 5, 0.5, 0)
		DropdownSearchIcon.Size = UDim2.new(0, 12, 0, 12)
		DropdownSearchIcon.Image = "rbxassetid://6031154871" 
		DropdownSearchIcon.ImageColor3 = Color3.fromRGB(200, 200, 200)

		local DropdownSearch = Instance.new("TextBox")
		DropdownSearch.Name = "DropdownSearch"
		DropdownSearch.Parent = DropdownSearchContainer
		DropdownSearch.BackgroundTransparency = 1.000
		DropdownSearch.Position = UDim2.new(0, 0, 0, 1)
		DropdownSearch.Size = UDim2.new(1, 0, 1, -2)
		DropdownSearch.Font = Enum.Font.BuilderSansBold
		DropdownSearch.PlaceholderText = "Search..."
		DropdownSearch.PlaceholderColor3 = Color3.fromRGB(144, 144, 144)
		DropdownSearch.Text = ""
		DropdownSearch.TextColor3 = Color3.fromRGB(200, 200, 200)
		DropdownSearch.TextSize = 10.000
		DropdownSearch.TextXAlignment = Enum.TextXAlignment.Left
		DropdownSearch.ClearTextOnFocus = false

		local DropdownSearchPadding = Instance.new("UIPadding")
		DropdownSearchPadding.Parent = DropdownSearch
		DropdownSearchPadding.PaddingLeft = UDim.new(0, 22)
		DropdownSearchPadding.PaddingRight = UDim.new(0, 5)
	end

	-- FIXED: Switched to Absolute Positioning so the dividers don't break!
	if ismulti then
		local DropdownActionContainer = Instance.new("Frame")
		DropdownActionContainer.Name = "DropdownActionContainer"
		DropdownActionContainer.Parent = DropdownBox
		DropdownActionContainer.BackgroundTransparency = 1.000
		DropdownActionContainer.Size = UDim2.new(1, 0, 0, 20)
		DropdownActionContainer.LayoutOrder = 3

		local DropdownActionDividerTop = Instance.new("Frame")
		DropdownActionDividerTop.Name = "DropdownActionDividerTop"
		DropdownActionDividerTop.Parent = DropdownActionContainer
		DropdownActionDividerTop.BackgroundColor3 = Color3.fromRGB(55, 61, 62)
		DropdownActionDividerTop.BorderSizePixel = 0
		DropdownActionDividerTop.Size = UDim2.new(1, 0, 0, 1)

		local DropdownActionDividerBottom = Instance.new("Frame")
		DropdownActionDividerBottom.Name = "DropdownActionDividerBottom"
		DropdownActionDividerBottom.Parent = DropdownActionContainer
		DropdownActionDividerBottom.BackgroundColor3 = Color3.fromRGB(55, 61, 62)
		DropdownActionDividerBottom.BorderSizePixel = 0
		DropdownActionDividerBottom.Position = UDim2.new(0, 0, 1, -1)
		DropdownActionDividerBottom.Size = UDim2.new(1, 0, 0, 1)

		local DropdownSelectAll = Instance.new("TextButton")
		DropdownSelectAll.Name = "DropdownSelectAll"
		DropdownSelectAll.Parent = DropdownActionContainer
		DropdownSelectAll.BackgroundTransparency = 1.000
		DropdownSelectAll.Position = UDim2.new(0, 0, 0, 0)
		DropdownSelectAll.Size = UDim2.new(0.5, 0, 1, 0)
		DropdownSelectAll.Font = Enum.Font.BuilderSansBold
		DropdownSelectAll.Text = "Select All"
		DropdownSelectAll.TextColor3 = Color3.fromRGB(170, 170, 170)
		DropdownSelectAll.TextSize = 10.000

		-- Slick 1-pixel divider right down the center
		local DropdownActionCenterDivider = Instance.new("Frame")
		DropdownActionCenterDivider.Name = "DropdownActionCenterDivider"
		DropdownActionCenterDivider.Parent = DropdownSelectAll
		DropdownActionCenterDivider.AnchorPoint = Vector2.new(1, 0.5)
		DropdownActionCenterDivider.BackgroundColor3 = Color3.fromRGB(55, 61, 62)
		DropdownActionCenterDivider.BorderSizePixel = 0
		DropdownActionCenterDivider.Position = UDim2.new(1, 0, 0.5, 0)
		DropdownActionCenterDivider.Size = UDim2.new(0, 1, 1, -6)

		local DropdownDeselectAll = Instance.new("TextButton")
		DropdownDeselectAll.Name = "DropdownDeselectAll"
		DropdownDeselectAll.Parent = DropdownActionContainer
		DropdownDeselectAll.BackgroundTransparency = 1.000
		DropdownDeselectAll.Position = UDim2.new(0.5, 0, 0, 0)
		DropdownDeselectAll.Size = UDim2.new(0.5, 0, 1, 0)
		DropdownDeselectAll.Font = Enum.Font.BuilderSansBold
		DropdownDeselectAll.Text = "Deselect All"
		DropdownDeselectAll.TextColor3 = Color3.fromRGB(170, 170, 170)
		DropdownDeselectAll.TextSize = 10.000
	end

	DropdownList.Name = "DropdownList"
	DropdownList.Parent = DropdownBox
	DropdownList.BackgroundTransparency = 1.000
	DropdownList.Size = UDim2.new(1, 0, 0, 0)
	DropdownList.ScrollBarThickness = 2
	DropdownList.ScrollBarImageColor3 = Color3.fromRGB(55, 61, 62)
	DropdownList.LayoutOrder = 4 

	DropdownListLayout.Parent = DropdownList
	DropdownListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	DropdownListLayout.Padding = UDim.new(0, 2)

	DropdownListPadding.Parent = DropdownList
	DropdownListPadding.PaddingBottom = UDim.new(0, 2)
	DropdownListPadding.PaddingLeft = UDim.new(0, 2)
	DropdownListPadding.PaddingRight = UDim.new(0, 2)
	DropdownListPadding.PaddingTop = UDim.new(0, 2)

	return combineall(Dropdown)
end)

resources.dropdownoption = (function(inst)
	local OptionButton = Instance.new("TextButton")
	local OptionButtonCorner = Instance.new("UICorner")
	local OptionButtonPadding = Instance.new("UIPadding")

	OptionButton.Name = "OptionButton"
	OptionButton.Parent = inst
	OptionButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	OptionButton.BackgroundTransparency = 1.000
	OptionButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
	OptionButton.BorderSizePixel = 0
	OptionButton.Size = UDim2.new(1, 0, 0, 16)
	OptionButton.AutoButtonColor = false
	OptionButton.Font = Enum.Font.BuilderSansBold
	OptionButton.Text = "Option"
	OptionButton.TextColor3 = Color3.fromRGB(170, 170, 170)
	OptionButton.TextSize = 10.000
	OptionButton.TextXAlignment = Enum.TextXAlignment.Left

	OptionButtonCorner.CornerRadius = UDim.new(0, 2)
	OptionButtonCorner.Name = "OptionButtonCorner"
	OptionButtonCorner.Parent = OptionButton

	OptionButtonPadding.Name = "OptionButtonPadding"
	OptionButtonPadding.Parent = OptionButton
	OptionButtonPadding.PaddingLeft = UDim.new(0, 5)
	OptionButtonPadding.PaddingRight = UDim.new(0, 5)

	return combineall(OptionButton)
end)

resources.section = (function(inst)
	local Section = Instance.new("Frame")
	local SectionCorner = Instance.new("UICorner")
	local SectionTopbar = Instance.new("Frame")
	local SectionTopbarFrame = Instance.new("Frame")
	local SectionTopbarFrameCorner = Instance.new("UICorner")
	local SectionTopbarFrameTitle = Instance.new("TextLabel")
	local SectionTopbarFramePadding = Instance.new("UIPadding")
	local SectionTopbarFrameLayout = Instance.new("UIListLayout")
	local SectionTopbarFrameDesc = Instance.new("TextLabel")
	local SectionStroke = Instance.new("UIStroke")
	local SectionLayout = Instance.new("UIListLayout")

	Section.Name = "Section"
	Section.Parent = inst
	Section.BackgroundColor3 = Color3.fromRGB(28, 30, 31)
	Section.BackgroundTransparency = 1.000
	Section.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Section.BorderSizePixel = 0
	Section.ClipsDescendants = true
	Section.Size = UDim2.new(1, 0, 0, 313)

	SectionCorner.CornerRadius = UDim.new(0, 5)
	SectionCorner.Name = "SectionCorner"
	SectionCorner.Parent = Section

	SectionTopbar.Name = "SectionTopbar"
	SectionTopbar.Parent = Section
	SectionTopbar.BackgroundColor3 = Color3.fromRGB(28, 30, 31)
	SectionTopbar.BorderColor3 = Color3.fromRGB(0, 0, 0)
	SectionTopbar.BorderSizePixel = 0
	SectionTopbar.Size = UDim2.new(1, 0, 0, 0)
	SectionTopbar.AutomaticSize = Enum.AutomaticSize.Y

	SectionTopbarFrame.Name = "SectionTopbarFrame"
	SectionTopbarFrame.Parent = SectionTopbar
	SectionTopbarFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	SectionTopbarFrame.BackgroundTransparency = 1.000
	SectionTopbarFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	SectionTopbarFrame.BorderSizePixel = 0
	SectionTopbarFrame.Size = UDim2.new(1, 0, 1, 0)
	SectionTopbarFrame.AutomaticSize = Enum.AutomaticSize.Y

	SectionTopbarFrameCorner.CornerRadius = UDim.new(0, 3)
	SectionTopbarFrameCorner.Name = "SectionTopbarFrameCorner"
	SectionTopbarFrameCorner.Parent = SectionTopbarFrame

	SectionTopbarFrameTitle.Name = "SectionTopbarFrameTitle"
	SectionTopbarFrameTitle.Parent = SectionTopbarFrame
	SectionTopbarFrameTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	SectionTopbarFrameTitle.BackgroundTransparency = 1.000
	SectionTopbarFrameTitle.BorderColor3 = Color3.fromRGB(0, 0, 0)
	SectionTopbarFrameTitle.BorderSizePixel = 0
	SectionTopbarFrameTitle.Size = UDim2.new(1, 0, 0, 19)
	SectionTopbarFrameTitle.Font = Enum.Font.BuilderSansBold
	SectionTopbarFrameTitle.Text = "Humanoid"
	SectionTopbarFrameTitle.TextColor3 = Color3.fromRGB(200, 200, 200)
	SectionTopbarFrameTitle.TextSize = 13.000
	SectionTopbarFrameTitle.TextWrapped = true
	SectionTopbarFrameTitle.TextXAlignment = Enum.TextXAlignment.Left
	SectionTopbarFrameTitle.TextYAlignment = Enum.TextYAlignment.Bottom

	SectionTopbarFramePadding.Name = "SectionTopbarFramePadding"
	SectionTopbarFramePadding.Parent = SectionTopbarFrame
	SectionTopbarFramePadding.PaddingBottom = UDim.new(0, 10)
	SectionTopbarFramePadding.PaddingLeft = UDim.new(0, 10)
	SectionTopbarFramePadding.PaddingRight = UDim.new(0, 10)

	SectionTopbarFrameLayout.Name = "SectionTopbarFrameLayout"
	SectionTopbarFrameLayout.Parent = SectionTopbarFrame
	SectionTopbarFrameLayout.SortOrder = Enum.SortOrder.LayoutOrder
	SectionTopbarFrameLayout.Padding = UDim.new(0, 2)

	SectionTopbarFrameDesc.Name = "SectionTopbarFrameDesc"
	SectionTopbarFrameDesc.Parent = SectionTopbarFrame
	SectionTopbarFrameDesc.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	SectionTopbarFrameDesc.BackgroundTransparency = 1.000
	SectionTopbarFrameDesc.BorderColor3 = Color3.fromRGB(0, 0, 0)
	SectionTopbarFrameDesc.BorderSizePixel = 0
	SectionTopbarFrameDesc.Size = UDim2.new(1, 0, 0, 0)
	SectionTopbarFrameDesc.Font = Enum.Font.BuilderSansBold
	SectionTopbarFrameDesc.Text = "Character related features."
	SectionTopbarFrameDesc.TextColor3 = Color3.fromRGB(141, 141, 141)
	SectionTopbarFrameDesc.TextSize = 11.000
	SectionTopbarFrameDesc.TextWrapped = true
	SectionTopbarFrameDesc.TextXAlignment = Enum.TextXAlignment.Left
	SectionTopbarFrameDesc.TextYAlignment = Enum.TextYAlignment.Top
	SectionTopbarFrameDesc.AutomaticSize = Enum.AutomaticSize.Y

	SectionStroke.Name = "SectionStroke"
	SectionStroke.Parent = Section
	SectionStroke.Color = Color3.fromRGB(28, 30, 31)

	SectionLayout.Name = "SectionLayout"
	SectionLayout.Parent = Section
	SectionLayout.SortOrder = Enum.SortOrder.LayoutOrder
	SectionLayout.Padding = UDim.new(0, 5)

	return combineall(Section)
end)

elements.toggle = (function(inst, con)
	con = con or {}
	con.Name = con.Name or "tthis is good toggle"
	con.Desc = con.Desc
	con.Callback = con.Callback or function(a) print(a) end
	con.Flags = con.Flags or con.Name:gsub(" ", "")
	con.Options = con.Options or nil

	local toggle = resources.toggle(inst)
	local togglefunctions = {}
	local toggled = false

	toggle.ToggleMainText.Text = con.Name
	if con.Desc then
		toggle.ToggleMainDesc.Text = con.Desc
	else
		toggle.ToggleMainDesc.Visible = false
	end

	togglefunctions.Toggle = (function()
		if not toggled then
			game.TweenService:Create(toggle.SwitchFrameCircle, TweenInfo.new(0.25, Enum.EasingStyle.Quart), {Position = UDim2.new(1, -20, 0.5, 0)}):Play()
			game.TweenService:Create(toggle.SwitchFrameCircleStroke, TweenInfo.new(0.25, Enum.EasingStyle.Quart), {Thickness = 10}):Play()
		else
			game.TweenService:Create(toggle.SwitchFrameCircle, TweenInfo.new(0.25, Enum.EasingStyle.Quart), {Position = UDim2.new(0, 0, 0.5, 0)}):Play()
			game.TweenService:Create(toggle.SwitchFrameCircleStroke, TweenInfo.new(0.25, Enum.EasingStyle.Quart), {Thickness = 0}):Play()
		end
		toggled = not toggled
		task.spawn(function()
			con.Callback(toggled)
		end)
		toggle.SwitchFrameStatus.Text = toggled and "On" or "Off"
	end)

	togglefunctions.Set = (function(state)
		if typeof(state) ~= "boolean" then
			togglefunctions.Toggle()
			return
		end
		if toggled ~= state then
			togglefunctions.Toggle()
		end
	end)

	togglefunctions.SetDesc = (function(a)
		toggle.ToggleMainDesc.Text = a
	end)

	toggle.SwitchFrame.MouseButton1Click:Connect(function()
		togglefunctions.Toggle()
	end)

	if con.Default then
		togglefunctions.Set(true)
	end

	return togglefunctions
end)

elements.slider = (function(inst, con)
	con = con or {}
	con.Name = con.Name or "slider"
	con.Desc = con.Desc
	con.Default = con.Default or 0
	con.Min = con.Min or 0
	con.Max = con.Max or 100
	con.Round = con.Round or 0
	con.Flags = con.Flags or con.Name:gsub(" ", "")
	con.Prefix = con.Prefix or ""
	con.Callback = con.Callback or function(a)  end

	local slider = resources.slider(inst)
	local sliderfunctions = {}

	slider.SliderMainText.Text = con.Name
	slider.SliderMainDesc.Text = con.Desc
	if con.Desc then
		slider.SliderMainDesc.Visible = true
	else
		slider.SliderMainDesc.Visible = false
	end

	local mouse = game:GetService("Players").LocalPlayer:GetMouse()
	local uis = game:GetService("UserInputService")
	local Min_Value = con.Min
	local Max_Value = con.Max
	local Bar = slider.SliderMainBarFill
	local Sliderbox = slider.SliderMainValue
	local Trigger = slider.SliderMainBarFillCircle
	local DefaultValue = con.Default
	local isSliding = false
	local sliderFormat = "%."..tostring(con.Round or 0).."f"

	if DefaultValue then 
		if DefaultValue <= Min_Value then 
			DefaultValue = Min_Value 
		elseif DefaultValue >= Max_Value then 
			DefaultValue = Max_Value 
		end
		Bar.Size = UDim2.new(1 - ((Max_Value - DefaultValue) / (Max_Value - Min_Value)),0, 0, slider.SliderMainBar.AbsoluteSize.Y)
		Sliderbox.Text = tostring(DefaultValue).. con.Prefix
		con.Callback(DefaultValue)
	end

	Trigger.MouseButton1Down:Connect(function()
		isSliding = true
		local value = tonumber(string.format(sliderFormat,(((Max_Value - Min_Value) / (slider.SliderMainBar.AbsoluteSize.X - 0)) * Bar.AbsoluteSize.X) + tonumber(Min_Value)))
		pcall(function()
			con.Callback(value)
			Sliderbox.Text = tostring(value).. con.Prefix
			--CONFIG[name][con.Name] = value
		end)
		Bar.Size = UDim2.new(0, math.clamp(mouse.X - Bar.AbsolutePosition.X, 0, (slider.SliderMainBar.AbsoluteSize.X + 0)), 0, slider.SliderMainBar.AbsoluteSize.Y)
		game.TweenService:Create(slider.SliderMainBarFillCircleStrokeInner, TweenInfo.new(1, Enum.EasingStyle.Quart), {Thickness = 20}):Play()
		moveconnection = mouse.Move:Connect(function()   
			local value = tonumber(string.format(sliderFormat,(((Max_Value - Min_Value) / (slider.SliderMainBar.AbsoluteSize.X - 0)) * Bar.AbsoluteSize.X) + tonumber(Min_Value)))
			pcall(function()
				con.Callback(value)
				Sliderbox.Text = tostring(value).. con.Prefix
				--CONFIG[name][con.Name] = value
			end)
			Bar.Size = UDim2.new(0, math.clamp(mouse.X - Bar.AbsolutePosition.X, 0, (slider.SliderMainBar.AbsoluteSize.X + 0)), 0, slider.SliderMainBar.AbsoluteSize.Y)
		end)
		releaseconnection = uis.InputEnded:Connect(function(Mouse)
			if Mouse.UserInputType == Enum.UserInputType.MouseButton1 or Mouse.UserInputType == Enum.UserInputType.Touch then
				local value = tonumber(string.format(sliderFormat,(((Max_Value - Min_Value) / (slider.SliderMainBar.AbsoluteSize.X - 0)) * Bar.AbsoluteSize.X) + tonumber(Min_Value)))
				pcall(function()
					con.Callback(value)
					Sliderbox.Text = tostring(value).. con.Prefix
					--CONFIG[name][con.Name] = value
				end)
				Bar.Size = UDim2.new(0, math.clamp(mouse.X - Bar.AbsolutePosition.X, 0, (slider.SliderMainBar.AbsoluteSize.X + 0)), 0, slider.SliderMainBar.AbsoluteSize.Y)
			end
		end)
		uis.InputEnded:Connect(function(Mouse)
			if Mouse.UserInputType == Enum.UserInputType.MouseButton1 or Mouse.UserInputType == Enum.UserInputType.Touch then
				game.TweenService:Create(slider.SliderMainBarFillCircleStrokeInner, TweenInfo.new(1, Enum.EasingStyle.Quart), {Thickness = 0}):Play()
				moveconnection:Disconnect()
				releaseconnection:Disconnect()
				isSliding = false
			end
		end)
	end)

	sliderfunctions.Set = (function(val)
		DefaultValue = val
		if DefaultValue <= Min_Value then 
			DefaultValue = Min_Value 
		elseif DefaultValue >= Max_Value then 
			DefaultValue = Max_Value 
		end
		Bar.Size = UDim2.new(1 - ((Max_Value - DefaultValue) / (Max_Value - Min_Value)),0, 0, slider.SliderMainBar.AbsoluteSize.Y)
		Sliderbox.Text = tostring(DefaultValue).. con.Prefix
		con.Callback(DefaultValue)
	end)

	return sliderfunctions
end)

elements.options = (function(inst, con)
	con = con or {}
	con.Name = con.Name or "sadasd"
	con.Desc = con.Desc
	con.Multi = con.Multi or false
	con.MaximumSelected = con.MaximumSelected or nil
	con.EnableSearchbar = con.EnableSearchbar or false
	con.Default = con.Default or (con.Multi and {} or "")
	con.Callback = con.Callback or function(a) print(a) end
	con.OnMaximumCallback = con.OnMaximumCallback or function() end

	local optionframe = resources.optionframe(inst, con.EnableSearchbar)
	local optionsdata = {}
	local optionfunctions = {}

	if con.EnableSearchbar then
		optionframe.OptionsFrame:FindFirstChildOfClass("TextBox"):GetPropertyChangedSignal("Text"):Connect(function()
			local text = optionframe.OptionsFrame:FindFirstChildOfClass("TextBox").Text:lower()
			for i,v in optionframe.OptionsFrame:GetChildren() do
				if v:IsA("TextButton") then
					v.Visible = string.find(v.Text:lower(), text) ~= nil
				end
			end
		end)
	end

    optionfunctions.AddOption = (function(optionnname, callback)
        callback = callback or function() end
        local optionbutton = resources.optionbutton(optionframe.OptionsFrame)
        optionbutton.OptionsButton.Text = optionnname
        optionbutton.OptionsButton.MouseButton1Click:Connect(function()
            if not con.Multi then
                for i,v in optionframe.OptionsFrame:GetChildren() do
                    if v:IsA("TextButton") then
                        v.OptionsButtonStroke.Color = Color3.fromRGB(55, 61, 62)
                    end
                end
            end
            if table.find(optionsdata, optionbutton.OptionsButton.Text) then
                table.remove(optionsdata, table.find(optionsdata, optionbutton.OptionsButton.Text))
            else
                table.insert(optionsdata, optionbutton.OptionsButton.Text)
            end
            -- print(typeof(optionsdata))
            -- print("amount of options: ", #optionsdata)
			if con.MaximumSelected and con.Multi then
				if #optionsdata > con.MaximumSelected then
					con.OnMaximumCallback()
                	table.remove(optionsdata, table.find(optionsdata, optionbutton.OptionsButton.Text))
				end
			end
			for i,v in optionframe.OptionsFrame:GetChildren() do
                if v:IsA("TextButton") then
                    if table.find(optionsdata, v.Text) then
                        v.OptionsButtonStroke.Color = mainui.Color
                    else
                        v.OptionsButtonStroke.Color = Color3.fromRGB(55, 61, 62)
                    end
                end
            end
            callback(con.Multi and optionsdata or optionbutton.OptionsButton.Text)
            con.Callback(con.Multi and optionsdata or optionbutton.OptionsButton.Text)
        end)
		optionbutton.OptionsButton.Name = optionnname
		if con.Default == optionnname or (con.Multi and table.find(con.Default, optionnname)) then
			optionbutton.OptionsButtonStroke.Color = mainui.Color
			table.insert(optionsdata, optionnname)
			callback(con.Multi and optionsdata or optionbutton.OptionsButton.Text)
			con.Callback(con.Multi and optionsdata or optionbutton.OptionsButton.Text)
		end
    end)
    optionfunctions.AddOptions = (function(options, callback)
        for i,v in options do
            optionfunctions.AddOption(v, callback)
        end
    end)

	optionframe.OptionsMainText.Text = con.Name
	if con.Desc then
		optionframe.OptionsMainDesc.Text = con.Desc
	else
		optionframe.OptionsMainDesc.Visible = false
	end

	return optionfunctions, optionframe
end)

elements.buttons = (function(inst, con)
	con = con or {}
	con.Name = con.Name or "sadasd"
	con.Desc = con.Desc
	con.Callback = con.Callback or function() end

	local buttonsframe = resources.optionframe(inst)
	local buttonfunctions; buttonfunctions = {
		AddButton = (function(buttonname, callback, keybinddefault)
			local button = resources.optionbutton(buttonsframe.OptionsFrame)
			button.OptionsButton.Text = buttonname
			button.OptionsButton.MouseButton1Click:Connect(function()
				--button.OptionsButtonStroke.Color = mainui.Color
                resources.doripple(button.OptionsButton)
				task.spawn(function()
					con.Callback(buttonname)
				end)
				task.spawn(function()
					callback()
				end)
			end)
		end),
		AddButtons = (function(buttons)
			-- for i,v in buttons do
			-- 	buttonfunctions.AddButton(v)
			-- end
			for i,v in buttons do
				buttonfunctions.AddButton(v[1], v[2], v[3])
			end
		end),
	}

	buttonsframe.OptionsMainText.Text = con.Name
	if con.Desc then
		buttonsframe.OptionsMainDesc.Text = con.Desc
	else
		buttonsframe.OptionsMainDesc.Visible = false
	end

	return buttonfunctions
end)

elements.textbox = (function(inst, con)
	con = con or {}
	con.Name = con.Name or "sadasd"
	con.Desc = con.Desc
	con.NumbersOnly = con.NumbersOnly or false
	con.Default = con.Default or ""
	con.Callback = con.Callback or function(a) print(a) end

	local textbox = resources.textbox(inst)
	local textboxfunctions = {}

	textbox.TextboxMainText.Text = con.Name
	if con.Desc then
		textbox.TextboxMainDesc.Text = con.Desc
	else
		textbox.TextboxMainDesc.Visible = false
	end

	if con.NumbersOnly then
		textbox.TextboxFrameBox:GetPropertyChangedSignal("Text"):Connect(function(input)
            local text = textbox.TextboxFrameBox.Text
            if text ~= "" and not tonumber(text) then
                textbox.TextboxFrameBox.Text = text:sub(1, #text - 1)
            end
		end)
	end

	if con.Default ~= "" then
		textbox.TextboxFrameBox.Text = con.Default
		task.spawn(function()
			con.Callback(con.Default)
		end)
	end

	textbox.TextboxFrameBox.FocusLost:Connect(function(enter)
		if enter then
			local text = textbox.TextboxFrameBox.Text
			task.spawn(function()
				con.Callback(text)
			end)
		end
	end)

	textboxfunctions.GetValue = (function()
		return textbox.TextboxFrameBox.Text
	end)

	return textboxfunctions
end)

elements.dropdown = (function(inst, con)
	con = con or {}
	con.Name = con.Name or "Dropdown"
	con.Desc = con.Desc
	con.Options = con.Options or {}
	con.Multi = con.Multi or false
	con.EnableSearchbar = con.EnableSearchbar or false
	con.Default = con.Default or (con.Multi and {} or nil)
	con.Callback = con.Callback or function(a) end
	con.Flags = con.Flags or con.Name:gsub(" ", "")

	local dropdown = resources.dropdown(inst, con.EnableSearchbar, con.Multi)
	local dropdownfunctions = {}
	local isDropped = false
	local selected = con.Default

	dropdown.DropdownMainText.Text = con.Name
	if con.Desc then
		dropdown.DropdownMainDesc.Text = con.Desc
	else
		dropdown.DropdownMainDesc.Visible = false
	end

	local function GetButtonText()
		if con.Multi then
			if #selected == 0 then
				return "Select Options..."
			elseif #selected == 1 then
				return tostring(selected[1])
			else
				return table.concat(selected, ", ")
			end
		else
			return selected and tostring(selected) or "Select Option..."
		end
	end

	local function UpdateList(searchText)
		searchText = searchText and string.lower(searchText) or ""
		local listY = 0
		
		for _, v in ipairs(dropdown.DropdownList:GetChildren()) do
			if v:IsA("TextButton") then
				v:Destroy()
			end
		end

		local visibleItems = 0
		for _, option in ipairs(con.Options) do
			if searchText == "" or string.find(string.lower(tostring(option)), searchText) then
				visibleItems = visibleItems + 1
				local optBtn = resources.dropdownoption(dropdown.DropdownList)
				optBtn.OptionButton.Text = tostring(option)
				
				local isSelected = false
				if con.Multi then
					isSelected = table.find(selected, option) ~= nil
				else
					isSelected = (selected == option)
				end

				if isSelected then
					optBtn.OptionButton.TextColor3 = Color3.fromRGB(255, 255, 255)
					optBtn.OptionButton.BackgroundColor3 = Color3.fromRGB(55, 61, 62)
					optBtn.OptionButton.BackgroundTransparency = 0.5
				else
					optBtn.OptionButton.TextColor3 = Color3.fromRGB(170, 170, 170)
					optBtn.OptionButton.BackgroundTransparency = 1.0
				end

				optBtn.OptionButton.MouseEnter:Connect(function()
					if not isSelected then
						game.TweenService:Create(optBtn.OptionButton, TweenInfo.new(0.2), {BackgroundTransparency = 0.9}):Play()
					end
				end)
				optBtn.OptionButton.MouseLeave:Connect(function()
					if not isSelected then
						game.TweenService:Create(optBtn.OptionButton, TweenInfo.new(0.2), {BackgroundTransparency = 1.0}):Play()
					end
				end)

				optBtn.OptionButton.MouseButton1Click:Connect(function()
					if con.Multi then
						if isSelected then
							local idx = table.find(selected, option)
							if idx then table.remove(selected, idx) end
						else
							table.insert(selected, option)
						end
						dropdownfunctions.Set(selected)
						UpdateList(dropdown.DropdownSearch and dropdown.DropdownSearch.Text or "") 
					else
						dropdownfunctions.Set(option)
						dropdownfunctions.Toggle() 
					end
				end)
				listY = listY + 16 + 2 
			end
		end
		
		listY = listY + 4
		if visibleItems == 0 then listY = 0 end
		dropdown.DropdownList.CanvasSize = UDim2.new(0, 0, 0, listY)
		
		if isDropped then
			local maxItems = math.min(visibleItems, 6)
			local targetListHeight = (maxItems * 18) + 4
			if visibleItems == 0 then targetListHeight = 0 end
			
			-- FIXED: Dynamically calculate box height based on wrapped text!
			local buttonHeight = math.max(20, dropdown.DropdownButton.AbsoluteSize.Y)
			local searchHeight = con.EnableSearchbar and 20 or 0
			local actionHeight = con.Multi and 20 or 0
			local targetBoxHeight = buttonHeight + searchHeight + actionHeight + targetListHeight
			
			game.TweenService:Create(dropdown.DropdownBox, TweenInfo.new(0.2, Enum.EasingStyle.Quart), {Size = UDim2.new(1, -8, 0, targetBoxHeight)}):Play()
			game.TweenService:Create(dropdown.DropdownList, TweenInfo.new(0.2, Enum.EasingStyle.Quart), {Size = UDim2.new(1, 0, 0, targetListHeight)}):Play()
		end
	end

	if con.Multi and dropdown.DropdownSelectAll and dropdown.DropdownDeselectAll then
		dropdown.DropdownSelectAll.MouseButton1Click:Connect(function()
			local newSelected = {}
			for _, opt in ipairs(con.Options) do
				table.insert(newSelected, opt)
			end
			dropdownfunctions.Set(newSelected)
		end)

		dropdown.DropdownDeselectAll.MouseButton1Click:Connect(function()
			dropdownfunctions.Set({})
		end)

		dropdown.DropdownSelectAll.MouseEnter:Connect(function()
			game.TweenService:Create(dropdown.DropdownSelectAll, TweenInfo.new(0.2), {TextColor3 = Color3.fromRGB(255, 255, 255)}):Play()
		end)
		dropdown.DropdownSelectAll.MouseLeave:Connect(function()
			game.TweenService:Create(dropdown.DropdownSelectAll, TweenInfo.new(0.2), {TextColor3 = Color3.fromRGB(170, 170, 170)}):Play()
		end)

		dropdown.DropdownDeselectAll.MouseEnter:Connect(function()
			game.TweenService:Create(dropdown.DropdownDeselectAll, TweenInfo.new(0.2), {TextColor3 = Color3.fromRGB(255, 255, 255)}):Play()
		end)
		dropdown.DropdownDeselectAll.MouseLeave:Connect(function()
			game.TweenService:Create(dropdown.DropdownDeselectAll, TweenInfo.new(0.2), {TextColor3 = Color3.fromRGB(170, 170, 170)}):Play()
		end)
	end

	if con.EnableSearchbar and dropdown.DropdownSearch then
		dropdown.DropdownSearch:GetPropertyChangedSignal("Text"):Connect(function()
			if isDropped then
				UpdateList(dropdown.DropdownSearch.Text)
			end
		end)
	end

	-- NEW: Listen for when the text wraps and instantly animate the box to fit it
	dropdown.DropdownButton:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
		if isDropped then
			UpdateList(dropdown.DropdownSearch and dropdown.DropdownSearch.Text or "")
		else
			local buttonHeight = math.max(20, dropdown.DropdownButton.AbsoluteSize.Y)
			game.TweenService:Create(dropdown.DropdownBox, TweenInfo.new(0.2, Enum.EasingStyle.Quart), {Size = UDim2.new(1, -8, 0, buttonHeight)}):Play()
		end
	end)

	dropdownfunctions.Toggle = (function()
		isDropped = not isDropped
		if isDropped then
			if con.EnableSearchbar and dropdown.DropdownSearch then
				dropdown.DropdownSearch.Text = ""
			end
			UpdateList()
			
			local buttonHeight = math.max(20, dropdown.DropdownButton.AbsoluteSize.Y)
			local maxItems = math.min(#con.Options, 6)
			local targetListHeight = (maxItems * 18) + 4
			if #con.Options == 0 then targetListHeight = 0 end
			
			local searchHeight = con.EnableSearchbar and 20 or 0
			local actionHeight = con.Multi and 20 or 0
			local targetBoxHeight = buttonHeight + searchHeight + actionHeight + targetListHeight
			
			game.TweenService:Create(dropdown.DropdownBox, TweenInfo.new(0.2, Enum.EasingStyle.Quart), {Size = UDim2.new(1, -8, 0, targetBoxHeight)}):Play()
			game.TweenService:Create(dropdown.DropdownList, TweenInfo.new(0.2, Enum.EasingStyle.Quart), {Size = UDim2.new(1, 0, 0, targetListHeight)}):Play()
			game.TweenService:Create(dropdown.DropdownButtonIcon, TweenInfo.new(0.2, Enum.EasingStyle.Quart), {Rotation = 180}):Play()
		else
			local buttonHeight = math.max(20, dropdown.DropdownButton.AbsoluteSize.Y)
			game.TweenService:Create(dropdown.DropdownBox, TweenInfo.new(0.2, Enum.EasingStyle.Quart), {Size = UDim2.new(1, -8, 0, buttonHeight)}):Play()
			game.TweenService:Create(dropdown.DropdownList, TweenInfo.new(0.2, Enum.EasingStyle.Quart), {Size = UDim2.new(1, 0, 0, 0)}):Play()
			game.TweenService:Create(dropdown.DropdownButtonIcon, TweenInfo.new(0.2, Enum.EasingStyle.Quart), {Rotation = 0}):Play()
		end
	end)

	dropdownfunctions.Set = (function(option)
		selected = option
		dropdown.DropdownButton.Text = GetButtonText()
		con.Callback(option)
		if isDropped then
			UpdateList(dropdown.DropdownSearch and dropdown.DropdownSearch.Text or "") 
		end
	end)
	
	dropdownfunctions.Refresh = (function(newOptions)
		con.Options = newOptions
		if con.Multi then
			local newSelected = {}
			for _, v in ipairs(selected) do
				if table.find(con.Options, v) then
					table.insert(newSelected, v)
				end
			end
			dropdownfunctions.Set(newSelected)
		else
			if not table.find(con.Options, selected) then
				dropdownfunctions.Set(con.Options[1] or nil)
			else
				dropdownfunctions.Set(selected)
			end
		end
	end)

	dropdown.DropdownButton.MouseButton1Click:Connect(function()
		dropdownfunctions.Toggle()
	end)

	dropdownfunctions.Set(con.Default)

	return dropdownfunctions
end)

elements.paragraph = (function(inst, name, desc)
	con =  {}
	con.Name = name or "paragraph"
	con.Desc = desc or "A paragraph is a self-contained unit of discourse in writing dealing with a particular point or idea. A paragraph consists of one or more sentences. Though not required by the syntax of any language, paragraphs are usually an expected part of formal writing, used to organize longer prose."

	local paragraph = resources.textbox(inst)
	local paragraphfunctions = {}


	paragraph.TextboxFrame.Visible = false
	paragraph.TextboxMainPadding.PaddingBottom = UDim.new(0, 8)

	paragraph.TextboxMainText.Text = con.Name
	if con.Desc then
		paragraph.TextboxMainDesc.Text = con.Desc
	else
		paragraph.TextboxMainDesc.Visible = false
	end

	paragraphfunctions.SetTitle = (function(text)
		paragraph.TextboxMainText.Text = text
	end)

	paragraphfunctions.SetDesc = (function(text)
		paragraph.TextboxMainDesc.Text = text
	end)

	return paragraphfunctions
end)

elements.section = (function(inst, name, desc)
	local section = resources.section(inst)
	local sectionfunctions = {}

	section.SectionTopbarFrameTitle.Text = name
	if desc then
		section.SectionTopbarFrameDesc.Text = desc
	else
		section.SectionTopbarFrameDesc.Visible = false
	end

	task.delay(2, function()
		game:GetService("RunService").RenderStepped:Connect(function()
			section.Section.Size = UDim2.new(1, 0, 0, section.SectionLayout.AbsoluteContentSize.Y + 5)
		end)
	end)
	
	for i,v in elements do
		name = i:sub(1,1):upper().. i:sub(2)
		sectionfunctions["Add".. name] = (function(...)
			return elements[i](section.Section, ...)
		end)
	end

	return sectionfunctions
end)

mainui.StartUi = (function(con)
	con = con or {}
	con.Title = con.Title or "Codecoat"
	con.SubTitle = con.SubTitle or "Ui Library"
	con.Image = con.Image or ""
	con.Size = con.Size or UDim2.new(0, 465, 0, 300)

	local ScreenGui = Instance.new("ScreenGui")
	local Main = Instance.new("ImageLabel")
	local Window = Instance.new("CanvasGroup")
	local WindowCorner = Instance.new("UICorner")
	local Topbar = Instance.new("Frame")
	local TopbarCorner = Instance.new("UICorner")
	local TopbarTitle = Instance.new("TextLabel")
	local TopbarDesc = Instance.new("TextLabel")
	local TopbarCornerHider = Instance.new("Frame")
	local TopbarImage = Instance.new("ImageLabel")
	local TopbarImageCorner = Instance.new("UICorner")
	local TopbarImageMaximize = Instance.new("ImageButton")
	local TopbarImageMinimize = Instance.new("ImageButton")
	local SIdebar = Instance.new("ScrollingFrame")
	local SidebarLayout = Instance.new("UIListLayout")
	local BottomBar = Instance.new("ScrollingFrame")
	local BottomBarLayout = Instance.new("UIListLayout")
	local BottomBarPadding = Instance.new("UIPadding")
	local WindowSeperator = Instance.new("Frame")
	local Container = Instance.new("CanvasGroup")

	ScreenGui.Parent = game.CoreGui --game.Players.LocalPlayer:WaitForChild("PlayerGui")
	ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

	Main.Name = "Main"
	Main.Parent = ScreenGui
	Main.AnchorPoint = Vector2.new(0, 0)
	Main.BackgroundTransparency = 1.000
	Main.Position = UDim2.new(0, 50, 0, 50)
	Main.Size = UDim2.new(0, 0, 0, 0)
	Main.ZIndex = -1
	Main.Image = "rbxassetid://1316045217"
	Main.ImageColor3 = Color3.fromRGB(255, 255, 0)
	Main.ImageTransparency = 0.600
	Main.ScaleType = Enum.ScaleType.Slice
	Main.SliceCenter = Rect.new(10, 10, 118, 118)
	Main.ClipsDescendants = true

	Window.Name = "Window"
	Window.Parent = Main
	Window.AnchorPoint = Vector2.new(0.5, 0.5)
	Window.BackgroundColor3 = Color3.fromRGB(21, 22, 23)
	Window.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Window.BorderSizePixel = 0
	Window.Position = UDim2.new(0.5, 0, 0.5, 0)
	Window.Size = UDim2.new(1, -15, 1, -15)

	WindowCorner.CornerRadius = UDim.new(0, 5)
	WindowCorner.Name = "WindowCorner"
	WindowCorner.Parent = Window

	Topbar.Name = "Topbar"
	Topbar.Parent = Window
	Topbar.BackgroundColor3 = Color3.fromRGB(28, 30, 31)
	Topbar.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Topbar.BorderSizePixel = 0
	Topbar.Size = UDim2.new(1, 0, 0, 40)
	Topbar.Position = UDim2.new(0,0,0,-50)
    resources.DraggingEnabled(Topbar, Main)

	TopbarCorner.CornerRadius = UDim.new(0, 3)
	TopbarCorner.Name = "TopbarCorner"
	TopbarCorner.Parent = Topbar

	TopbarTitle.Name = "TopbarTitle"
	TopbarTitle.Parent = Topbar
	TopbarTitle.AnchorPoint = Vector2.new(0, 0.5)
	TopbarTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TopbarTitle.BackgroundTransparency = 1.000
	TopbarTitle.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TopbarTitle.BorderSizePixel = 0
	TopbarTitle.Position = UDim2.new(0, 45, 0.5, 0)
	TopbarTitle.Size = UDim2.new(1, -100, 1, -15)
	TopbarTitle.Font = Enum.Font.BuilderSansBold
	TopbarTitle.Text = con.Title
	TopbarTitle.TextColor3 = Color3.fromRGB(212, 212, 212)
	TopbarTitle.TextSize = 14.000
	TopbarTitle.TextXAlignment = Enum.TextXAlignment.Left
	TopbarTitle.TextYAlignment = Enum.TextYAlignment.Top

	TopbarDesc.Name = "TopbarDesc"
	TopbarDesc.Parent = Topbar
	TopbarDesc.AnchorPoint = Vector2.new(0, 0.5)
	TopbarDesc.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TopbarDesc.BackgroundTransparency = 1.000
	TopbarDesc.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TopbarDesc.BorderSizePixel = 0
	TopbarDesc.Position = UDim2.new(0, 45, 0.5, 0)
	TopbarDesc.Size = UDim2.new(1, -100, 1, -15)
	TopbarDesc.Font = Enum.Font.BuilderSansBold
	TopbarDesc.Text = con.SubTitle
	TopbarDesc.TextColor3 = Color3.fromRGB(122, 122, 122)
	TopbarDesc.TextSize = 12.000
	TopbarDesc.TextXAlignment = Enum.TextXAlignment.Left
	TopbarDesc.TextYAlignment = Enum.TextYAlignment.Bottom

	TopbarCornerHider.Name = "TopbarCornerHider"
	TopbarCornerHider.Parent = Topbar
	TopbarCornerHider.AnchorPoint = Vector2.new(0, 1)
	TopbarCornerHider.BackgroundColor3 = Color3.fromRGB(40, 44, 45)
	TopbarCornerHider.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TopbarCornerHider.BorderSizePixel = 0
	TopbarCornerHider.Position = UDim2.new(0, 0, 1, 0)
	TopbarCornerHider.Size = UDim2.new(1, 0, 0, 0)

	TopbarImage.Name = "TopbarImage"
	TopbarImage.Parent = Topbar
	TopbarImage.AnchorPoint = Vector2.new(0, 0.5)
	TopbarImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TopbarImage.BackgroundTransparency = 1.000
	TopbarImage.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TopbarImage.BorderSizePixel = 0
	TopbarImage.Position = UDim2.new(0, 10, 0.5, 0)
	TopbarImage.Size = UDim2.new(0, 25, 0, 25)
	TopbarImage.Image = "rbxassetid://104122443801564"

	TopbarImageCorner.CornerRadius = UDim.new(0, 3)
	TopbarImageCorner.Name = "TopbarImageCorner"
	TopbarImageCorner.Parent = TopbarImage

	TopbarImageMaximize.Name = "TopbarImageMaximize"
	TopbarImageMaximize.Parent = TopbarImage
	TopbarImageMaximize.AnchorPoint = Vector2.new(0.5, 0.5)
	TopbarImageMaximize.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TopbarImageMaximize.BackgroundTransparency = 1.000
	TopbarImageMaximize.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TopbarImageMaximize.BorderSizePixel = 0
	TopbarImageMaximize.Position = UDim2.new(0.5, 0, 0.5, 0)
	TopbarImageMaximize.Size = UDim2.new(1, -5, 1, -5)
	TopbarImageMaximize.AutoButtonColor = false
	TopbarImageMaximize.Image = "rbxassetid://10734886735"
	TopbarImageMaximize.ImageTransparency = 1

	TopbarImageMinimize.Name = "TopbarImageMinimize"
	TopbarImageMinimize.Parent = Topbar
	TopbarImageMinimize.AnchorPoint = Vector2.new(1, 0.5)
	TopbarImageMinimize.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TopbarImageMinimize.BackgroundTransparency = 1.000
	TopbarImageMinimize.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TopbarImageMinimize.BorderSizePixel = 0
	TopbarImageMinimize.Position = UDim2.new(1, -10, 0.5, 0)
	TopbarImageMinimize.Size = UDim2.new(0, 20, 0, 20)
	TopbarImageMinimize.AutoButtonColor = false
	TopbarImageMinimize.Image = "rbxassetid://10734895530"
	TopbarImageMinimize.ImageColor3 = Color3.fromRGB(200, 200, 200)
	TopbarImageMinimize.ImageTransparency = 1

	SIdebar.Name = "SIdebar"
	SIdebar.Parent = Window
	SIdebar.Active = true
	SIdebar.BackgroundColor3 = Color3.fromRGB(28, 30, 31)
	SIdebar.BorderColor3 = Color3.fromRGB(0, 0, 0)
	SIdebar.BorderSizePixel = 0
	SIdebar.Position = UDim2.new(0, -122, 0, 40)
	SIdebar.Size = UDim2.new(0, 115, 1, -40) --UDim2.new(0, 115, 1, -80)
	SIdebar.ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0)
	SIdebar.ScrollBarThickness = 0
	SIdebar.ZIndex = 2
	SIdebar.CanvasSize = UDim2.new(0, 0, 0, 0)

	SidebarLayout.Name = "SidebarLayout"
	SidebarLayout.Parent = SIdebar
	SidebarLayout.SortOrder = Enum.SortOrder.LayoutOrder

	BottomBar.Name = "BottomBar"
	BottomBar.Parent = Window
	BottomBar.Active = true
	BottomBar.AnchorPoint = Vector2.new(0, 1)
	BottomBar.BackgroundColor3 = Color3.fromRGB(28, 30, 31)
	BottomBar.BorderColor3 = Color3.fromRGB(0, 0, 0)
	BottomBar.BorderSizePixel = 0
	BottomBar.Position = UDim2.new(0, 0, 1, 0)
	BottomBar.Size = UDim2.new(0, 115, 0, 35)
	BottomBar.ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0)
	BottomBar.CanvasSize = UDim2.new(2, 0, 0, 0)
	BottomBar.ScrollBarThickness = 0
	BottomBar.Visible = false

	BottomBarLayout.Name = "BottomBarLayout"
	BottomBarLayout.Parent = BottomBar
	BottomBarLayout.FillDirection = Enum.FillDirection.Horizontal
	BottomBarLayout.SortOrder = Enum.SortOrder.LayoutOrder
	BottomBarLayout.VerticalAlignment = Enum.VerticalAlignment.Center
	BottomBarLayout.Padding = UDim.new(0, 5)

	BottomBarPadding.Name = "BottomBarPadding"
	BottomBarPadding.Parent = BottomBar
	BottomBarPadding.PaddingLeft = UDim.new(0, 8)

	WindowSeperator.Name = "WindowSeperator"
	WindowSeperator.Parent = Window
	WindowSeperator.AnchorPoint = Vector2.new(0, 1)
	WindowSeperator.BackgroundColor3 = Color3.fromRGB(40, 44, 45)
	WindowSeperator.BorderColor3 = Color3.fromRGB(0, 0, 0)
	WindowSeperator.BorderSizePixel = 0
	WindowSeperator.Position = UDim2.new(0, 0, 1, -35)
	WindowSeperator.Size = UDim2.new(0, 115, 0, 5)
	WindowSeperator.Visible = false

	Container.Name = "Container"
	Container.Parent = Window
	Container.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Container.BackgroundTransparency = 1.000
	Container.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Container.BorderSizePixel = 0
	Container.Position = UDim2.new(0, 120, 0, -45)
	Container.Size = UDim2.new(1, -125, 1, -50)

	local toggleui = (function(a)
		if a then
			ts:Create(Main, TweenInfo.new(1, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {
				Size = con.Size
			}):Play()
			ts:Create(TopbarImageMinimize, TweenInfo.new(1, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {
				ImageTransparency = 0
			}):Play()
			ts:Create(TopbarImage, TweenInfo.new(1, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {
				ImageTransparency = 0
			}):Play()
			ts:Create(TopbarImageMaximize, TweenInfo.new(1, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {
				ImageTransparency = 1
			}):Play()
            ts:Create(TopbarCornerHider, TweenInfo.new(1, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {
                Size = UDim2.new(1, 0, 0, 3)
            }):Play()

			task.delay(1 + 0.55, function()
				-- ts:Create(Container, TweenInfo.new(1, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {
				--     Position = UDim2.new(0, 120, 0, 45)
				-- }):Play()
				for i,v in Container:GetChildren() do
					ts:Create(v, TweenInfo.new(1, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {
						Size = UDim2.new(1, 0, 1, 0)
					}):Play()
				end
			end)

			task.delay(1 + 0.35, function()
				ts:Create(SIdebar, TweenInfo.new(1, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {
					Position = UDim2.new(0, 0, 0, 40)
				}):Play()
			end)

			task.delay(1 + 0.45, function()
				ts:Create(Topbar, TweenInfo.new(1, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {
					Position = UDim2.new(0, 0, 0, 0)
				}):Play()
				-- ts:Create(TopbarImageMinimize, TweenInfo.new(1, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {
				--     ImageTransparency = 0
				-- }):Play()
				-- ts:Create(TopbarImage, TweenInfo.new(1, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {
				--     ImageTransparency = 0
				-- }):Play()
				-- ts:Create(TopbarImageMaximize, TweenInfo.new(1, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {
				--     ImageTransparency = 1
				-- }):Play()
				ts:Create(TopbarCornerHider, TweenInfo.new(1, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {
					Size = UDim2.new(1, 0, 0, 3)
				}):Play()
			end)
		else
			local xsize
			if TopbarDesc.TextBounds.X > TopbarTitle.TextBounds.X then
				xsize = TopbarDesc.TextBounds.X + 55 + 25
			else
				xsize = TopbarTitle.TextBounds.X + 55 + 25
			end
			ts:Create(Main, TweenInfo.new(1, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {
				Size = UDim2.new(0, xsize, 0, 55)
			}):Play()
			ts:Create(TopbarImageMinimize, TweenInfo.new(1, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {
				ImageTransparency = 1
			}):Play()
			ts:Create(TopbarImage, TweenInfo.new(1, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {
				ImageTransparency = 1
			}):Play()
			ts:Create(TopbarImageMaximize, TweenInfo.new(1, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {
				ImageTransparency = 0
			}):Play()
            ts:Create(TopbarCornerHider, TweenInfo.new(1, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {
                Size = UDim2.new(1, 0, 0, 0)
            }):Play()

			--task.delay(1.1 + 0.55, function()
			--	-- ts:Create(Container, TweenInfo.new(1, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {
			--	--     Position = UDim2.new(0, 120, 0, 45)
			--	-- }):Play()
			--	for i,v in Container:GetChildren() do
			--		ts:Create(v, TweenInfo.new(1, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {
			--			Size = UDim2.new(1, 0, 0, 0)
			--		}):Play()
			--	end
			--end)

			--task.delay(1.1 + 0.35, function()
			--	ts:Create(SIdebar, TweenInfo.new(1, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {
			--		Position = UDim2.new(0, 115, 1, -40)
			--	}):Play()
			--end)

			--task.delay(1.1 + 0.45, function()
			--	ts:Create(Topbar, TweenInfo.new(1, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {
			--		Position = UDim2.new(0, 0, 0, 0)
			--	}):Play()
			--	-- ts:Create(TopbarImageMinimize, TweenInfo.new(1, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {
			--	--     ImageTransparency = 1
			--	-- }):Play()
			--	-- ts:Create(TopbarImage, TweenInfo.new(1, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {
			--	--     ImageTransparency = 1
			--	-- }):Play()
			--	-- ts:Create(TopbarImageMaximize, TweenInfo.new(1, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {
			--	--     ImageTransparency = 0
			--	-- }):Play()
			--	ts:Create(TopbarCornerHider, TweenInfo.new(1, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {
			--		Size = UDim2.new(1, 0, 0, 3)
			--	}):Play()
			--end)

		end
	end)

	TopbarImageMinimize.MouseButton1Click:Connect(function()
		toggleui(false)
	end)

	TopbarImageMaximize.MouseButton1Click:Connect(function()
		toggleui(true)
	end)

	local pagefunction = {}
	local hadopenfirstpage = false

	pagefunction.AddPage = (function(name, icon)
		local sectionfunctions = {}

		local Main_2 = Instance.new("TextButton")
		local PageButtonLayout = Instance.new("UIListLayout")
		local PageButtonPadding = Instance.new("UIPadding")
		local PageButtonLabel = Instance.new("ImageLabel")
		local PageButtonText = Instance.new("TextLabel")
		local PageButtonIndicator = Instance.new("Frame")
		local PageButtonGradient = Instance.new("UIGradient")
		local Main_3 = Instance.new("ScrollingFrame")
		local PageLayout = Instance.new("UIListLayout")
		local PagePadding = Instance.new("UIPadding")

		Main_2.Name = "Main"
		Main_2.Parent = SIdebar
		Main_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Main_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Main_2.BorderSizePixel = 0
		Main_2.Size = UDim2.new(1, 0, 0, 25)
		Main_2.AutoButtonColor = false
		Main_2.Font = Enum.Font.SourceSans
		Main_2.Text = ""
		Main_2.TextColor3 = Color3.fromRGB(0, 0, 0)
		Main_2.TextSize = 14.000
        Main_2.BackgroundTransparency = 1

		PageButtonLayout.Name = "PageButtonLayout"
		PageButtonLayout.Parent = Main_2
		PageButtonLayout.FillDirection = Enum.FillDirection.Horizontal
		PageButtonLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right
		PageButtonLayout.SortOrder = Enum.SortOrder.LayoutOrder
		PageButtonLayout.VerticalAlignment = Enum.VerticalAlignment.Center
		PageButtonLayout.Padding = UDim.new(0, 3)

		PageButtonPadding.Name = "PageButtonPadding"
		PageButtonPadding.Parent = Main_2
		PageButtonPadding.PaddingLeft = UDim.new(0, 7)

		PageButtonLabel.Name = "PageButtonLabel"
		PageButtonLabel.Parent = Main_2
		PageButtonLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		PageButtonLabel.BackgroundTransparency = 1.000
		PageButtonLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
		PageButtonLabel.BorderSizePixel = 0
		PageButtonLabel.Size = UDim2.new(0, 17, 0, 17)
		PageButtonLabel.Image = icon or "" --"rbxassetid://10734950309"

		PageButtonText.Name = "PageButtonText"
		PageButtonText.Parent = Main_2
		PageButtonText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		PageButtonText.BackgroundTransparency = 1.000
		PageButtonText.BorderColor3 = Color3.fromRGB(0, 0, 0)
		PageButtonText.BorderSizePixel = 0
		PageButtonText.Size = UDim2.new(1, -27, 1, 0)
		PageButtonText.Font = Enum.Font.BuilderSansBold
		PageButtonText.Text = name
		PageButtonText.TextColor3 = Color3.fromRGB(255, 255, 255)
		PageButtonText.TextSize = 12.000
		PageButtonText.TextXAlignment = Enum.TextXAlignment.Left

		PageButtonIndicator.Name = "PageButtonIndicator"
		PageButtonIndicator.Parent = Main_2
		PageButtonIndicator.BackgroundColor3 = Color3.fromRGB(255, 255, 0)
		PageButtonIndicator.BorderColor3 = Color3.fromRGB(0, 0, 0)
		PageButtonIndicator.BorderSizePixel = 0
		PageButtonIndicator.Size = UDim2.new(0, 0, 1, 0)

		PageButtonGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(131, 131, 131)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 255, 0))}
		PageButtonGradient.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0.00, 1.00), NumberSequenceKeypoint.new(1.00, 0.63)}
		PageButtonGradient.Name = "PageButtonGradient"
		PageButtonGradient.Parent = Main_2

		Main_3.Name = "Main"
		Main_3.Parent = Container
		Main_3.Active = true
		Main_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Main_3.BackgroundTransparency = 1.000
		Main_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Main_3.BorderSizePixel = 0
		Main_3.Size = UDim2.new(1, 0, 0, 0)
		Main_3.ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0)
		Main_3.ScrollBarThickness = 0
		Main_3.Visible = false
		
		PageLayout.Name = "PageLayout"
		PageLayout.Parent = Main_3
		PageLayout.SortOrder = Enum.SortOrder.LayoutOrder
		PageLayout.Padding = UDim.new(0, 5)

		PagePadding.Name = "PagePadding"
		PagePadding.Parent = Main_3
		PagePadding.PaddingLeft = UDim.new(0, 1)
		PagePadding.PaddingRight = UDim.new(0, 1)
		PagePadding.PaddingTop = UDim.new(0, 1)

		task.delay(2, function()
			game:GetService("RunService").RenderStepped:Connect(function()
				Main_3.CanvasSize = UDim2.new(0,0,0,PageLayout.AbsoluteContentSize.Y + 2)
			end)
		end)

		if not icon then
			PageButtonLabel.Visible = false
			PageButtonText.Size = UDim2.new(1, -14, 1, 0)
		end

		if hadopenfirstpage == false then
			hadopenfirstpage = true
			Container.GroupTransparency = 1
			Container.Position = UDim2.new(0, 120, 0, 65)
			ts:Create(Container, TweenInfo.new(0.15), {GroupTransparency = 0, Position = UDim2.new(0, 120, 0, 45)}):Play()
			for i,v in next, SIdebar:GetChildren() do
				if v:IsA("TextButton") then
					ts:Create(v.PageButtonIndicator, TweenInfo.new(0.15), {Size = UDim2.new(0, 0, 1, 0)}):Play()
					ts:Create(v, TweenInfo.new(0.15), {BackgroundTransparency = 1}):Play()
				end
			end
			ts:Create(PageButtonIndicator, TweenInfo.new(0.15), {Size = UDim2.new(0, 4, 1, 0)}):Play()
			ts:Create(Main_2, TweenInfo.new(0.15), {BackgroundTransparency = 0}):Play()
			for i,v in next, Container:GetChildren() do
				if v:IsA("ScrollingFrame") then
					v.Visible = false
				end
			end
			Main_3.Visible = true
		end

		Main_2.MouseButton1Click:Connect(function()
			Container.GroupTransparency = 1
			Container.Position = UDim2.new(0, 120, 0, 65)
			ts:Create(Container, TweenInfo.new(0.15), {GroupTransparency = 0, Position = UDim2.new(0, 120, 0, 45)}):Play()
			for i,v in next, SIdebar:GetChildren() do
				if v:IsA("TextButton") then
					ts:Create(v.PageButtonIndicator, TweenInfo.new(0.15), {Size = UDim2.new(0, 0, 1, 0)}):Play()
					ts:Create(v, TweenInfo.new(0.15), {BackgroundTransparency = 1}):Play()
				end
			end
			ts:Create(PageButtonIndicator, TweenInfo.new(0.15), {Size = UDim2.new(0, 4, 1, 0)}):Play()
			ts:Create(Main_2, TweenInfo.new(0.15), {BackgroundTransparency = 0}):Play()
			for i,v in next, Container:GetChildren() do
				if v:IsA("ScrollingFrame") then
					v.Visible = false
				end
			end
			Main_3.Visible = true
		end)

		for i,v in elements do
			name = i:sub(1,1):upper().. i:sub(2)
			sectionfunctions["Add".. name] = (function(...)
				return elements[i](Main_3, ...)
			end)
		end

		return sectionfunctions
	end)

	toggleui(true)

	return pagefunction
end)

local client = {
    coroutinemaker = loadstring(game:HttpGet("https://pastefy.app/CYXJWbVO/raw"))();
    notification = loadstring(game:HttpGet("https://pastefy.app/GK511jPO/raw"))();
    pl = game:GetService("Players");
    rs = game:GetService("ReplicatedStorage");
    loop = {};
	ori = {};
	md = {
		quests = getsenv(game:GetService("Players").LocalPlayer.PlayerScripts.Scripts.GUIs.Quests);
		playerserving = getsenv(game:GetService("Players").LocalPlayer.PlayerScripts.Scripts["Player Management"]["Player Serving"]);
		playerstoves = getsenv(game:GetService("Players").LocalPlayer.PlayerScripts.Scripts["Player Management"]["Player Stoves"]);
		playerdishwasher = getsenv(game:GetService("Players").LocalPlayer.PlayerScripts.Scripts["Player Management"]["Player Dishwasher"]);
		influenceroffer = getsenv(game:GetService("Players").LocalPlayer.PlayerScripts.Scripts.GUIs["Influencer Offer"]);
	};
	debugmode = false;
	bettertablefind = (function(tbl, n)
		for i,v in next, tbl do
			if tostring(v) == tostring(n) then
				return i
			end
		end
		return nil
	end);
	-- numbercommas = (function(n)
	-- 	GUF_NO_VIRTUALIZE(function()
	-- 		local formatted = n
	-- 		while true do
	-- 			formatted, k = string.gsub(formatted, "^(-?%d+)(%d%d%d)", "%1,%2")
	-- 			if k == 0 then 
	-- 				break
	-- 			end
	-- 		end
	-- 		return formatted
	-- 	end)()
	-- end);
    itemslocklist = {};
}
local configs = {
    autoactions = false;
    servingactions = {};
}

-- yes this indeed from amity tutorial video because i am absolutely lack of motivation to create my own
local FolderName = "CodecoatRAR"
local FileName = FolderName.."\\RARconfigs.json"

local http = game:GetService("HttpService")
local function jsone(str) 
	return http:JSONEncode(str) 
end
local function jsond(str) 
	return http:JSONDecode(str) 
end

local cachedconfigs = isfolder(FolderName) and isfile(FileName) and jsond(readfile(FileName))
if cachedconfigs then
    for i,v in next, configs do
        if cachedconfigs[i] == nil then
            warn("Missing: ",i," Now being set to: ",v)
            cachedconfigs[i] = v
        end
    end
    configs = cachedconfigs
    writefile(FileName,jsone(configs))
end
if not isfolder(FolderName) then
    warn(FolderName," not found")
    makefolder(FolderName)
end
if not isfile(FileName) then
    warn(FileName," not found")
    writefile(FileName,jsone(configs))
end

local hm = GUF_NO_VIRTUALIZE(function()
	for i,v in client.rs.Framework:GetDescendants() do
		if (function(tbl, str)
			for i,v in tbl do
				if str:find(v) then
					return true
				end
			end
			return false
		end)({"ClientRestaurant", "ClientCustomer", "ClientFridge", "ClientFishing", "CurrencyCmds", "QuestCmds", "StaffLevelingCmds", "MilestoneCmds", "BlackMarketCmds", "BlackMarketTypes", "ProximityPrompt", "TabController", "EntityUtil", "MilestonesUtil", "Universal.Shop", "Client.Saving", "ShopCmds", "PingEntity", "Network", "Directory.Recipe", "RecipeUtil", "Functions", "Directory.Currency", "BonusPopup"}, v:GetFullName()) and v:IsA("ModuleScript") then
			client.md[v.Name:lower()] = require(v)
		end
	end
    if not client.md.saving then
        client.md.saving = require(client.md.Framework.Client.Saving)
    end
end)
hm()

client.getlocalres = (function()
    return client.md.clientrestaurant.GetLocal()
end)
client.getcurrencies = (function(currency)
	return getupvalue(client.md.currencycmds.HasNonCashCurrency, 1)[currency]
end)
client.getresactions = (function()
    local actions = {}
    for i,v in getupvalue(client.md.proximityprompt.Create, 9) do
        if typeof(v) == "table" and v.Handle then
            setreadonly(v, false)
            v.ActionName = v.Handle.ActionText
            table.insert(actions, v)
        end
    end
    return actions
end)
client.getitemquantity = (function(itemname)
    local offersremaining = client.md.shop.GetOffersRemaining(client.pl.LocalPlayer)
    for i,v in offersremaining do
		if v.ItemDir and v.ItemDir._script and v.ItemDir._script.Name:match("@ (.+)") == itemname then
			return v.Quantity
		end
    end
    return 0
end)
client.getorderstandmodel = (function()
	for i,v in client.getlocalres().Model.Entities:GetChildren() do
		if v.Name:find("Order Stand_") then
			return v
		end
	end
	return nil
end)
client.getorderstand = (function()
    for i,v in client.getlocalres().Entity do
        if v:GetModel() == client.getorderstandmodel() then
            return v
        end
    end
    return {
        GetSession = (function() return {} end)
    }
end)
client.getpriciestcustomer = (function(name)
    local list = client.getorderstand():GetSession(name)
	if list then
		local bestcustomerid = nil
		local bestrecipeid = nil
		local saveget = client.md.saving.Get()
		local maxprice = -1
		for i,v in list do
			local recipe = client.md.recipe[v[2]]
			if recipe then
				local price = client.md.recipeutil.ComputeSalePrice(recipe, saveget)
				if price > maxprice then
					maxprice = price
					bestcustomerid = v[1]
					bestrecipeid = v[2]
				end
			end
		end
		return bestcustomerid, bestrecipeid, maxprice
	end
	return nil
end)
client.getlowestfromclass = (function(classes)
	local lowestlevelemployee = {}
	for j, k in classes do
		local highest = 0
		for i,v in client.getlocalres():CollectSubclass(k) do
            if client.md.stafflevelingcmds.CanTrain(v) and client.md.stafflevelingcmds.GetLevel(v) > highest then
                highest = client.md.stafflevelingcmds.GetLevel(v)
            end
		end
		if highest == 1 then 
			highest = 2
		end
		for i,v in client.getlocalres():CollectSubclass(k) do
			if client.md.stafflevelingcmds.CanTrain(v) and client.md.stafflevelingcmds.GetLevel(v) < highest then
				lowestlevelemployee[#lowestlevelemployee + 1] = v
                break
			end
		end
		if not lowestlevelemployee[j] then
			for i,v in client.getlocalres():CollectSubclass(k) do
				if client.md.stafflevelingcmds.CanTrain(v) and client.md.stafflevelingcmds.GetLevel(v) <= highest then
					lowestlevelemployee[#lowestlevelemployee + 1] = v
					break
				end
			end
		end
	end
	return lowestlevelemployee
end)
client.getblackmarketcyclestring = (function(cycle)
    local now = workspace:GetServerTimeNow()
    local state = client.md.blackmarketcmds.GetState()
    local level = state.Level
    local epoch = client.md.blackmarkettypes.Config.Epoch
    local period = client.md.blackmarkettypes.Config.Period
    local lines = {}
    table.insert(lines, ("Current Black Market Level: %d"):format(level))
    for i = 1, cycle do
        local nextarrival = client.md.blackmarkettypes.GetNextArrival(now + (i - 1) * period)
        local cycleindex = math.floor((nextarrival - epoch) / period)
        local timeDiff = nextarrival - now
        local relativetime = ("%dh %dm"):format(math.floor(timeDiff / 3600), math.floor((timeDiff % 3600) / 60))
        table.insert(lines, ("[Cycle %d] Starts at: %s (In %s)"):format(cycleindex, os.date("%I:%M %p", nextarrival), relativetime))
        for i,v in client.md.blackmarkettypes.RollInventory(cycleindex, level) do -- devs fucking deleted RollInventory function
            table.insert(lines, ("- %s (x%d)"):format(v.Id, v.Quantity))
        end
    end
    return table.concat(lines, "\n")
end)
client.lockitemslistupdate = (function()
    for i,v in (configs.itemslock or {}) do
        client.itemslocklist[v] = configs.itemslockamount or nil
    end
end)
client.entityinvoke = (function(attributeid, invokeid) -- (TargetDishwasherId, DepositDishPlayer)
	local id = game:GetService("Players").LocalPlayer:GetAttribute(attributeid)
	if id then
		for i,v in client.getlocalres().Entity do
			if v:GetModel():GetAttribute("EntityId") == id then
				v:Invoke(invokeid)
			end
		end
	end
end)
client.runactionsfromentities = GUF_NO_VIRTUALIZE(function(actionname, shouldtp) -- "Assign Seat", "Take Order", "Serve", "Wash", "Cook", "Take"
    for i,v in client.getlocalres().Model.Entities:GetChildren() do
        if v:FindFirstChild("HumanoidRootPart") and v.HumanoidRootPart:FindFirstChild("ProximityPrompt") and v.HumanoidRootPart.ProximityPrompt.Enabled and v.HumanoidRootPart.ProximityPrompt.ActionText == actionname then
            if shouldtp then
				client.pl.LocalPlayer.Character:PivotTo(v.HumanoidRootPart.CFrame)
			end
			fireproximityprompt(v.HumanoidRootPart.ProximityPrompt)
        elseif v:FindFirstChild("Root") and v.Root:FindFirstChild("ProximityPrompt") and v.Root.ProximityPrompt.Enabled and v.Root.ProximityPrompt.ActionText == actionname then
            if shouldtp then
				client.pl.LocalPlayer.Character:PivotTo(v.Root.CFrame)
			end
			fireproximityprompt(v.Root.ProximityPrompt)
        elseif v:FindFirstChild("Interact") and v.Interact:FindFirstChild("ProximityPrompt") and v.Interact.ProximityPrompt.Enabled and v.Interact.ProximityPrompt.ActionText == actionname then
            if shouldtp then
				client.pl.LocalPlayer.Character:PivotTo(v.Interact.CFrame)
			end
			fireproximityprompt(v.Interact.ProximityPrompt)
        end
    end
end)
client.runactionsfromdebris = (function(actionname, cooldown, shouldbreak) -- "Serve", "Cook", "Pick Up"
	if shouldbreak == nil then
		shouldbreak = true
	end
    for i,v in workspace.__DEBRIS:GetChildren() do
        if v:FindFirstChild("ProximityPrompt") and v.ProximityPrompt.Enabled and v.ProximityPrompt.ActionText == actionname then
            fireproximityprompt(v.ProximityPrompt)
            task.wait(cooldown or 0)
			if shouldbreak then
				break
			end
        end
    end
end)
client.collectquests = (function()
    for i,v in client.pl.LocalPlayer.PlayerGui.Quests.Quests.Frame.Content.Quests:GetChildren() do
        if v:FindFirstChild("Claim") and v.Claim.Visible then
            firesignal(v.Claim.Activated)
        end
    end
end)
client.npcset = (function()
    for i,v in client.getlocalres().Model.Entities:GetChildren() do
        if v:FindFirstChild("Humanoid") and not v:GetAttribute("Set") then
            task.spawn(function()
                -- v.Humanoid.WalkSpeed = 300
                v:SetAttribute("Set", true)
                -- v:PivotTo(CFrame.new(v.Humanoid.WalkToPoint) * CFrame.new(0, 5.5, 0))
                v.Humanoid:GetPropertyChangedSignal("WalkToPoint"):Connect(function()
                    if configs.fastnpcs then
                        v:PivotTo(CFrame.new(v.Humanoid.WalkToPoint) * CFrame.new(0, 5.5, 0))
                    end
                    -- v.Humanoid.WalkSpeed = 300
                end)
            end)
        end
    end
end)
client.buyemployee = (function(employeetargetlist)
    employeetargetlist = employeetargetlist or {}
    for i,v in employeetargetlist do
        local storedlayoutorder = {}
        local lowestordernumber = 9e9
        local lowestorder
        for i2,v2 in client.pl.LocalPlayer.PlayerGui.Employees.Employees.Frame.Content.Holder.ScrollingFrame[v.. "Holder"]:GetChildren() do
            if v2:FindFirstChild("Buy") and v2.Buy.Visible then
                storedlayoutorder[tonumber(v2.LayoutOrder)] = v2
            end
        end
        for i2,v2 in storedlayoutorder do
            if tonumber(i2) < lowestordernumber then
                lowestordernumber = tonumber(i2)
                lowestorder = v2
            end
        end
        if lowestorder then
            firesignal(lowestorder.Buy.Activated)
        end
    end
end)
client.claimgnomes = (function()
	for i,v in workspace.__THINGS.Gnomes:GetChildren() do
		if v:FindFirstChild("__SecretGnomeClickDetector") then
			repeat task.wait()
				xpcall(function()
					game.Players.LocalPlayer.Character:PivotTo(v:GetPivot())
					fireclickdetector(v.__SecretGnomeClickDetector)
				end, print)
			until not v:FindFirstChild("__SecretGnomeClickDetector") 
		end
	end
end)
client.buyboughtableitems = (function()
	xpcall(function()
			for i,v in (configs.boughtableitems or {}) do
				--client.md.shopcmds.Purchase(v)
				-- task.spawn(function()
					-- client.md.network.Invoke("Shop_Purchase", v)
				-- end)
				-- local success = client.md.network.Invoke("Shop_Purchase", v)
				-- if success then
				-- 	repeat task.wait(0.05) 
				-- 		success = client.md.network.Invoke("Shop_Purchase", v)
				-- 	until not success
				-- end
				if client.getitemquantity(v) > 0 then
					repeat task.wait(0.05)
						client.md.network.Invoke("Shop_Purchase", v)
					until client.getitemquantity(v) == 0
				end
				task.wait(0.1)
			end
	end, print)
end)
client.collectmilestone = (function()
	for _, k in client.md.milestonesutil.GetCategories() do
		for i,v in client.md.milestonesutil.GetMilestonesInCategory(k) do
			if client.md.milestonecmds.IsClaimable(v) then
				client.md.milestonecmds.ClaimReward(v)
			end
		end
	end
end)
client.sellexisting = (function()
    local tosell = {}
    for i, v in client.itemslocklist do
        local currentamount = client.getcurrencies(i)
        if currentamount > v then
            local itemobj = client.md.currency[i]
            if itemobj then
                tosell[itemobj] = currentamount - v
            end
        end
    end
    if next(tosell) then
        client.md.currencycmds.Sell(tosell)
    end
end)

local notifytimeout = tick()
task.spawn(function()
	client.ori = {
		addprompt = client.md.clientcustomer.AddPrompt;
		invoke = client.md.network.Invoke;
		bonuspopup = client.md.bonuspopup;
	}
	for i,v in client.ori do
		client.ori[i] = clonefunction(v)
	end
	client.md.clientcustomer.AddPrompt = (function(...)
		local args = {...}
		if configs.takeorder and args[2] == "Take Order" then
			args[3]()
		elseif configs.assignseat and args[2] == "Assign Seat" then
			args[3]()
		end
		return client.ori.addprompt(...)
	end)
	hookfunction(client.md.network.Invoke, function(...)
		local args = {...}
		local priciest
		if args[3] == "TakeTicketPlayer" and configs.cookbestfood then
			priciest = client.getpriciestcustomer("OrderList")
			args[4] = priciest or args[4]
		elseif args[3] == "TakeDeliveryPlayer" and configs.servebestfood then
			priciest = client.getpriciestcustomer("ReadyList")
			args[4] = priciest or args[4]
		end
		return client.ori.invoke(unpack(args))
	end)
	hookfunction(client.md.bonuspopup, function(a)
		if (configs.autoreel or configs.autofish) and a.Text == "Reel!" then
			client.md.clientfishing.Reel()
		end
		return client.ori.bonuspopup(a)
	end)
end)
local timeouttick = tick()
task.spawn(function()
    for i,v in {
		autoactions = {0.1, function()
			task.spawn(function()
				client.pl.LocalPlayer.Character:PivotTo(client.getorderstandmodel():GetPivot() * CFrame.new(0, 10, 0))
			end)
			for i,v in configs.servingactions do
				if v == "Food Serve" then
					client.runactionsfromdebris("Serve")
				elseif v == "Wash Dishes" and (not client.pl.LocalPlayer:GetAttribute("HoldingDirtyDish") or not client.pl.LocalPlayer:GetAttribute("TargetDishwasherId")) then
					client.runactionsfromdebris("Pick Up")
				elseif v == "Cook Food" then
					client.runactionsfromdebris("Cook")
				end
			end
		end};
        autoharvest = {0.1, function()
			for i,v in workspace.__DEBRIS:GetChildren() do
				if client.md.clientfridge.HasSpace() and v:FindFirstChild("ProximityPrompt") and v.ProximityPrompt.Enabled and v.ProximityPrompt.ActionText == "Harvest" and not table.find(configs.cropexclude, v.Name:match("^([^_]+)")) then
					client.pl.LocalPlayer.Character:PivotTo(v.CFrame)
					fireproximityprompt(v.ProximityPrompt)
					task.wait(0.015)
				end
			end
        end};
        claimcashregister = {0.2, function()
            -- for i,v in client.getlocalres().Model.Entities:GetChildren() do
            --     if v:FindFirstChild("Cashregister") and v:FindFirstChild("Interact") and v.Interact:FindFirstChild("ProximityPrompt") and v.Interact.ProximityPrompt.Enabled then
            --         fireproximityprompt(v.Interact.ProximityPrompt)
            --     end
            -- end
			for i,v in client.getlocalres().Entity do
				if v.DirId == "Cash Register" and v:GetSave("Cash") and v:GetSave("Cash") >= configs.cashregisteramount then
					repeat task.wait()
						client.pl.LocalPlayer.Character:PivotTo(v.Model:GetPivot() * CFrame.new(0, 2, 0))
						v:Invoke("CashRegisterClaim")
					until v:GetSave("Cash") <= configs.cashregisteramount
				end
			end
        end};
        claimtipjar = {0.2, function()
            -- for i,v in client.getlocalres().Model.Entities:GetChildren() do
            --     if v:FindFirstChild("Tipjar") and v:FindFirstChild("Interact") and v.Interact:FindFirstChild("ProximityPrompt") and v.Interact.ProximityPrompt.Enabled then
            --         fireproximityprompt(v.Interact.ProximityPrompt)
            --     end
            -- end
			for i,v in client.getlocalres().Entity do
				if v.DirId:find("Tip Jar") and v:GetSave("Cash") and v:GetSave("Cash") >= configs.tipjaramount then
					repeat task.wait()
						client.pl.LocalPlayer.Character:PivotTo(v.Model:GetPivot() * CFrame.new(0, 2, 0))
						v:Invoke("TipJarClaim")
					until v:GetSave("Cash") <= configs.tipjaramount
				end
			end
        end};
        claimquests = {1, function()
			-- setconstant(getupvalue(getconnections(client.pl.LocalPlayer.PlayerGui.Quests.Quests.Frame.Content.Header.Buttons.ActiveButton.Activated)[1].Function, 4), 2, "fsiasdfadsf")
			-- getupvalue(getconnections(client.pl.LocalPlayer.PlayerGui.Quests.Quests.Frame.Content.Header.Buttons.ActiveButton.Activated)[1].Function, 4)()
            -- client.collectquests()
			if client.md.questcmds.HasClaimable() then
				client.md.tabcontroller.OpenTab("Quests")
				repeat task.wait()
					client.collectquests()
				until not client.md.questcmds.HasClaimable() or configs.claimquests == false
				client.md.tabcontroller.CloseTab("Quests")
			end
        end};
        foodtruckfill = {0.1, function()
            client.runactionsfromdebris("Fill")
        end};   
        feederfill = {0.05, function()
           -- client.runactionsfromentities("Fill")
		   local feedercurrencytype = {
				["Pig Feeder"] = "Carrot";
				["Cow Feeder"] = "Corn";
				["Chicken Feeder"] = "Wheat";
                ["Lamb Feeder"] = "Lettuce";
		   }
		   for i,v in client.getlocalres().Entity do
				if v.Model and feedercurrencytype[v.DirId] then
					if client.getcurrencies(feedercurrencytype[v.DirId]) > 0 and v:GetSave("Amount") <= (configs.feederamount or 0) then
						client.pl.LocalPlayer.Character:PivotTo(v.Model:GetPivot() * CFrame.new(0, 2, 0))
						v:Fire("Fill")
					end
				end
		    end
        end};
        stationfill = {0.05, function()
            for i,v in client.getlocalres().Entity do
                if v.DirId == "Basic Processing Station" and v:GetSave("Mode") and v:GetSave("Amount") and client.getcurrencies(v:GetSave("Mode")) > 0 and v:GetSave("Amount") <= (configs.stationamount or 0) then
                    client.pl.LocalPlayer.Character:PivotTo(v.Model:GetPivot() * CFrame.new(0, 2, 0))
                    v:Invoke("ProcessingStation_Fill")
                end
            end
        end};
        takeresources = {0.05, function()
            client.runactionsfromentities("Take", true)
        end};
        takehoney = {0.5, function()
            client.runactionsfromentities("Collect", true)
        end};
        buyemployees = {1, function()
            client.buyemployee(configs.staffprofessions or {})
        end};
		boughtitems = {0.1, function()
			client.buyboughtableitems()
		end};
		refillcoffeebeans = {0.1, function()
			for i,v in client.getlocalres().Entity do
				if v.Model and v:GetSave("CoffeeBeans") and client.getcurrencies("Coffee Beans") > 0 and v:GetSave("CoffeeBeans") <= (configs.coffeebeansamount or 0) then
					client.pl.LocalPlayer.Character:PivotTo(v.Model:GetPivot() * CFrame.new(0, 2, 0))
					v:Invoke("CoffeeMachineFill")
				end
			end
		end};
		refillmilk = {0.1, function()
			-- for i,v in client.getlocalres().Model.Entities:GetChildren() do
            --     if v.Name:find("Ice Cream Cart") and v:FindFirstChild("Refill") and v.Refill:FindFirstChild("ProximityPrompt") and v.Refill.ProximityPrompt.Enabled then
            --         fireproximityprompt(v.Refill.ProximityPrompt)
            --     end
            -- end
			for i,v in client.getlocalres().Entity do
				if v.Model and v:GetSave("Milk") and client.getcurrencies("Milk") > 0 and v:GetSave("Milk") <= (configs.milkamount or 0) then
					client.pl.LocalPlayer.Character:PivotTo(v.Model:GetPivot() * CFrame.new(0, 2, 0))
					v:Invoke("IceCreamCartFill")
				end
			end
		end};
		claimicecreamcart = {0.1, function()
			for i,v in client.getlocalres().Model.Entities:GetChildren() do
                if v.Name:find("Ice Cream Cart") and v:FindFirstChild("Claim") and v.Claim:FindFirstChild("ProximityPrompt") then
                    fireproximityprompt(v.Claim.ProximityPrompt)
                end
            end

		end};
		trainstaffs = {1, function()
			for i,v in client.getlowestfromclass(configs.stafftrainclasses) do
				local isyes = client.md.stafflevelingcmds.StartTraining(v:GetId())
				if isyes then
					xpcall(function()
						notification:new("trained: ".. v:GetDirectory().DisplayName)
					end, print)
				end
			end
		end};
		claimmilestones = {1, function()
			client.collectmilestone()
		end};
		influencerclaim = {1, function()
			client.md.network.Invoke("Influencer_OfferRespond", true)
			getproto(client.md.influenceroffer.init, 3, true)[1]()
		end};
		autofish = {0, function()
			client.md.network.Invoke("Fishing_Begin", CFrame.new(859.161865234375, -21.633270263671875, 854.8304443359375, 1, 0, 0, 0, 1, 0, 0, 0, 1))
		end};
    } do
        client.loop[i] = client.coroutinemaker:new("coroutine", v[1], function()
            if configs[i] then
                v[2]()
            end
        end)
        client.loop[i]:setEnabled(true)
    end
end)
task.spawn(function()
    client.getlocalres().Model.Entities.ChildAdded:Connect(function()
        task.wait(0.1)
        client.npcset()
    end)
	client.pl.LocalPlayer:GetAttributeChangedSignal("TargetCustomerId"):Connect(function()
		if configs.autoactions and table.find(configs.servingactions, "Food Serve") then
			if client.debugmode then
				notification:new("Serving food...")
			end
			repeat task.wait()
				xpcall(function()
					--getupvalue(client.md.playerserving.update, 4).Triggered._connections[1]._f()
					client.entityinvoke("TargetCustomerId", "PlaceDeliveryPlayer")
					client.pl.LocalPlayer.Character:PivotTo(getupvalue(client.md.playerserving.update, 4).Handle.Parent.CFrame * CFrame.new(0, 5, 0))
				end, print)
			until not client.pl.LocalPlayer:GetAttribute("TargetCustomerId") or client.md.pingentity.IsActive() == false or configs.autoactions == false or not table.find(configs.servingactions, "Food Serve")
		end
	end)
	client.pl.LocalPlayer:GetAttributeChangedSignal("TargetStoveId"):Connect(function()
		if configs.autoactions and table.find(configs.servingactions, "Cook Food") then
			if client.debugmode then
				notification:new("Cooking food...")
			end
			--task.wait(0.1)
			repeat task.wait()
				xpcall(function()
					--getupvalue(client.md.playerstoves.update, 3).Triggered._connections[1]._f()
					client.entityinvoke("TargetStoveId", "ActivateStovePlayer")
					client.pl.LocalPlayer.Character:PivotTo(getupvalue(client.md.playerstoves.update, 3).Handle.Parent.CFrame * CFrame.new(0, 5, 0))
				end, print)
			until not client.pl.LocalPlayer:GetAttribute("TargetStoveId") or client.md.pingentity.IsActive() == false or configs.autoactions == false or not table.find(configs.servingactions, "Cook Food")
		end
	end)
	client.pl.LocalPlayer:GetAttributeChangedSignal("TargetDishwasherId"):Connect(function()
		if configs.autoactions and table.find(configs.servingactions, "Wash Dishes") then
			if client.debugmode then
				notification:new("Washing dishes...")
			end
			--task.wait(0.1)
			repeat task.wait()
				xpcall(function()
					--getupvalue(client.md.playerdishwasher.update, 3).Triggered._connections[1]._f()
					client.pl.LocalPlayer.Character:PivotTo(getupvalue(client.md.playerdishwasher.update, 3).Handle.Parent.CFrame * CFrame.new(0, 5, 0))
					client.entityinvoke("TargetDishwasherId", "DepositDishPlayer")
				end, print)
			until not client.pl.LocalPlayer:GetAttribute("TargetDishwasherId") or client.md.pingentity.IsActive() == false or configs.autoactions == false or not table.find(configs.servingactions, "Wash Dishes")
		end
	end)
	client.md.network.Fired("Influencer_OfferCreated"):Connect(function()
		if configs.influencerclaim then
			task.delay(0.5, function()
				client.md.network.Invoke("Influencer_OfferRespond", true)
				getproto(client.md.influenceroffer.init, 3, true)[1]()
				print("influencer claimed")
			end)
		end
	end)
	client.md.network.Fired("BlackMarketNPC_Update"):Connect(function(uhh)
		if uhh and configs.blackmarketnotify then
			notification:new("Blackmarket has spawned!")
		end
	end)
	-- yea ik this is very very horrible!!!
	client.pl.LocalPlayer.PlayerGui.Shop.Shop.Frame.Background.Header.RefreshTimer:GetPropertyChangedSignal("Text"):Connect(function()
		if client.pl.LocalPlayer.PlayerGui.Shop.Shop.Frame.Background.Header.RefreshTimer.Text == "Restock: 0:01" and configs.restocknotify then
			notification:new("Shop has restocked!")
		end
	end)
    client.md.currencycmds.Changed:Connect(function(itemObj, newAmount)
        if configs.startitemslock then
            local itemName = itemObj._id
            local limit = client.itemslocklist[itemName]
            if limit and newAmount > limit then
                local excess = newAmount - limit
                client.md.currencycmds.Sell({ [itemObj] = excess })
            end
        end
    end)
end)

local ui = mainui.StartUi({
    Title = "Codecoat";
    SubTitle = "Run A Restaurant | 1.4.2";
	--Size = UDim2.new(0, 485, 0, 350);
})
local page = ui.AddPage("Main")
local sec = page.AddSection("Restaurant") --, "Automatically serve customers and run your restaurant by yourself.")
local option = sec.AddOptions({
	Name = "Restaurant Actions";
	Desc = "Select various restaurant actions to run automatically.";
    Multi = true;
	Default = configs.servingactions or {};
    Callback = (function(a)
        configs.servingactions = a
    end);
})
for i,v in {"Food Serve", "Wash Dishes", "Cook Food"} do
    option.AddOption(v, function(a)
        configs.servingactions = a
    end)
end
-- .AddOptions({"Assign Seat", "Take Order", "Food Serve", "Wash Dishes", "Take Recipe", "Cook Food"}, function(a)
--     configs.servingactions = a
--     print(#configs.servingactions)
-- end)
local timeouttick = tick()
sec.AddToggle({
	Name = "Start Restaurant Actions";
	Desc = "Automatically run selected restaurant actions. Not recommended on high ping.";
	Default = configs.autoactions;
	Callback = (function(a)
		configs.autoactions = a
		task.spawn(function()
			local hum = client.pl.LocalPlayer.Character.Humanoid
			-- workspace.CurrentCamera.CameraSubject = a and (client.getorderstandmodel() or hum) or hum
			workspace.CurrentCamera.CameraType = Enum.CameraType.Track
			if table.find(configs.servingactions, "Take Order") then
				client.runactionsfromentities("Take Order")
			end
			if table.find(configs.servingactions, "Assign Seat") then
				client.runactionsfromentities("Assign Seat")
			end
		end)
	end);
})
sec.AddToggle({
	Name = "Take Order";
	Desc = "Instantly take customer order with ease.";
	Default = configs.takeorder;
	Callback = (function(a)
		configs.takeorder = a
		if a then
			client.runactionsfromentities("Take Order")
		end
	end);
})
sec.AddToggle({
	Name = "Assign Seat";
	Desc = "Instantly assigns customer seats with ease.";
	Default = configs.assignseat;
	Callback = (function(a)
		configs.assignseat = a
		if a then
			client.runactionsfromentities("Assign Seat")
		end
	end);
})

local sec = page.AddSection("Incomes") 
local textbox = sec.AddTextbox({
	Name = "Claim Cash Register At";
	Desc = "Set the minimum amount of cash to claim.";
	Default = tostring(configs.cashregisteramount or "250");
	NumbersOnly = true;
	Callback = (function(a)
		configs.cashregisteramount = tonumber(a)
	end);
})
local toggle = sec.AddToggle({
	Name = "Claim Cash Register";
	Desc = "Automatically teleport and claim the cash register when it hits desired amount of cash.";
	Default = configs.claimcashregister;
	Callback = (function(a)
		configs.claimcashregister = a
	end);
})
-- task.spawn(function()
-- 	while true do task.wait(0.25)
-- 		xpcall(function()
-- 			-- toggle.SetDesc
-- 			print("Automatically teleport and claim the cash register when it hits desired amount of cash.\nClaiming At: $".. tostring(client.numbercommas(tonumber(textbox.GetValue()))))
-- 		end, print)
-- 	end
-- end)
local textbox = sec.AddTextbox({
	Name = "Claim Tip Jar At";
	Desc = "Set the minimum amount of tips to claim.";
	Default = tostring(configs.tipjaramount or "1000");
	NumbersOnly = true;
	Callback = (function(a)
		configs.tipjaramount = tonumber(a)
	end);
})
local toggle = sec.AddToggle({
	Name = "Claim Tip Jar";
	Desc = "Automatically teleport and claim the tip jar when it hites desired amount of tips.";
	Default = configs.claimtipjar;
	Callback = (function(a)
		configs.claimtipjar = a
	end);
})
-- task.spawn(function()
-- 	while true do task.wait(0.25)
-- 		xpcall(function()
-- 			print("Automatically teleport and claim the tip jar when it hites desired amount of tips.\nClaiming At: $".. tostring(client.numbercommas(tonumber(textbox.GetValue()))))
-- 		end, print)
-- 	end
-- end)

local sec = page.AddSection("Crop") 
configs.cropexclude = configs.cropexclude or {}
local option, optionframe = sec.AddOptions({
	Name = "Exclude Crops";
	Desc = "Select various crops to exclude. Preventing it from being harvested.";
    Multi = true;
	Default = configs.cropexclude;
    Callback = (function(a)
        configs.cropexclude = a
    end);
})
optionframe.OptionsFrameLayout.SortOrder = Enum.SortOrder.Name
for i,v in client.rs.__DIRECTORY.Entity.Crop:GetChildren() do
	option.AddOption(v.Name:match("@ (.+)"), function(a)
		configs.cropexclude = a
	end)
end
sec.AddToggle({
	Name = "Harvest Crops";
	Desc = "Automatically teleports to targetted harvested crops when they are ready.";
	Default = configs.autoharvest;
	Callback = (function(a)
		configs.autoharvest = a
	end);
})

local sec = page.AddSection("Animals") 
sec.AddSlider({
	Name = "Start Refill At";
	Desc = "Adjust the minimum amount of food to start refilling the feeders.";
	Default = configs.feederamount or 8;
	Min = 0;
	Max = 12;
	Round = 0;
	Prefix = "";
	Callback = (function(a)
		configs.feederamount = a
	end)
})
sec.AddToggle({
	Name = "Refill Feeders";
	Desc = "Automatically teleport and refill animals feeders.";
	Default = configs.feederfill;
	Callback = (function(a)
		configs.feederfill = a
	end);
})
sec.AddToggle({
	Name = "Take Animals Resources";
	Desc = "Automatically teleports and take resources from animals when they are available.";
	Default = configs.takeresources;
	Callback = (function(a)
		configs.takeresources = a
	end);
})

local sec = page.AddSection("Processing Station") 
sec.AddSlider({
	Name = "Start Refill At";
	Desc = "Adjust the minimum amount of food to start refilling the station.";
	Default = configs.stationamount;
	Min = 0;
	Max = 20;
	Round = 0;
	Prefix = "";
	Callback = (function(a)
		configs.stationamount = a
	end)
})
sec.AddToggle({
	Name = "Refill Stations";
	Desc = "Automatically teleport and refill processing stations.";
	Default = configs.stationfill;
	Callback = (function(a)
		configs.stationfill = a
	end);
})

local sec = page.AddSection("Fishing") 
sec.AddToggle({
	Name = "Auto Fishing";
	Desc = "Automatically cast and reel fishing rod. Need fishing rod equipped";
	Default = configs.autofish;
	Callback = (function(a)
		configs.autofish = a
	end);
})
sec.AddToggle({
	Name = "Auto Reel";
	Desc = "Automatically reel fishing rod upon bobber caught.";
	Default = configs.autoreel;
	Callback = (function(a)
		configs.autoreel = a
	end);
})

local sec = page.AddSection("Bees") 
sec.AddToggle({
	Name = "Collect Honey";
	Desc = "Automatically teleports and collect honey from beehive when it's available.";
	Default = configs.takehoney;
	Callback = (function(a)
		configs.takehoney = a
	end);
})

local sec = page.AddSection("Coffee Machine") 
sec.AddSlider({
	Name = "Start Refill At";
	Desc = "Adjust the minimum amount of beans to start refilling the coffee machine.";
	Default = configs.coffeebeansamount or 4;
	Min = 0;
	Max = 9;
	Round = 0;
	Prefix = "";
	Callback = (function(a)
		configs.coffeebeansamount = a
	end)
})
sec.AddToggle({
	Name = "Refill Coffee Beans";
	Desc = "Automatically teleports and refill coffee beans when they're running low.";
	Default = configs.refillcoffeebeans;
	Callback = (function(a)
		configs.refillcoffeebeans = a
	end);
})

local sec = page.AddSection("Ice Cream Stand") 
sec.AddSlider({
	Name = "Start Refill At";
	Desc = "Adjust the minimum amount of milk to start refilling the ice cream cart.";
	Default = configs.milkamount or 4;
	Min = 0;
	Max = 15;
	Round = 0;
	Prefix = "";
	Callback = (function(a)
		configs.milkamount = a
	end)
})
sec.AddToggle({
	Name = "Refill Milk";
	Desc = "Automatically refill milk ingredients when they're running low.";
	Default = configs.refillmilk;
	Callback = (function(a)
		configs.refillmilk = a
	end);
})
-- sec.AddTextbox({
-- 	Name = "Claim Earnings At";
-- 	Desc = "Set the minimum amount of earnings to claim.";
-- 	Default = "1000";
-- 	NumbersOnly = true;
-- 	Callback = (function(a)
-- 		configs.icecreamearnings = tonumber(a)
-- 	end);
-- })
sec.AddToggle({
	Name = "Claim Earnings";
	Desc = "Automatically claim ice cream cart earnings when they're available.";
	Default = configs.claimicecreamcart;
	Callback = (function(a)
		configs.claimicecreamcart = a
	end);
})

local sec = page.AddSection("Influencer") 
sec.AddToggle({
	Name = "Accept Influencer Offer";
	Desc = "Instantly accepts influencer offers when it's available.";
	Default = configs.influencerclaim;
	Callback = (function(a)
		configs.influencerclaim = a
	end);
})

local sec = page.AddSection("Food Truck") 
sec.AddToggle({
	Name = "Fill Food Truck";
	Desc = "Automatically fill the food truck when it's available.";
	Default = configs.foodtruckfill;
	Callback = (function(a)
		configs.foodtruckfill = a
	end);
})

local page = ui.AddPage("Misc")
local sec = page.AddSection("NPCs")
sec.AddToggle({
	Name = "Fast NPCs";
	Desc = "haha NPCs go brrrrr ";
	Default = configs.fastnpcs;
	Callback = (function(a)
		configs.fastnpcs = a
        client.npcset()
	end);
})

local sec = page.AddSection("Order Stand") 
sec.AddToggle({
	Name = "Grab Priciest Recipe";
	Desc = "Automatically replaces with the priciest recipes. Drops performance.";
	Default = configs.cookbestfood;
	Callback = (function(a)
		configs.cookbestfood = a
	end);
})
sec.AddToggle({
	Name = "Grab Priciest Food";
	Desc = "Automatically replaces with the priciest serving food. Drops performance.";
	Default = configs.servebestfood;
	Callback = (function(a)
		configs.servebestfood = a
	end);
})

local sec = page.AddSection("Ingredients") 
local option = sec.AddOptions({
	Name = "Ingredients Classes";
	Desc = "Select various ingredients classes to lock them.";
    Multi = true;
	Default = configs.itemslock or {};
    Callback = (function(a)
        configs.itemslock = a
    end);
})
for i,v in client.rs.__DIRECTORY.Currency:GetChildren() do
    if v:IsA("ModuleScript") then
        local module = require(v)
        if module and module.RequiresFridgeStorage then
            option.AddOption(v.Name:match("@ (.+)"), function(a)
                configs.itemslock = a
                client.lockitemslistupdate()
            end)
        end
    end
end
sec.AddTextbox({
	Name = "Ingredients Lock Amount";
	Desc = "Adjust the maximum amount of ingredients to lock.";
	Default = tostring(configs.itemslockamount or "250");
    NumbersOnly = true;
	Callback = (function(a)
		configs.itemslockamount = tonumber(a)
        client.lockitemslistupdate()
	end)
})
sec.AddToggle({
	Name = "Ingredients Lock";
	Desc = "Automatically sells selected ingredients to below maximum items lock amount.";
	Default = configs.startitemslock;
	Callback = (function(a)
		configs.startitemslock = a
        client.lockitemslistupdate()
        if a then
            client.sellexisting()
        end
	end);
})

local sec = page.AddSection("Recruitement")
local option = sec.AddOptions({
	Name = "Staff Classes";
	Desc = "Select various staff classes to automatically buy them.";
    Multi = true;
	Default = configs.staffprofessions or {};
    Callback = (function(a)
        configs.staffprofessions = a
    end);
})
for i,v in client.md.entityutil.EmployeeSubclasses do
    option.AddOption(v.. "s", function(a)
        configs.staffprofessions = a
    end)
end
sec.AddToggle({
	Name = "Buy Employees";
	Desc = "Automatically buy employees when they are affordable.";
	Default = configs.buyemployees;
	Callback = (function(a)
		configs.buyemployees = a
	end);
})

local sec = page.AddSection("Staff Training")
local option = sec.AddOptions({
	Name = "Staff Classes";
	Desc = "Select various staff classes to train. The maximum amount selected is limited to 3.";
    Multi = true;
	Default = configs.stafftrainclasses or {};
	MaximumSelected = 3;
    Callback = (function(a)
        configs.stafftrainclasses = a
    end);
	OnMaximumCallback = (function()
		notification:new("Maximum amount selected exceeded")
	end);
})
for i,v in client.md.entityutil.EmployeeSubclasses do
	if v ~= "Manager" then
		option.AddOption(v, function(a)
			configs.stafftrainclasses = a
		end)
	end
end
sec.AddToggle({
	Name = "Train Staffs";
	Desc = "Automatically trains the lowest level staffs when they're affordable.";
	Default = configs.trainstaffs;
	Callback = (function(a)
		configs.trainstaffs = a
	end);
})

local sec = page.AddSection("User Interfaces") 
sec.AddButtons({
    Name = "GUIs Opener";
    Desc = "Opens various GUIs related to the game without manual interaction.";
}).AddButtons({
	{"Shop", function()
		client.md.tabcontroller.OpenTab("Shop")
	end};
	{"Sell", function() 
		client.md.tabcontroller.OpenTab("SellItems")
	end};
})

local sec = page.AddSection("Quests") 
sec.AddToggle({
	Name = "Claim Quests";
	Desc = "Automatically claim quests when they are ready to claim.";
	Default = configs.claimquests;
	Callback = (function(a)
		configs.claimquests = a
	end);
})

local sec = page.AddSection("Milestones") 
sec.AddToggle({
	Name = "Claim Milestones";
	Desc = "Automatically claim milestones when they are ready to claim.";
	Default = configs.claimmilestones;
	Callback = (function(a)
		configs.claimmilestones = a
	end);
})

local sec = page.AddSection("Gnomes") 
sec.AddButtons({
	Name = "Secret Gnomes";
	Desc = "Automatically find and claim all secret gnomes in the game.";
}).AddButtons({
	{"Collect All Gnomes", function()
		client.claimgnomes()
	end};
})

local page = ui.AddPage("Shop")
local sec = page.AddSection("Store") 
local sorteditems = {}
for i,v in client.rs.__DIRECTORY.Item.Buildable:GetChildren() do
    local module = require(v)
    if module.DisplayName and module.ShopCost and module.ShopCost.Cash and module.AllowUnobtainable ~= true then
        table.insert(sorteditems, v.Name:match("@ (.+)"))
    end
end
sec.AddDropdown({
	Name = "Boughtable Items";
	Desc = "Select various items to buy automatically.";
	Options = sorteditems;
	Multi = true;
	EnableSearchbar = true;
	Default = configs.boughtableitems or {};
	Callback = (function(a)
		configs.boughtableitems = a
	end);
})

sec.AddToggle({
	Name = "Buy Items";
	Desc = "Automatically buy items when they are in stock.";
	Default = configs.boughtitems;
	Callback = (function(a)
		configs.boughtitems = a
	end);
})

local sec = page.AddSection("Blackmarket") 
local sorteditems = {}
for i,v in client.md.blackmarkettypes.Config.Items do
    table.insert(sorteditems, v.Id)
end
if not configs.blackmarketitems2 then
	configs.blackmarketitems2 = {}
end
sec.AddDropdown({
	Name = "Blackmarket Items";
	Desc = "Select various blackmarket items to buy automatically.";
	Options = sorteditems;
	Multi = true;
	EnableSearchbar = true;
	Default = configs.blackmarketitems or {};
	Callback = (function(a)
		configs.blackmarketitems = a
	end);
})
local processedCycleIndex = nil
-- credits to gemini 3.1 pro. because i am starting to lose interested on this game. sowwwyyy :<<
sec.AddToggle({
	Name = "Buy Blackmarket Items";
	Desc = "Automatically buys blackmarket items when they are available.";
	Default = configs.buyblackmarket;
	Callback = (function(a)
		configs.buyblackmarket = a
		task.spawn(function()
			local bmTypes = client.md.blackmarkettypes
			local bmCmds = client.md.blackmarketcmds
			while configs.buyblackmarket do
				local now = workspace:GetServerTimeNow()
				local cycle = bmTypes.GetCurrentCycle(now)
				if cycle then
					local cycleIndex = cycle.Index
					if processedCycleIndex ~= cycleIndex then
						processedCycleIndex = cycleIndex
						local state = bmCmds.GetState()
						local level = state.Level
						local items = (type(bmTypes.RollInventory) == "function" and bmTypes.RollInventory(cycleIndex, level)) or {}
						for _, item in ipairs(items) do
							local alreadyPurchased = state.Purchases[item.Id] or 0
							local remaining = item.Quantity - alreadyPurchased
							if table.find(configs.blackmarketitems or {}, item.Id) and remaining > 0 then
								for i = 1, remaining do
									bmCmds.Purchase(item.Id, 1)
									task.wait(0.5)
								end
							end
						end
					end
				else
					processedCycleIndex = nil
				end
				task.wait(0.1)
			end
		end)
	end);
})

local sec = page.AddSection("Notifier") 
sec.AddToggle({
	Name = "Blackmarket Notify";
	Desc = "Notifies you when blackmarket npc has spawned.";
	Default = configs.blackmarketnotify;
	Callback = (function(a)
		configs.blackmarketnotify = a
	end);
})
sec.AddToggle({
	Name = "Shop Restock Notify";
	Desc = "Notifies you when shop has restocked.";
	Default = configs.restocknotify;
	Callback = (function(a)
		configs.restocknotify = a
	end);
})

-- local predictorparagraph
-- local sec = page.AddSection("Blackmarket Predictor") 
-- predictorparagraph = sec.AddParagraph("Blackmarket Cycles", client.getblackmarketcyclestring(configs.cycleamount or 1))
-- sec.AddSlider({
-- 	Name = "Cycle Amount";
-- 	Desc = "Adjust how much the next blackmarket cycle to be shown.";
-- 	Default = configs.cycleamount or 1;
-- 	Min = 1;
-- 	Max = 3;
-- 	Round = 0;
-- 	Prefix = "";
-- 	Callback = (function(a)
-- 		configs.cycleamount = a
--         if predictorparagraph then
--             predictorparagraph.SetDesc(client.getblackmarketcyclestring(configs.cycleamount))
--         end
-- 	end)
-- })


local page = ui.AddPage("Info")
local sec = page.AddSection("Configs")
sec.AddButtons({
    Name = "Configs Manager";
    Desc = "You can manages your current config here. Saved configs automatically loaded upon next execution.";
}).AddButtons({
	{"Save", function()
		writefile(FileName, jsone(configs))
		notification:new("Success!")
	end};
	{"Delete", function()
		delfile(FileName, jsone(configs))
		notification:new("Success!")
	end};
})

local sec = page.AddSection("Discord")
sec.AddButtons({
    Name = "Discord Server";
    Desc = "Join our discord server to receive our latest updates and support for our scripts.";
}).AddButtons({
	{"Copy To Clipboard", function()
		if setclipboard == nil then
            notification:new("Copy Discord Invite Failed!, Missing Function: setclipboard")
            return
        end
        setclipboard("https://discord.gg/R82qYWkAsh")
        notification:new("Success!")
	end};
})

local sec = page.AddSection("Developer & Credits")
sec.AddParagraph("Dexemox", "UI Developer, Script Developer, Founder of Codecoat\nDiscord: dexemoxed")
sec.AddParagraph("alohabeach", "Coroutine-maker, Notification Module")



task.spawn(function()
	for i,v in getconnections(game:GetService("RunService").Heartbeat) do
		if v.Function and islclosure(v.Function) and getconstants(v.Function)[2] == "AntiAFK_Report" then
			setconstant(v.Function, 2, "aefikjdf")
			v:Disconnect()
		end
	end
	for i,v in getconnections(game:GetService("UserInputService").WindowFocusReleased) do
		if v.Function and islclosure(v.Function) and getconstants(v.Function)[2] == "AntiAFK_Focus" then
			setconstant(v.Function, 2, "adsifjuadif")
			v:Disconnect()
		end
	end
	game:GetService("RunService").Heartbeat:Connect(function()
		client.md.network.Fire("AntiAFK_Clear")
		client.md.network.Fire("AntiAFK_Focus", true)
	end)
	for i,v in getconnections(client.pl.LocalPlayer.Idled) do
		v:Disconnect()
	end
	client.pl.LocalPlayer.Idled:Connect(function()
		game:GetService("VirtualUser"):CaptureController()
		game:GetService("VirtualUser"):ClickButton2(Vector2.new())
	end)
end)
