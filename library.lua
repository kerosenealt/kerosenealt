local punishgoatby97mzu = {
Instances = {},
ThemeChangedHooks = {},
CurrentTheme = "punishgoat",
Themes = {
punishgoat = {
MainBg = Color3.fromRGB(15, 15, 15),
Stroke = Color3.fromRGB(70, 70, 70),
Accent = Color3.fromRGB(40, 40, 40),
Accentpunish = Color3.fromRGB(230, 230, 230),
Text = Color3.fromRGB(220, 220, 220),
TextInactive = Color3.fromRGB(255, 255, 255),
ToggleBgOff = Color3.fromRGB(50, 50, 50),
ToggleBtnBg = Color3.fromRGB(35, 35, 35),
ToggleDot = Color3.fromRGB(200, 200, 200),
SectionTitle = Color3.fromRGB(160, 160, 160),
},
},
}
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
function punishgoatby97mzu:ApplyThemeObj(Inst, Prop, ThemeType)
table.insert(self.Instances, { Inst = Inst, Prop = Prop, Type = ThemeType })
local palette = self.Themes[self.CurrentTheme]
Inst[Prop] = palette[ThemeType]
return Inst
end
function punishgoatby97mzu:ChangeTheme(ThemeName)
self.CurrentTheme = ThemeName
local palette = self.Themes[ThemeName]
for _, obj in pairs(self.Instances) do
if obj.Inst and obj.Inst.Parent then
TweenService:Create(obj.Inst, TweenInfo.new(0.3), { [obj.Prop] =
palette[obj.Type] }):Play()
end
end
for _, hook in pairs(self.ThemeChangedHooks) do
if hook.Inst and hook.Inst.Parent then
hook.Func(ThemeName)
end
end
end
local NotifUI = Instance.new("ScreenGui")
NotifUI.Name = "punishgoatNotifUI"
NotifUI.ResetOnSpawn = false
NotifUI.IgnoreGuiInset = true
-- Set the highest DisplayOrder so notification cards never get covered by the game's HUD
NotifUI.DisplayOrder = 99999
NotifUI.Parent = LocalPlayer:WaitForChild("PlayerGui")
local NotifContainer = Instance.new("Frame", NotifUI)
NotifContainer.Name = "NotifContainer"
NotifContainer.Size = UDim2.new(0, 260, 1, -20)
NotifContainer.Position = UDim2.new(1, -20, 0, 10)
NotifContainer.AnchorPoint = Vector2.new(1, 0)
NotifContainer.BackgroundTransparency = 1
NotifContainer.ZIndex = 1000
local NotifLayout = Instance.new("UIListLayout", NotifContainer)
NotifLayout.SortOrder = Enum.SortOrder.LayoutOrder
NotifLayout.VerticalAlignment = Enum.VerticalAlignment.Bottom
NotifLayout.Padding = UDim.new(0, 10)
function punishgoatby97mzu:Notify(Data)
local TitleStr = Data.Title or "Notification"
local ContentStr = Data.Content or "Description here"
local Duration = Data.Duration or 3
local NCard = Instance.new("Frame", NotifContainer)
NCard.Size = UDim2.new(1, 0, 0, 60)
NCard.Position = UDim2.new(1, 300, 0, 0)
NCard.BackgroundTransparency = 0.15
NCard.ClipsDescendants = true
NCard.ZIndex = 1001
Instance.new("UICorner", NCard).CornerRadius = UDim.new(0, 8)
punishgoatby97mzu:ApplyThemeObj(NCard, "BackgroundColor3", "ToggleBtnBg")
local NStroke = Instance.new("UIStroke", NCard)
NStroke.Thickness = 1
NStroke.Transparency = 0.5
punishgoatby97mzu:ApplyThemeObj(NStroke, "Color", "Stroke")
local NIcon = Instance.new("ImageLabel", NCard)
NIcon.Size = UDim2.new(0, 24, 0, 24)
NIcon.Position = UDim2.new(0, 15, 0.5, -12)
NIcon.BackgroundTransparency = 1
NIcon.Image = "rbxassetid://10709771426"
NIcon.ZIndex = 1002
punishgoatby97mzu:ApplyThemeObj(NIcon, "ImageColor3", "Accent")
local NTitle = Instance.new("TextLabel", NCard)
NTitle.Size = UDim2.new(1, -55, 0, 18)
NTitle.Position = UDim2.new(0, 50, 0, 10)
NTitle.BackgroundTransparency = 1
NTitle.Text = TitleStr
NTitle.Font = Enum.Font.GothamBold
NTitle.TextSize = 13
NTitle.TextXAlignment = Enum.TextXAlignment.Left
NTitle.ZIndex = 1002
punishgoatby97mzu:ApplyThemeObj(NTitle, "TextColor3", "Text")
local NDesc = Instance.new("TextLabel", NCard)
NDesc.Size = UDim2.new(1, -55, 1, -30)
NDesc.Position = UDim2.new(0, 50, 0, 28)
NDesc.BackgroundTransparency = 1
NDesc.Text = ContentStr
NDesc.Font = Enum.Font.Gotham
NDesc.TextSize = 11
NDesc.TextWrapped = true
NDesc.TextYAlignment = Enum.TextYAlignment.Top
NDesc.TextXAlignment = Enum.TextXAlignment.Left
NDesc.ZIndex = 1002
punishgoatby97mzu:ApplyThemeObj(NDesc, "TextColor3", "TextInactive")
local NBarBg = Instance.new("Frame", NCard)
NBarBg.Size = UDim2.new(1, 0, 0, 3)
NBarBg.Position = UDim2.new(0, 0, 1, -3)
NBarBg.BorderSizePixel = 0
NBarBg.ZIndex = 1002
punishgoatby97mzu:ApplyThemeObj(NBarBg, "BackgroundColor3", "MainBg")
local NBarFill = Instance.new("Frame", NBarBg)
NBarFill.Size = UDim2.new(1, 0, 1, 0)
NBarFill.BorderSizePixel = 0
NBarFill.ZIndex = 1002
punishgoatby97mzu:ApplyThemeObj(NBarFill, "BackgroundColor3", "Accent")
TweenService:Create(
NCard,
TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
{ Position = UDim2.new(0, 0, 0, 0) }
):Play()
TweenService:Create(NBarFill, TweenInfo.new(Duration, Enum.EasingStyle.Linear),
{ Size = UDim2.new(0, 0, 1, 0) })
:Play()
task.delay(Duration, function()
local OutAnim = TweenService:Create(
NCard,
TweenInfo.new(0.5, Enum.EasingStyle.Quint,
Enum.EasingDirection.In),
{ Position = UDim2.new(1, 300, 0, 0) }
)
OutAnim:Play()
OutAnim.Completed:Wait()
NCard:Destroy()
end)
end
-- This is the "brain" that stores UI state for as long as the script is running
local UI_Session = {
Pos = UDim2.new(0.5, 0, 0.5, 0), -- Default ke tengah
Size = UDim2.new(0, 600, 0, 400), -- Default ukuran
}
function punishgoatby97mzu:CreateWindow(TitleText)
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
-- Se já existir uma instância antiga, destrói
local oldUI = PlayerGui:FindFirstChild("punishgoatUI")
if oldUI then
oldUI:Destroy()
end
local Window = { Tabs = {}, SelectCloseFuncs = {}, DropdownCloseFuncs = {}, CurrentTab
= nil }
local punishgoatUI = Instance.new("ScreenGui")
punishgoatUI.Name = "punishgoatUI"
punishgoatUI.ResetOnSpawn = false
punishgoatUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
punishgoatUI.IgnoreGuiInset = true
punishgoatUI.DisplayOrder = 99999
punishgoatUI.Parent = PlayerGui
local Main = Instance.new("Frame")
local currentSize = UDim2.new(0, 600, 0, 400)
local Camera = workspace.CurrentCamera
local Viewport = Camera and Camera.ViewportSize or Vector2.new(1000, 1000)
local scaleX = Viewport.X / 640
local scaleY = Viewport.Y / 440
local initialScale = math.clamp(math.min(scaleX, scaleY, 1), 0.38, 1)
local initialYOffset = (Viewport.Y / 2) - (400 * initialScale / 2)
local currentPos = UDim2.new(0.5, 0, 0, initialYOffset)
Main.Name = "Main"
Main.Size = UDim2.new(0, 600, 0, 400)
Main.AnchorPoint = Vector2.new(0.5, 0)
Main.Position = currentPos
Main.BackgroundTransparency = 0.02
Main.BorderSizePixel = 0
Main.ClipsDescendants = true
Main.ZIndex = 10
Main.Parent = punishgoatUI
punishgoatby97mzu:ApplyThemeObj(Main, "BackgroundColor3", "MainBg")
local MainScale = Instance.new("UIScale")
MainScale.Name = "punishgoatAutoScaler"
MainScale.Parent = Main
local function ScaleUI()
local Camera = workspace.CurrentCamera
if not Camera then
return
end
local Viewport = Camera.ViewportSize
local maxWidth = 600 + 40
local maxHeight = 400 + 40
local scaleX = Viewport.X / maxWidth
local scaleY = Viewport.Y / maxHeight
local finalScale = math.min(scaleX, scaleY, 1)
-- Clamp the minimum scale to 0.38 so it still fits on short phone screens
MainScale.Scale = math.clamp(finalScale, 0.38, 1)
end
ScaleUI()
workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(ScaleUI)
local MainCorner = Instance.new("UICorner", Main)
MainCorner.CornerRadius = UDim.new(0, 8)
local MainStroke = Instance.new("UIStroke", Main)
MainStroke.Thickness = 1
MainStroke.Transparency = 0.5
MainStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
punishgoatby97mzu:ApplyThemeObj(MainStroke, "Color", "Stroke")
local TopBar = Instance.new("Frame", Main)
TopBar.Name = "TopBar"
TopBar.Size = UDim2.new(1, 0, 0, 30)
TopBar.BackgroundTransparency = 1
TopBar.ZIndex = 50
local TopBarPadding = Instance.new("UIPadding", TopBar)
TopBarPadding.PaddingLeft = UDim.new(0, 15)
TopBarPadding.PaddingRight = UDim.new(0, 15)
local Title = Instance.new("TextLabel", TopBar)
Title.Name = "Title"
Title.Size = UDim2.new(0.5, 0, 1, 0)
Title.BackgroundTransparency = 1
Title.Text = TitleText or "punishgoat Hub | V6 God Tier"
Title.Font = Enum.Font.GothamBold
Title.TextSize = 15
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.ZIndex = 51
punishgoatby97mzu:ApplyThemeObj(Title, "TextColor3", "Text")
local dragging, dragInput, dragStart, startPos
TopBar.InputBegan:Connect(function(input)
if
input.UserInputType == Enum.UserInputType.MouseButton1
or input.UserInputType == Enum.UserInputType.Touch
then
dragging = true
dragStart = input.Position
startPos = Main.Position
input.Changed:Connect(function()
if input.UserInputState == Enum.UserInputState.End then
dragging = false
end
end)
end
end)
TopBar.InputChanged:Connect(function(input)
if
input.UserInputType == Enum.UserInputType.MouseMovement
or input.UserInputType == Enum.UserInputType.Touch
then
dragInput = input
end
end)
UserInputService.InputChanged:Connect(function(input)
if input == dragInput and dragging then
local delta = input.Position - dragStart
Main.Position =
UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X,
startPos.Y.Scale, startPos.Y.Offset + delta.Y)
currentPos = Main.Position -- 🔥 TIMPA: Simpan posisi terbaru setiap
kali UI digeser
end
end)
local ControlContainer = Instance.new("Frame", TopBar)
ControlContainer.Name = "ControlContainer"
ControlContainer.Size = UDim2.new(0.5, 0, 1, 0)
ControlContainer.AnchorPoint = Vector2.new(1, 0)
ControlContainer.Position = UDim2.new(1, 0, 0, 0)
ControlContainer.BackgroundTransparency = 1
ControlContainer.ZIndex = 51
local ControlLayout = Instance.new("UIListLayout", ControlContainer)
ControlLayout.FillDirection = Enum.FillDirection.Horizontal
ControlLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right
ControlLayout.VerticalAlignment = Enum.VerticalAlignment.Center
ControlLayout.Padding = UDim.new(0, 10)
ControlLayout.SortOrder = Enum.SortOrder.LayoutOrder
local MinimizeBtn = Instance.new("ImageButton", ControlContainer)
MinimizeBtn.Size = UDim2.new(0, 18, 0, 18)
MinimizeBtn.BackgroundTransparency = 1
MinimizeBtn.LayoutOrder = 2
MinimizeBtn.Image = "rbxassetid://10734896206"
MinimizeBtn.ZIndex = 51
punishgoatby97mzu:ApplyThemeObj(MinimizeBtn, "ImageColor3", "Text")
local CloseBtn = Instance.new("ImageButton", ControlContainer)
CloseBtn.Size = UDim2.new(0, 18, 0, 18)
CloseBtn.BackgroundTransparency = 1
CloseBtn.LayoutOrder = 4
CloseBtn.Image = "rbxassetid://10747384394"
CloseBtn.ZIndex = 51
punishgoatby97mzu:ApplyThemeObj(CloseBtn, "ImageColor3", "Text")
local function ApplyHover(btn, hoverColor)
btn.MouseEnter:Connect(function()
TweenService:Create(btn, TweenInfo.new(0.2), { ImageColor3 =
hoverColor }):Play()
end)
btn.MouseLeave:Connect(function()
local palette =
punishgoatby97mzu.Themes[punishgoatby97mzu.CurrentTheme]
TweenService:Create(btn, TweenInfo.new(0.2), { ImageColor3 =
palette.Text }):Play()
end)
end
ApplyHover(MinimizeBtn, Color3.fromRGB(250, 154, 50))
ApplyHover(CloseBtn, Color3.fromRGB(255, 54, 54))
local ProfileCard
local isMinimized = false
local preMinSize = Main.Size
local preMinPos = Main.Position
local isMinTweening = false
MinimizeBtn.MouseButton1Click:Connect(function()
if isMinTweening then return end
isMinTweening = true
isMinimized = not isMinimized
-- Toggle ProfileCard visibility (assumes the variable is named ProfileCard)
if ProfileCard then
ProfileCard.Visible = not isMinimized
end
-- Use currentSize as the target height when un-minimizing
local targetHeight = isMinimized and 30 or currentSize.Y.Offset
TweenService:Create(Main, TweenInfo.new(0.4, Enum.EasingStyle.Quint,
Enum.EasingDirection.Out), {
Size = UDim2.new(currentSize.X.Scale, currentSize.X.Offset, 0, targetHeight)
}):Play()
task.delay(0.4, function() isMinTweening = false end)
end)
local ModalOverlay = Instance.new("Frame", Main)
ModalOverlay.Size = UDim2.new(1, 0, 1, 0)
ModalOverlay.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
ModalOverlay.BackgroundTransparency = 1
ModalOverlay.Visible = false
ModalOverlay.ZIndex = 998
local ModalBox = Instance.new("Frame", ModalOverlay)
ModalBox.Size = UDim2.new(0, 300, 0, 150)
ModalBox.AnchorPoint = Vector2.new(0.5, 0.5)
ModalBox.Position = UDim2.new(0.5, 0, 0.5, 20)
ModalBox.BackgroundTransparency = 1
ModalBox.ZIndex = 999
Instance.new("UICorner", ModalBox).CornerRadius = UDim.new(0, 10)
punishgoatby97mzu:ApplyThemeObj(ModalBox, "BackgroundColor3", "MainBg")
local ModalStroke = Instance.new("UIStroke", ModalBox)
ModalStroke.Thickness = 1
ModalStroke.Transparency = 1
punishgoatby97mzu:ApplyThemeObj(ModalStroke, "Color", "Stroke")
local ModalTitle = Instance.new("TextLabel", ModalBox)
ModalTitle.Size = UDim2.new(1, 0, 0, 40)
ModalTitle.BackgroundTransparency = 1
ModalTitle.Text = "Exit punishgoat Hub?"
ModalTitle.Font = Enum.Font.GothamBold
ModalTitle.TextSize = 16
ModalTitle.TextTransparency = 1
ModalTitle.ZIndex = 999
punishgoatby97mzu:ApplyThemeObj(ModalTitle, "TextColor3", "Text")
local ModalDesc = Instance.new("TextLabel", ModalBox)
ModalDesc.Size = UDim2.new(1, -40, 0, 40)
ModalDesc.Position = UDim2.new(0, 20, 0, 40)
ModalDesc.BackgroundTransparency = 1
ModalDesc.Text = "Are you sure you want to exit? You will need to re-execute the
script."
ModalDesc.TextWrapped = true
ModalDesc.Font = Enum.Font.Gotham
ModalDesc.TextSize = 12
ModalDesc.TextTransparency = 1
ModalDesc.ZIndex = 999
punishgoatby97mzu:ApplyThemeObj(ModalDesc, "TextColor3", "TextInactive")
local CancelBtn = Instance.new("TextButton", ModalBox)
CancelBtn.Size = UDim2.new(0, 110, 0, 36)
CancelBtn.Position = UDim2.new(0, 30, 1, -50)
CancelBtn.Text = "Cancel"
CancelBtn.Font = Enum.Font.GothamMedium
CancelBtn.TextSize = 13
CancelBtn.AutoButtonColor = false
CancelBtn.BackgroundTransparency = 1
CancelBtn.TextTransparency = 1
CancelBtn.ZIndex = 999
Instance.new("UICorner", CancelBtn).CornerRadius = UDim.new(0, 6)
punishgoatby97mzu:ApplyThemeObj(CancelBtn, "BackgroundColor3",
"ToggleBgOff")
punishgoatby97mzu:ApplyThemeObj(CancelBtn, "TextColor3", "Text")
local ConfirmBtn = Instance.new("TextButton", ModalBox)
ConfirmBtn.Size = UDim2.new(0, 110, 0, 36)
ConfirmBtn.Position = UDim2.new(1, -140, 1, -50)
ConfirmBtn.Text = "Yes, Exit"
ConfirmBtn.Font = Enum.Font.GothamMedium
ConfirmBtn.TextSize = 13
ConfirmBtn.AutoButtonColor = false
ConfirmBtn.BackgroundTransparency = 1
ConfirmBtn.TextTransparency = 1
ConfirmBtn.ZIndex = 999
Instance.new("UICorner", ConfirmBtn).CornerRadius = UDim.new(0, 6)
punishgoatby97mzu:ApplyThemeObj(ConfirmBtn, "BackgroundColor3", "Accent")
ConfirmBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseBtn.MouseButton1Click:Connect(function()
ModalOverlay.Visible = true
TweenService:Create(ModalOverlay, TweenInfo.new(0.3), {
BackgroundTransparency = 0.5 }):Play()
TweenService:Create(
ModalBox,
TweenInfo.new(0.4, Enum.EasingStyle.Back,
Enum.EasingDirection.Out),
{ Position = UDim2.new(0.5, 0, 0.5, 0), BackgroundTransparency = 0 }
):Play()
TweenService:Create(ModalStroke, TweenInfo.new(0.3), { Transparency =
0.5 }):Play()
TweenService:Create(ModalTitle, TweenInfo.new(0.3), { TextTransparency =
0 }):Play()
TweenService:Create(ModalDesc, TweenInfo.new(0.3), { TextTransparency =
0 }):Play()
TweenService:Create(CancelBtn, TweenInfo.new(0.3), {
BackgroundTransparency = 0, TextTransparency = 0 }):Play()
TweenService:Create(ConfirmBtn, TweenInfo.new(0.3), {
BackgroundTransparency = 0.2, TextTransparency = 0 })
:Play()
end)
CancelBtn.MouseButton1Click:Connect(function()
TweenService:Create(ModalOverlay, TweenInfo.new(0.3), {
BackgroundTransparency = 1 }):Play()
TweenService:Create(
ModalBox,
TweenInfo.new(0.3, Enum.EasingStyle.Back,
Enum.EasingDirection.In),
{ Position = UDim2.new(0.5, 0, 0.5, 20), BackgroundTransparency = 1
}
):Play()
TweenService:Create(ModalStroke, TweenInfo.new(0.3), { Transparency = 1
}):Play()
TweenService:Create(ModalTitle, TweenInfo.new(0.3), { TextTransparency =
1 }):Play()
TweenService:Create(ModalDesc, TweenInfo.new(0.3), { TextTransparency =
1 }):Play()
TweenService:Create(CancelBtn, TweenInfo.new(0.3), {
BackgroundTransparency = 1, TextTransparency = 1 }):Play()
TweenService:Create(ConfirmBtn, TweenInfo.new(0.3), {
BackgroundTransparency = 1, TextTransparency = 1 }):Play()
task.wait(0.3)
ModalOverlay.Visible = false
end)
ConfirmBtn.MouseButton1Click:Connect(function()
TweenService:Create(
Main,
TweenInfo.new(0.3, Enum.EasingStyle.Back,
Enum.EasingDirection.In),
{ Size = UDim2.new(0, 0, 0, 0) }
):Play()
TweenService:Create(FloatingBtn, TweenInfo.new(0.3), { Size =
UDim2.new(0, 0, 0, 0) }):Play()
task.wait(0.3)
punishgoatUI:Destroy()
end)
local ResizeGrip = Instance.new("ImageButton", Main)
ResizeGrip.Size = UDim2.new(0, 20, 0, 20)
ResizeGrip.Position = UDim2.new(1, 0, 1, 0)
ResizeGrip.AnchorPoint = Vector2.new(1, 1)
ResizeGrip.BackgroundTransparency = 1
ResizeGrip.Image = "rbxassetid://83865456239149"
ResizeGrip.ZIndex = 100
local resizing, rDragStart, startSize
ResizeGrip.InputBegan:Connect(function(input)
if
input.UserInputType == Enum.UserInputType.MouseButton1
or input.UserInputType == Enum.UserInputType.Touch
then
if isMinimized or isMaximized then
return
end
resizing = true
rDragStart = input.Position
startSize = Main.Size
input.Changed:Connect(function()
if input.UserInputState == Enum.UserInputState.End then
resizing = false
end
end)
end
end)
UserInputService.InputChanged:Connect(function(input)
if
resizing
and (
input.UserInputType ==
Enum.UserInputType.MouseMovement
or input.UserInputType == Enum.UserInputType.Touch
)
then
local delta = input.Position - rDragStart
local newX = math.clamp(startSize.X.Offset + delta.X, 400, 1000)
local newY = math.clamp(startSize.Y.Offset + delta.Y, 300, 800)
Main.Size = UDim2.new(0, newX, 0, newY)
currentSize = Main.Size
end
end)
local Sidebar = Instance.new("ScrollingFrame", Main)
Sidebar.Name = "Sidebar"
Sidebar.Size = UDim2.new(0, 180, 1, -95)
Sidebar.Position = UDim2.new(0, 0, 0, 30)
Sidebar.BackgroundTransparency = 1
Sidebar.BorderSizePixel = 0
Sidebar.ScrollBarThickness = 0
Sidebar.CanvasSize = UDim2.new(0, 0, 0, 0)
Sidebar.AutomaticCanvasSize = Enum.AutomaticSize.Y
local SidebarPadding = Instance.new("UIPadding", Sidebar)
SidebarPadding.PaddingTop = UDim.new(0, 10)
SidebarPadding.PaddingBottom = UDim.new(0, 10)
SidebarPadding.PaddingLeft = UDim.new(0, 10)
SidebarPadding.PaddingRight = UDim.new(0, 10)
local SidebarLayout = Instance.new("UIListLayout", Sidebar)
SidebarLayout.SortOrder = Enum.SortOrder.LayoutOrder
SidebarLayout.Padding = UDim.new(0, 5)
local SidebarDivider = Instance.new("Frame", Main)
SidebarDivider.Name = "SidebarDivider"
SidebarDivider.Size = UDim2.new(0, 1, 1, -80)
SidebarDivider.AnchorPoint = Vector2.new(0, 0.5)
SidebarDivider.Position = UDim2.new(0, 180, 0.5, 15)
SidebarDivider.BackgroundTransparency = 0.7
SidebarDivider.BorderSizePixel = 0
punishgoatby97mzu:ApplyThemeObj(SidebarDivider, "BackgroundColor3", "Stroke")
ProfileCard = Instance.new("Frame", Main)
ProfileCard.Size = UDim2.new(0, 160, 0, 50)
ProfileCard.Position = UDim2.new(0, 10, 1, -60)
ProfileCard.BackgroundTransparency = 0.55
Instance.new("UICorner", ProfileCar
