if not game.Loaded then
    game.Loaded:Wait()
end

wait(5)
local plr = game:GetService("Players").LocalPlayer

wait(0.5)
loadstring(game:HttpGet(("https://raw.githubusercontent.com/Input50/AntiCheatBypass/master/Noclip.lua"),true))()


plr.CharacterAdded:Connect(function()
wait(0.75)
	local REP = plr.Character:WaitForChild("HumanoidRootPart")
	loadstring(game:HttpGet(("https://raw.githubusercontent.com/Input50/AntiCheatBypass/master/Noclip.lua"),true))()
end)