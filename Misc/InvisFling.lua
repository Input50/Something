local Workspace = game:GetService("Workspace")
local plr = game:GetService("Players").LocalPlayer
local cam = Workspace.CurrentCamera

--------------------
-- Changeable Speeds:
speed = 20
maxspeed = 100
--------------------

lockedstate = false
spawn(function()
	local message = Instance.new("Message", workspace)
	message.Text = "Modded Invisible Fling Loaded\nPress Z to start\nPress X to respawn"
	wait(2)
	message:Destroy()
end)

local mouse = plr:GetMouse()
local groot = nil

mouse.KeyDown:connect(function(k)
	if k == "z" then
		spawn(function()
			local message = Instance.new("Message", workspace)
			message.Text = "Please Wait...\nWe are bypassing your respawn timer"
			wait(11)
			message:Destroy()
		end)

		local ch = plr.Character or plr.CharacterAdded:Wait()
		local prt = Instance.new("Model", workspace)

		local z1 =  Instance.new("Part", prt)
		z1.Name = "Torso"
		z1.CanCollide = false
		z1.Anchored = true

		local z2  = Instance.new("Part", prt)
		z2.Name = "Head"
		z2.Anchored = true
		z2.CanCollide = false

		local z3 = Instance.new("Humanoid", prt)
		z3.Name = "Humanoid"
		z1.Position = Vector3.new(0, 9999, 0)
		z2.Position = Vector3.new(0, 9991, 0)
		plr.Character = prt

		wait(5)
		plr.Character = ch
		wait(6)

		mouse = plr:GetMouse()

		local Hum = Instance.new("Humanoid")
		Hum.Parent = ch

		local HRP =  ch:WaitForChild("HumanoidRootPart")

		for i, v in pairs(ch:GetChildren()) do
			if v ~= HRP and v.Name ~= "Humanoid" then
				v:Destroy()
			end
		end
		
		cam.CameraSubject = HRP

		local se = Instance.new("Highlight", HRP)
		se.FillColor = Color3.fromRGB(255, 255, 255)
		se.FillTransparency = 0.75
		se.OutlineTransparency = 1
		se.Adornee = HRP

		game:GetService('RunService').Stepped:connect(function()
			HRP.CanCollide = false
		end)
		--[[
		game:GetService('RunService').RenderStepped:connect(function()
			HRP.CanCollide = false
		end)
		]]

		local power = 9999990

		wait(.1)
		local bambam = Instance.new("BodyThrust")
		bambam.Parent = HRP
		bambam.Force = Vector3.new(power, 0, power)
		bambam.Location = HRP.Position

		local flying = true
		local ctrl = {
			f = 0,
			b = 0,
			l = 0,
			r = 0
		}
		local lastctrl = {
			f = 0,
			b = 0,
			l = 0,
			r = 0
		}

		groot = HRP

		function Fly()
			local bg = Instance.new("BodyGyro", HRP)
			bg.P = 9e4
			bg.maxTorque = Vector3.new(0, 0, 0)
			bg.cframe = HRP.CFrame

			local bv = Instance.new("BodyVelocity", HRP)
			bv.velocity = Vector3.new(0, 0, 0)
			bv.maxForce = Vector3.new(9e9, 9e9, 9e9)

			repeat
				wait()

				if ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0 then
					speed = speed + .2
					if speed > maxspeed then
						speed = maxspeed
					end
				elseif not (ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0) and speed ~= 0 then
					speed = speed - 1
					if speed < 0 then
						speed = 0
					end
				end
				if (ctrl.l + ctrl.r) ~= 0 or (ctrl.f + ctrl.b) ~= 0 then
					bv.velocity = ((cam.CoordinateFrame.lookVector * (ctrl.f + ctrl.b)) + ((cam.CoordinateFrame * CFrame.new(ctrl.l + ctrl.r, (ctrl.f + ctrl.b) * .2, 0).p) - cam.CoordinateFrame.p)) * speed
					lastctrl = {
						f = ctrl.f,
						b = ctrl.b,
						l = ctrl.l,
						r = ctrl.r
					}
				elseif (ctrl.l + ctrl.r) == 0 and (ctrl.f + ctrl.b) == 0 and speed ~= 0 then
					bv.velocity = ((cam.CoordinateFrame.lookVector * (lastctrl.f + lastctrl.b)) + ((cam.CoordinateFrame * CFrame.new(lastctrl.l + lastctrl.r, (lastctrl.f + lastctrl.b) * .2, 0).p) - cam.CoordinateFrame.p)) * speed
				else
					bv.velocity = Vector3.new(0, 0.1, 0)
				end

			until not flying
			ctrl = {
				f = 0,
				b = 0,
				l = 0,
				r = 0
			}
			lastctrl = {
				f = 0,
				b = 0,
				l = 0,
				r = 0
			}
			speed = 0
			bg:Destroy()
			bv:Destroy()

		end
		mouse.KeyDown:connect(function(key)
			if key:lower() == "e" then
				if flying then
					flying = false
				else
					flying = true
					Fly()
				end
			elseif key:lower() == "w" then
				ctrl.f = 1
			elseif key:lower() == "s" then
				ctrl.b = -1
			elseif key:lower() == "a" then
				ctrl.l = -1
			elseif key:lower() == "d" then
				ctrl.r = 1
			end
		end)
		mouse.KeyUp:connect(function(key)
			if key:lower() == "w" then
				ctrl.f = 0
			elseif key:lower() == "s" then
				ctrl.b = 0
			elseif key:lower() == "a" then
				ctrl.l = 0
			elseif key:lower() == "d" then
				ctrl.r = 0
			elseif key:lower() == "r" then

			end
		end)
		Fly()

	elseif k == "x" then
		if lockedstate == false then

			spawn(function()
				local message = Instance.new("Message", workspace)
				message.Text = "Respawning Character..."
				wait(1)
				message:Destroy()
			end)
			
			local saved = groot.Position
			local ch = plr.Character
			local prt = Instance.new("Model", workspace)
			local z1 =  Instance.new("Part", prt)
			z1.Name = "Torso"
			z1.CanCollide = false
			z1.Anchored = true
			local z2  = Instance.new("Part", prt)
			z2.Name = "Head"
			z2.Anchored = true
			z2.CanCollide = false
			local z3 = Instance.new("Humanoid", prt)
			z3.Name = "Humanoid"
			z1.Position = Vector3.new(0, 9999, 0)
			z2.Position = Vector3.new(0, 9991, 0)
			plr.Character = prt
			wait(5)
			plr.Character = ch
			local poop = nil
			repeat
				wait()
				poop = ch:FindFirstChild("Head")
			until poop ~= nil
			wait(1)
			ch.HumanoidRootPart.CFrame = CFrame.new(saved)
			lockedstate = false
		end
	end
end)
