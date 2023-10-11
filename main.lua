local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
function script()
    local Window = Library.CreateLib("Sunrise", "LightTheme")



    local Tab = Window:NewTab("Combat")
    local Section = Tab:NewSection("Basic Stuff")
    Section:NewButton("Sprint", "Auto Sprint", function()
        function(callback)
            if callback then
                spawn(function()
                    repeat
                        task.wait()
                        if bedwars["sprintTable"].sprinting == false then
                            getmetatable(bedwars["sprintTable"])["startSprinting"](bedwars["sprintTable"])
                        end
                    until Sprint["Enabled"] == false
                end)
            end
        end, 
    end)
    Section:NewButton("AutoClicker", "Hold Attack Button to Click", function()
        Function = function(callback)
			if callback then
				table.insert(autoclicker.Connections, inputService.InputBegan:Connect(function(input, gameProcessed)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						autoclickermousedown = true
						local firstClick = tick() + 0.1
						task.spawn(function()
							repeat
								task.wait()
								if entityLibrary.isAlive then
									if not autoclicker.Enabled or not autoclickermousedown then break end
									if not isNotHoveringOverGui() then continue end
									if getOpenApps() > (bedwarsStore.equippedKit == "hannah" and 4 or 3) then continue end
									if GuiLibrary.ObjectsThatCanBeSaved["Lobby CheckToggle"].Api.Enabled then
										if bedwarsStore.matchState == 0 then continue end
									end
									if bedwarsStore.localHand.Type == "sword" then
										if bedwars.KatanaController.chargingMaid == nil then
											task.spawn(function()
												if firstClick <= tick() then
													bedwars.SwordController:swingSwordAtMouse()
												else
													firstClick = tick()
												end
											end)
											task.wait(math.max((1 / autoclickercps.GetRandomValue()), noclickdelay.Enabled and 0 or (autoclickertimed.Enabled and 0.38 or 0)))
										end
									elseif bedwarsStore.localHand.Type == "block" then 
										if autoclickerblocks.Enabled and bedwars.BlockPlacementController.blockPlacer and firstClick <= tick() then
											if (workspace:GetServerTimeNow() - bedwars.BlockCpsController.lastPlaceTimestamp) > ((1 / 12) * 0.5) then
												local mouseinfo = bedwars.BlockPlacementController.blockPlacer.clientManager:getBlockSelector():getMouseInfo(0)
												if mouseinfo then
													task.spawn(function()
														if mouseinfo.placementPosition == mouseinfo.placementPosition then
															bedwars.BlockPlacementController.blockPlacer:placeBlock(mouseinfo.placementPosition)
														end
													end)
												end
												task.wait((1 / autoclickercps.GetRandomValue()))
											end
										end
									end
								end
							until not autoclicker.Enabled or not autoclickermousedown
						end)
					end
				end))
				table.insert(autoclicker.Connections, inputService.InputEnded:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						autoclickermousedown = false
					end
				end))
			end
		end,


        Section:NewButton("Reach", "Make U Hit Farther", function()
            Function = function(callback)
                if callback then
                    bedwars.CombatConstant.RAYCAST_SWORD_CHARACTER_DISTANCE = ReachValue.Value + 2
                else
                    bedwars.CombatConstant.RAYCAST_SWORD_CHARACTER_DISTANCE = 20.0
                end
            end, 
            Section:NewButton("NoClickDelay", "L xylex mine is better", function()
                Function = function(callback)
                    if callback then
                        noclickfunc = bedwars.SwordController.isClickingTooFast
                        bedwars.SwordController.isClickingTooFast = function(self) 
                            self.lastSwing = tick()
                            return false 
                        end
                    else
                        bedwars.SwordController.isClickingTooFast = noclickfunc
                    end
                end,

local Tab = Window:NewTab("Blatant")
    local Section = Tab:NewSection("Obvious")
    Section:NewButton("Fly", "U lagback", function()
        runFunction(function()
            Function = function(callback)
                if callback then
                    if not entityLibrary.isAlive then 
                        disabledproper = true
                    end
                    if not disabledproper then 
                       
                        InfiniteFly.ToggleButton(false)
                        return 
                    end
                    table.insert(InfiniteFly.Connections, inputService.InputBegan:Connect(function(input1)
                        if InfiniteFlyVertical.Enabled and inputService:GetFocusedTextBox() == nil then
                            if input1.KeyCode == Enum.KeyCode.Space or input1.KeyCode == Enum.KeyCode.ButtonA then
                                InfiniteFlyUp = true
                            end
                            if input1.KeyCode == Enum.KeyCode.LeftShift or input1.KeyCode == Enum.KeyCode.ButtonL2 then
                                InfiniteFlyDown = true
                            end
                        end
                    end))
                    table.insert(InfiniteFly.Connections, inputService.InputEnded:Connect(function(input1)
                        if input1.KeyCode == Enum.KeyCode.Space or input1.KeyCode == Enum.KeyCode.ButtonA then
                            InfiniteFlyUp = false
                        end
                        if input1.KeyCode == Enum.KeyCode.LeftShift or input1.KeyCode == Enum.KeyCode.ButtonL2 then
                            InfiniteFlyDown = false
                        end
                    end))
                    if inputService.TouchEnabled then
                        pcall(function()
                            local jumpButton = lplr.PlayerGui.TouchGui.TouchControlFrame.JumpButton
                            table.insert(InfiniteFly.Connections, jumpButton:GetPropertyChangedSignal("ImageRectOffset"):Connect(function()
                                InfiniteFlyUp = jumpButton.ImageRectOffset.X == 146
                            end))
                            InfiniteFlyUp = jumpButton.ImageRectOffset.X == 146
                        end)
                    end
                    clonesuccess = false
                    if entityLibrary.isAlive and entityLibrary.character.Humanoid.Health > 0 and isnetworkowner(entityLibrary.character.HumanoidRootPart) then
                        cloned = lplr.Character
                        oldcloneroot = entityLibrary.character.HumanoidRootPart
                        if not lplr.Character.Parent then 
                            InfiniteFly.ToggleButton(false)
                            return
                        end
                        lplr.Character.Parent = game
                        clone = oldcloneroot:Clone()
                        clone.Parent = lplr.Character
                        oldcloneroot.Parent = gameCamera
                        bedwars.QueryUtil:setQueryIgnored(oldcloneroot, true)
                        clone.CFrame = oldcloneroot.CFrame
                        lplr.Character.PrimaryPart = clone
                        lplr.Character.Parent = workspace
                        for i,v in pairs(lplr.Character:GetDescendants()) do 
                            if v:IsA("Weld") or v:IsA("Motor6D") then 
                                if v.Part0 == oldcloneroot then v.Part0 = clone end
                                if v.Part1 == oldcloneroot then v.Part1 = clone end
                            end
                            if v:IsA("BodyVelocity") then 
                                v:Destroy()
                            end
                        end
                        for i,v in pairs(oldcloneroot:GetChildren()) do 
                            if v:IsA("BodyVelocity") then 
                                v:Destroy()
                            end
                        end
                        if hip then 
                            lplr.Character.Humanoid.HipHeight = hip
                        end
                        hip = lplr.Character.Humanoid.HipHeight
                        clonesuccess = true
                    end
                    if not clonesuccess then 
                        
                        InfiniteFly.ToggleButton(false)
                        return 
                    end
                    local goneup = false
                    RunLoops:BindToHeartbeat("InfiniteFly", function(delta) 
                        if GuiLibrary.ObjectsThatCanBeSaved["Lobby CheckToggle"].Api.Enabled then 
                            if bedwarsStore.matchState == 0 then return end
                        end
                        if entityLibrary.isAlive then
                            if isnetworkowner(oldcloneroot) then 
                                local playerMass = (entityLibrary.character.HumanoidRootPart:GetMass() - 1.4) * (delta * 100)
                                
                                local flyVelocity = entityLibrary.character.Humanoid.MoveDirection * (InfiniteFlyMode.Value == "Normal" and InfiniteFlySpeed.Value or getSpeed())
                                entityLibrary.character.HumanoidRootPart.Velocity = flyVelocity + (Vector3.new(0, playerMass + (InfiniteFlyUp and InfiniteFlyVerticalSpeed.Value or 0) + (InfiniteFlyDown and -InfiniteFlyVerticalSpeed.Value or 0), 0))
                                if InfiniteFlyMode.Value ~= "Normal" then
                                    entityLibrary.character.HumanoidRootPart.CFrame = entityLibrary.character.HumanoidRootPart.CFrame + (entityLibrary.character.Humanoid.MoveDirection * (InfiniteFlySpeed.Value - 20)) * delta
                                end
    
                                local speedCFrame = {oldcloneroot.CFrame:GetComponents()}
                                speedCFrame[1] = clone.CFrame.X
                                if speedCFrame[2] < 1000 or (not goneup) then 
                                    
                                    speedCFrame[2] = 100000
                                    goneup = true
                                end
                                speedCFrame[3] = clone.CFrame.Z
                                oldcloneroot.CFrame = CFrame.new(unpack(speedCFrame))
                                oldcloneroot.Velocity = Vector3.new(clone.Velocity.X, oldcloneroot.Velocity.Y, clone.Velocity.Z)
                            else
                                InfiniteFly.ToggleButton(false)
                            end
                        end
                    end)
                else
                    RunLoops:UnbindFromHeartbeat("InfiniteFly")
                    if clonesuccess and oldcloneroot and clone and lplr.Character.Parent == workspace and oldcloneroot.Parent ~= nil and disabledproper and cloned == lplr.Character then 
                        local rayparams = RaycastParams.new()
                        rayparams.FilterDescendantsInstances = {lplr.Character, gameCamera}
                        rayparams.RespectCanCollide = true
                        local ray = workspace:Raycast(Vector3.new(oldcloneroot.Position.X, clone.CFrame.p.Y, oldcloneroot.Position.Z), Vector3.new(0, -1000, 0), rayparams)
                        local origcf = {clone.CFrame:GetComponents()}
                        origcf[1] = oldcloneroot.Position.X
                        origcf[2] = ray and ray.Position.Y + (entityLibrary.character.Humanoid.HipHeight + (oldcloneroot.Size.Y / 2)) or clone.CFrame.p.Y
                        origcf[3] = oldcloneroot.Position.Z
                        oldcloneroot.CanCollide = true
                        bodyvelo = Instance.new("BodyVelocity")
                        bodyvelo.MaxForce = Vector3.new(0, 9e9, 0)
                        bodyvelo.Velocity = Vector3.new(0, -1, 0)
                        bodyvelo.Parent = oldcloneroot
                        oldcloneroot.Velocity = Vector3.new(clone.Velocity.X, -1, clone.Velocity.Z)
                        RunLoops:BindToHeartbeat("InfiniteFlyOff", function(dt)
                            if oldcloneroot then 
                                oldcloneroot.Velocity = Vector3.new(clone.Velocity.X, -1, clone.Velocity.Z)
                                local bruh = {clone.CFrame:GetComponents()}
                                bruh[2] = oldcloneroot.CFrame.Y
                                local newcf = CFrame.new(unpack(bruh))
                                FlyOverlap.FilterDescendantsInstances = {lplr.Character, gameCamera}
                                local allowed = true
                                for i,v in pairs(workspace:GetPartBoundsInRadius(newcf.p, 2, FlyOverlap)) do 
                                    if (v.Position.Y + (v.Size.Y / 2)) > (newcf.p.Y + 0.5) then 
                                        allowed = false
                                        break
                                    end
                                end
                                if allowed then
                                    oldcloneroot.CFrame = newcf
                                end
                            end
                        end)
                        oldcloneroot.CFrame = CFrame.new(unpack(origcf))
                        entityLibrary.character.Humanoid:ChangeState(Enum.HumanoidStateType.Landed)
                        disabledproper = false
                        if isnetworkowner(oldcloneroot) then 
                           
                            task.delay(1.5, disablefunc)
                        else
                            disablefunc()
                        end
                    end
                    InfiniteFlyUp = false
                    InfiniteFlyDown = false
                end
            end,
            Section:NewButton("KillAura", "So Blatant", function()
                Function = function(callback)
                    if callback then
                        if KillauraRangeCirclePart then KillauraRangeCirclePart.Parent = gameCamera end
                        RunLoops:BindToHeartbeat("Killaura", function()
                            for i,v in pairs(KillauraBoxes) do 
                                if v.Adornee then
                                    local onex, oney, onez = v.Adornee.CFrame:ToEulerAnglesXYZ() 
                                    v.CFrame = CFrame.new() * CFrame.Angles(-onex, -oney, -onez)
                                end
                            end
                            if entityLibrary.isAlive then 
                                if KillauraRangeCirclePart then
                                    KillauraRangeCirclePart.CFrame = entityLibrary.character.HumanoidRootPart.CFrame - Vector3.new(0, entityLibrary.character.Humanoid.HipHeight + (entityLibrary.character.HumanoidRootPart.Size.Y / 2) - 0.3, 0)
                                end
                                if KillauraFakeAngle.Enabled then 
                                    local Neck = entityLibrary.character.Head:FindFirstChild("Neck")
                                    local LowerTorso = entityLibrary.character.HumanoidRootPart.Parent and entityLibrary.character.HumanoidRootPart.Parent:FindFirstChild("LowerTorso")
                                    local RootC0 = LowerTorso and LowerTorso:FindFirstChild("Root")
                                    if Neck and RootC0 then
                                        if not OriginalNeckC0 then OriginalNeckC0 = Neck.C0.p end
                                        if not OriginalRootC0 then OriginalRootC0 = RootC0.C0.p end
                                        if OriginalRootC0 then
                                            if targetedplayer ~= nil then
                                                local targetPos = targetedplayer.RootPart.Position + Vector3.new(0, targetedplayer.Humanoid.HipHeight + (targetedplayer.RootPart.Size.Y / 2), 0)
                                                local lookCFrame = (CFrame.new(Vector3.zero, (Root.CFrame):VectorToObjectSpace((Vector3.new(targetPos.X, targetPos.Y, targetPos.Z) - entityLibrary.character.Head.Position).Unit)))
                                                Neck.C0 = CFrame.new(OriginalNeckC0) * CFrame.Angles(lookCFrame.LookVector.Unit.y, 0, 0)
                                                RootC0.C0 = (CFrame.new(Vector3.zero, (Root.CFrame):VectorToObjectSpace((Vector3.new(targetPos.X, Root.Position.Y, targetPos.Z) - Root.Position).Unit))) + OriginalRootC0
                                            else
                                                Neck.C0 = CFrame.new(OriginalNeckC0)
                                                RootC0.C0 = CFrame.new(OriginalRootC0)
                                            end
                                        end
                                    end
                                end
                            end
                        end)
                        task.spawn(function()
                            repeat
                                local attackedplayers = {}
                                KillauraNearTarget = false
                                sunriseTargetInfo.Targets.Killaura = nil
                                if entityLibrary.isAlive and (not KillauraButtonDown.Enabled or inputService:IsMouseButtonPressed(0)) then
                                    local plrs = AllNearPosition(KillauraRange.Value, 100, {Prediction = KillauraPrediction.Enabled})
                                    if #plrs > 0 then
                                        local tool = lplr.Character:FindFirstChildWhichIsA("Tool")
                                        local touch = findTouchInterest(tool)
                                        if tool and touch then
                                            for i,v in pairs(plrs) do
                                                if math.acos(entityLibrary.character.HumanoidRootPart.CFrame.lookVector:Dot((v.RootPart.Position - entityLibrary.character.HumanoidRootPart.Position).Unit)) >= (math.rad(KillauraAngle.Value) / 2) then continue end
                                                KillauraNearTarget = true
                                                if KillauraTarget.Enabled then
                                                    table.insert(attackedplayers, v)
                                                end
                                                sunriseTargetInfo.Targets.Killaura = v
                                                if not ({WhitelistFunctions:GetWhitelist(v.Player)})[2] then
                                                    continue
                                                end
                                                KillauraNearTarget = true
                                                if KillauraPrediction.Enabled then
                                                    if (entityLibrary.LocalPosition - v.RootPart.Position).Magnitude > KillauraRange.Value then
                                                        continue
                                                    end
                                                end
                                                if KillauraSwingTick <= tick() then
                                                    tool:Activate()
                                                    KillauraSwingTick = tick() + (1 / KillauraCPS.GetRandomValue())
                                                end
                                                if KillauraMethod.Value == "Bypass" then 
                                                    attackIgnore.FilterDescendantsInstances = {v.Character}
                                                    local parts = workspace:GetPartBoundsInBox(v.RootPart.CFrame, v.Character:GetExtentsSize(), attackIgnore)
                                                    for i,v2 in pairs(parts) do 
                                                        firetouchinterest(touch.Parent, v2, 1)
                                                        firetouchinterest(touch.Parent, v2, 0)
                                                    end
                                                elseif KillauraMethod.Value == "Normal" then
                                                    for i,v2 in pairs(v.Character:GetChildren()) do 
                                                        if v2:IsA("BasePart") then
                                                            firetouchinterest(touch.Parent, v2, 1)
                                                            firetouchinterest(touch.Parent, v2, 0)
                                                        end
                                                    end
                                                else
                                                    firetouchinterest(touch.Parent, v.RootPart, 1)
                                                    firetouchinterest(touch.Parent, v.RootPart, 0)
                                                end
                                            end
                                        end
                                    end
                                end
                                for i,v in pairs(KillauraBoxes) do 
                                    local attacked = attackedplayers[i]
                                    v.Adornee = attacked and attacked.RootPart
                                end
                                task.wait()
                            until not Killaura.Enabled
                        end)
                    else
                        RunLoops:UnbindFromHeartbeat("Killaura") 
                        KillauraNearTarget = false
                         sunriseTargetInfo.Targets.Killaura = nil
                        for i,v in pairs(KillauraBoxes) do v.Adornee = nil end
                        if KillauraRangeCirclePart then KillauraRangeCirclePart.Parent = nil end
                    end
                end,
                Section:NewButton("Infinite Jump", "Jump Till You Anti-Cheat", function()
                    function(callback)
                        if callback then
                           infJumpConnection = inputService.InputBegan:Connect(function(input)
                           if input.KeyCode == Enum.KeyCode.Space and not inputService:GetFocusedTextBox() then
                              if InfHold.Enabled and entityLibrary.isAlive then
                                 repeat
                                    lplr.Character:WaitForChild("Humanoid"):ChangeState("Jumping")
                                    task.wait()
                                 until not inputService:IsKeyDown(Enum.KeyCode.Space) or not infjump.Enabled or not InfHold.Enabled or inputService:GetFocusedTextBox()
                              else
                                 if entityLibrary.isAlive then
                                    lplr.Character:WaitForChild("Humanoid"):ChangeState("Jumping")
                                 end
                              end
                           end
                           end)
                        else
                           if infJumpConnection then
                              infJumpConnection:Disconnect()
                           end
                        end
                     end
                     })
                     Section:NewButton("Disabler", "Hold Scythe For It To Work", function()
                        function(callback)
                            if callback then 
                                task.spawn(function()
                                    repeat
                                        task.wait(0.03)
                                        local item = getItemNear("scythe")
                                        if item and lplr.Character.HandInvItem.Value == item.tool then 
                                            bedwars.ClientHandler:Get("ScytheDash"):SendToServer({direction = Vector3.new(9e9, 9e9, 9e9)})
                                        end
                                    until (not Disabler.Enabled)
                                end)
                            end
                        end,
                    })
                end)
                Section:NewButton("BedTP", "TP To Nearest Bed", function()
                function(callback)
                    if callback then
                        lplr.Character:FindFirstChildOfClass("Humanoid"):ChangeState(Enum.HumanoidStateType.Dead)
                        lplr.CharacterAdded:Connect(function()
                            wait(0.3) 
                            tweenToNearestBed()
                        end)
                        hasTeleported = false
                        BedTp["ToggleButton"](false)
                    end
                end,
                
            })
        end)
        Section:NewButton("LongJump", "Most OP after KillAura", function()
        function(callback)
			if callback then
				if entityLibrary.isAlive and entityLibrary.character.Humanoid.FloorMaterial ~= Enum.Material.Air then
					entityLibrary.character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
				end
				RunLoops:BindToHeartbeat("LongJump", function() 
					if entityLibrary.isAlive then
						if (entityLibrary.character.Humanoid:GetState() == Enum.HumanoidStateType.Freefall or entityLibrary.character.Humanoid:GetState() == Enum.HumanoidStateType.Jumping) and entityLibrary.character.Humanoid.MoveDirection ~= Vector3.zero then
							local velo = entityLibrary.character.Humanoid.MoveDirection * LongJumpBoost.Value
							entityLibrary.character.HumanoidRootPart.Velocity = Vector3.new(velo.X, entityLibrary.character.HumanoidRootPart.Velocity.Y, velo.Z)
						end
						local check = entityLibrary.character.Humanoid.FloorMaterial ~= Enum.Material.Air
						if LongJumpChange ~= check then 
							if check then LongJump.ToggleButton(true) end
							LongJumpChange = check
						end
					end
				end)
                Section:NewButton("PlayerTP", "Teleports To Nearest Player", function()
                    function(callback)
                        if callback then
                            lplr.Character:FindFirstChildOfClass("Humanoid"):ChangeState(Enum.HumanoidStateType.Dead)
                            lplr.CharacterAdded:Connect(function()
                                wait(0.3)
                                tweenToNearestPlayer()
                            end)
                            hasTeleported = false
                            PlayerTp["ToggleButton"](false)
                        end
                    end,
                })
            end)

            local Tab = Window:NewTab("Render")
    local Section = Tab:NewSection("Texture Packs")
    Section:NewButton("TexturePack1", "1st Texture Packs", function()
        local Players = game:GetService("Players")
				local ReplicatedStorage = game:GetService("ReplicatedStorage")
				local Workspace = game:GetService("Workspace")
				local objs = game:GetObjects("rbxassetid://14654171957")
				local import = objs[1]
				import.Parent = ReplicatedStorage
				local index = {
					{
						name = "wood_sword",
						offset = CFrame.Angles(math.rad(0), math.rad(-89), math.rad(-90)),
						model = import:WaitForChild("Wood_Sword"),
					},	
					{
						name = "stone_sword",
						offset = CFrame.Angles(math.rad(0), math.rad(-89), math.rad(-90)),
						model = import:WaitForChild("Stone_Sword"),
					},
					{
						name = "iron_sword",
						offset = CFrame.Angles(math.rad(0), math.rad(-89), math.rad(-90)),
						model = import:WaitForChild("Iron_Sword"),
					},
					{
						name = "diamond_sword",
						offset = CFrame.Angles(math.rad(0), math.rad(-89), math.rad(-90)),
						model = import:WaitForChild("Diamond_Sword"),
					},
					{
						name = "rageblade",
						offset = CFrame.Angles(math.rad(0), math.rad(-89), math.rad(-90)),
						model = import:WaitForChild("Rageblade"),
					},
					{
						name = "emerald_sword",
						offset = CFrame.Angles(math.rad(0), math.rad(-89), math.rad(-90)),
						model = import:WaitForChild("Emerald_Sword"),
					},
					{
						name = "wood_scythe",
						offset = CFrame.Angles(math.rad(0),math.rad(89),math.rad(-90)),
						model = import:WaitForChild("Wood_Scythe"),
					},
					{
						name = "stone_scythe",
						offset = CFrame.Angles(math.rad(0),math.rad(89),math.rad(-90)),
						model = import:WaitForChild("Stone_Scythe"),
					},
					{
						name = "iron_scythe",
						offset = CFrame.Angles(math.rad(0),math.rad(89),math.rad(-90)),
						model = import:WaitForChild("Iron_Scythe"),
					},
					{
						name = "diamond_scythe",
						offset = CFrame.Angles(math.rad(0),math.rad(89),math.rad(-90)),
						model = import:WaitForChild("Diamond_Scythe"),
					},
					{
						name = "wood_pickaxe",
						offset = CFrame.Angles(math.rad(0), math.rad(-10), math.rad(-95)),
						model = import:WaitForChild("Wood_Pickaxe"),
					},	
					{
						name = "stone_pickaxe",
						offset = CFrame.Angles(math.rad(0), math.rad(-10), math.rad(-95)),
						model = import:WaitForChild("Stone_Pickaxe"),
					},	
					{
						name = "iron_pickaxe",
						offset = CFrame.Angles(math.rad(0), math.rad(-10), math.rad(-95)),
						model = import:WaitForChild("Iron_Pickaxe"),
					},	
					{
						name = "diamond_pickaxe",
						offset = CFrame.Angles(math.rad(0), math.rad(-89), math.rad(-95)),
						model = import:WaitForChild("Diamond_Pickaxe"),
					},
					{
						name = "diamond",
						offset = CFrame.Angles(math.rad(0), math.rad(-90), math.rad(90)),
						model = import:WaitForChild("Diamond"),
					},
					{
						name = "iron",
						offset = CFrame.Angles(math.rad(0), math.rad(-90), math.rad(90)),
						model = import:WaitForChild("Iron"),
					},
					{
						name = "emerald",
						offset = CFrame.Angles(math.rad(0), math.rad(-90), math.rad(90)),
						model = import:WaitForChild("Emerald"),
					},
}
				local func = Workspace.Camera.Viewmodel.ChildAdded:Connect(function(tool)	
					if not tool:IsA("Accessory") then return end	
					for _, v in ipairs(index) do	
						if v.name == tool.Name then		
							for _, part in ipairs(tool:GetDescendants()) do
								if part:IsA("BasePart") or part:IsA("MeshPart") or part:IsA("UnionOperation") then				
									part.Transparency = 1
								end			
							end		
							local model = v.model:Clone()
							model.CFrame = tool:WaitForChild("Handle").CFrame * v.offset
							model.CFrame *= CFrame.Angles(math.rad(0), math.rad(-50), math.rad(0))
							model.Parent = tool			
							local weld = Instance.new("WeldConstraint", model)
							weld.Part0 = model
							weld.Part1 = tool:WaitForChild("Handle")			
							local tool2 = Players.LocalPlayer.Character:WaitForChild(tool.Name)			
							for _, part in ipairs(tool2:GetDescendants()) do
								if part:IsA("BasePart") or part:IsA("MeshPart") or part:IsA("UnionOperation") then				
									part.Transparency = 1				
								end			
							end			
							local model2 = v.model:Clone()
							model2.Anchored = false
							model2.CFrame = tool2:WaitForChild("Handle").CFrame * v.offset
							model2.CFrame *= CFrame.Angles(math.rad(0), math.rad(-50), math.rad(0))
							if v.name:match("rageblade") then
								model2.CFrame *= CFrame.new(0.7, 0, -1)                           
							elseif v.name:match("sword") or v.name:match("blade") then
								model2.CFrame *= CFrame.new(.6, 0, -1.1) - Vector3.new(0, 0, -.3)
							elseif v.name:match("axe") and not v.name:match("pickaxe") and v.name:match("diamond") then
								model2.CFrame *= CFrame.new(.08, 0, -1.1) - Vector3.new(0, 0, -1.1)
							elseif v.name:match("axe") and not v.name:match("pickaxe") and not v.name:match("diamond") then
								model2.CFrame *= CFrame.new(-.2, 0, -2.4) + Vector3.new(0, 0, 2.12)
							elseif v.name:match("scythe") then
								model2.CFrame *= CFrame.new(-1.15, 0.2, -2.1)
							elseif v.name:match("iron") then
								model2.CFrame *= CFrame.new(0, -.24, 0)
							elseif v.name:match("gold") then
								model2.CFrame *= CFrame.new(0, .03, 0)
							elseif v.name:match("diamond") then
								model2.CFrame *= CFrame.new(0, .027, 0)
							elseif v.name:match("emerald") then
								model2.CFrame *= CFrame.new(0, .001, 0)
							elseif v.name:match("telepearl") then
								model2.CFrame *= CFrame.new(.1, 0, .1)
							elseif v.name:match("bow") and not v.name:match("crossbow") then
								model2.CFrame *= CFrame.new(-.29, .1, -.2)
							elseif v.name:match("wood_crossbow") and not v.name:match("tactical_crossbow") then
								model2.CFrame *= CFrame.new(-.6, 0, 0)
							elseif v.name:match("tactical_crossbow") and not v.name:match("wood_crossbow") then
								model2.CFrame *= CFrame.new(-.5, 0, -1.2)
							else
								model2.CFrame *= CFrame.new(.2, 0, -.2)
							end
							model2.Parent = tool2
							local weld2 = Instance.new("WeldConstraint", model)
							weld2.Part0 = model2
							weld2.Part1 = tool2:WaitForChild("Handle")
						end
					end
				end)          
			end
        end
	})
end)
Section:NewButton("TexturePack2", "2nd Texture Pack", function()
    function() 
        task.spawn(function()
            local Players = game:GetService("Players")
            local ReplicatedStorage = game:GetService("ReplicatedStorage")
            local Workspace = game:GetService("Workspace")
            local objs = game:GetObjects("rbxassetid://14161283331")
            local import = objs[1]
            import.Parent = ReplicatedStorage
            local index = {
                {
                    name = "wood_sword",
                    offset = CFrame.Angles(math.rad(0), math.rad(-89), math.rad(-90)),
                    model = import:WaitForChild("Wood_Sword"),
                },	
                {
                    name = "stone_sword",
                    offset = CFrame.Angles(math.rad(0), math.rad(-89), math.rad(-90)),
                    model = import:WaitForChild("Stone_Sword"),
                },
                {
                    name = "iron_sword",
                    offset = CFrame.Angles(math.rad(0), math.rad(-89), math.rad(-90)),
                    model = import:WaitForChild("Iron_Sword"),
                },
                {
                    name = "diamond_sword",
                    offset = CFrame.Angles(math.rad(0), math.rad(-89), math.rad(-90)),
                    model = import:WaitForChild("Diamond_Sword"),
                },
                {
                    name = "emerald_sword",
                    offset = CFrame.Angles(math.rad(0), math.rad(-89), math.rad(-90)),
                    model = import:WaitForChild("Emerald_Sword"),
                },
                {
                    name = "rageblade",
                    offset = CFrame.Angles(math.rad(0),math.rad(-100),math.rad(90)),
                    model = import:WaitForChild("Rageblade"),
                }, 
                {
                    name = "wood_pickaxe",
                    offset = CFrame.Angles(math.rad(0), math.rad(-180), math.rad(-95)),
                    model = import:WaitForChild("Wood_Pickaxe"),
                },
                {
                    name = "stone_pickaxe",
                    offset = CFrame.Angles(math.rad(0), math.rad(-180), math.rad(-95)),
                    model = import:WaitForChild("Stone_Pickaxe"),
                },
                {
                    name = "iron_pickaxe",
                    offset = CFrame.Angles(math.rad(0), math.rad(-18033), math.rad(-95)),
                    model = import:WaitForChild("Iron_Pickaxe"),
                },
                {
                    name = "diamond_pickaxe",
                    offset = CFrame.Angles(math.rad(0), math.rad(80), math.rad(-95)),
                    model = import:WaitForChild("Diamond_Pickaxe"),
                },	
                {
                    name = "wood_axe",
                    offset = CFrame.Angles(math.rad(0), math.rad(-10), math.rad(-95)),
                    model = import:WaitForChild("Wood_Axe"),
                },	
                {
                    name = "stone_axe",
                    offset = CFrame.Angles(math.rad(0), math.rad(-10), math.rad(-95)),
                    model = import:WaitForChild("Stone_Axe"),
                },	
                {
                    name = "iron_axe",
                    offset = CFrame.Angles(math.rad(0), math.rad(-10), math.rad(-95)),
                    model = import:WaitForChild("Iron_Axe"),
                },	
                {
                    name = "diamond_axe",
                    offset = CFrame.Angles(math.rad(0), math.rad(-89), math.rad(-95)),
                    model = import:WaitForChild("Diamond_Axe"),
                },	
                {
                    name = "fireball",
                    offset = CFrame.Angles(math.rad(0), math.rad(-90), math.rad(90)),
                    model = import:WaitForChild("Fireball"),
                },	
                {
                    name = "telepearl",
                    offset = CFrame.Angles(math.rad(0), math.rad(-90), math.rad(90)),
                    model = import:WaitForChild("Telepearl"),
                },
                {
                    name = "diamond",
                    offset = CFrame.Angles(math.rad(0), math.rad(-90), math.rad(90)),
                    model = import:WaitForChild("Diamond"),
                },
                {
                    name = "iron",
                    offset = CFrame.Angles(math.rad(0), math.rad(-90), math.rad(90)),
                    model = import:WaitForChild("Iron"),
                },
                {
                    name = "gold",
                    offset = CFrame.Angles(math.rad(0), math.rad(-90), math.rad(90)),
                    model = import:WaitForChild("Gold"),
                },
                {
                    name = "emerald",
                    offset = CFrame.Angles(math.rad(0), math.rad(-90), math.rad(90)),
                    model = import:WaitForChild("Emerald"),
                },
                {
                    name = "wood_bow",
                    offset = CFrame.Angles(math.rad(0), math.rad(0), math.rad(90)),
                    model = import:WaitForChild("Bow"),
                },
                {
                    name = "wood_crossbow",
                    offset = CFrame.Angles(math.rad(0), math.rad(0), math.rad(90)),
                    model = import:WaitForChild("Bow"),
                },
                {
                    name = "tactical_crossbow",
                    offset = CFrame.Angles(math.rad(0), math.rad(180), math.rad(-90)),
                    model = import:WaitForChild("Bow"),
                },
            }
            local func = Workspace.Camera.Viewmodel.ChildAdded:Connect(function(tool)	
                if not tool:IsA("Accessory") then return end	
                for _, v in ipairs(index) do	
                    if v.name == tool.Name then		
                        for _, part in ipairs(tool:GetDescendants()) do
                            if part:IsA("BasePart") or part:IsA("MeshPart") or part:IsA("UnionOperation") then				
                                part.Transparency = 1
                            end			
                        end		
                        local model = v.model:Clone()
                        model.CFrame = tool:WaitForChild("Handle").CFrame * v.offset
                        model.CFrame *= CFrame.Angles(math.rad(0), math.rad(-50), math.rad(0))
                        model.Parent = tool			
                        local weld = Instance.new("WeldConstraint", model)
                        weld.Part0 = model
                        weld.Part1 = tool:WaitForChild("Handle")			
                        local tool2 = Players.LocalPlayer.Character:WaitForChild(tool.Name)			
                        for _, part in ipairs(tool2:GetDescendants()) do
                            if part:IsA("BasePart") or part:IsA("MeshPart") or part:IsA("UnionOperation") then				
                                part.Transparency = 1				
                            end			
                        end			
                        local model2 = v.model:Clone()
                        model2.Anchored = false
                        model2.CFrame = tool2:WaitForChild("Handle").CFrame * v.offset
                        model2.CFrame *= CFrame.Angles(math.rad(0), math.rad(-50), math.rad(0))
                        if v.name:match("rageblade") then
                            model2.CFrame *= CFrame.new(0.7, 0, -1)                           
                        elseif v.name:match("sword") or v.name:match("blade") then
                            model2.CFrame *= CFrame.new(.6, 0, -1.1) - Vector3.new(0, 0, -.3)
                        elseif v.name:match("axe") and not v.name:match("pickaxe") and v.name:match("diamond") then
                            model2.CFrame *= CFrame.new(.08, 0, -1.1) - Vector3.new(0, 0, -1.1)
                        elseif v.name:match("axe") and not v.name:match("pickaxe") and not v.name:match("diamond") then
                            model2.CFrame *= CFrame.new(-.2, 0, -2.4) + Vector3.new(0, 0, 2.12)
                        elseif v.name:match("iron") then
                            model2.CFrame *= CFrame.new(0, -.24, 0)
                        elseif v.name:match("gold") then
                            model2.CFrame *= CFrame.new(0, .03, 0)
                        elseif v.name:match("diamond") then
                            model2.CFrame *= CFrame.new(0, .027, 0)
                        elseif v.name:match("emerald") then
                            model2.CFrame *= CFrame.new(0, .001, 0)
                        elseif v.name:match("telepearl") then
                            model2.CFrame *= CFrame.new(.1, 0, .1)
                        elseif v.name:match("fireball") then
                            model2.CFrame *= CFrame.new(.28, .1, 0)
                        elseif v.name:match("bow") and not v.name:match("crossbow") then
                            model2.CFrame *= CFrame.new(-.29, .1, -.2)
                        elseif v.name:match("wood_crossbow") and not v.name:match("tactical_crossbow") then
                            model2.CFrame *= CFrame.new(-.6, 0, 0)
                        elseif v.name:match("tactical_crossbow") and not v.name:match("wood_crossbow") then
                            model2.CFrame *= CFrame.new(-.5, 0, -1.2)
                        else
                            model2.CFrame *= CFrame.new(.2, 0, -.2)
                        end
                        model2.Parent = tool2
                        local weld2 = Instance.new("WeldConstraint", model)
                        weld2.Part0 = model2
                        weld2.Part1 = tool2:WaitForChild("Handle")
                    end
                end
            end)            
        end)
    end,

    Section:NewButton("DemonSlayerTexturePack", "TANJIRO ON TOP", function()
        function() 
			task.spawn(function()
				local Players = game:GetService("Players")
				local ReplicatedStorage = game:GetService("ReplicatedStorage")
				local Workspace = game:GetService("Workspace")
				local objs = game:GetObjects("rbxassetid://14241215869")
				local import = objs[1]
				import.Parent = ReplicatedStorage
				local index = {
					{
						name = "wood_sword",
						offset = CFrame.Angles(math.rad(0), math.rad(-89), math.rad(-90)),
						model = import:WaitForChild("Wood_Sword"),
					},	
					{
						name = "stone_sword",
						offset = CFrame.Angles(math.rad(0), math.rad(-89), math.rad(-90)),
						model = import:WaitForChild("Stone_Sword"),
					},
					{
						name = "iron_sword",
						offset = CFrame.Angles(math.rad(0), math.rad(-89), math.rad(-90)),
						model = import:WaitForChild("Iron_Sword"),
					},
					{
						name = "diamond_sword",
						offset = CFrame.Angles(math.rad(0), math.rad(-89), math.rad(-90)),
						model = import:WaitForChild("Diamond_Sword"),
					},
					{
						name = "emerald_sword",
						offset = CFrame.Angles(math.rad(0), math.rad(-89), math.rad(-90)),
						model = import:WaitForChild("Emerald_Sword"),
					},
					{
						name = "wood_pickaxe",
						offset = CFrame.Angles(math.rad(0), math.rad(-180), math.rad(-95)),
						model = import:WaitForChild("Wood_Pickaxe"),
					},
					{
						name = "stone_pickaxe",
						offset = CFrame.Angles(math.rad(0), math.rad(-180), math.rad(-95)),
						model = import:WaitForChild("Stone_Pickaxe"),
					},
					{
						name = "iron_pickaxe",
						offset = CFrame.Angles(math.rad(0), math.rad(-180), math.rad(-95)),
						model = import:WaitForChild("Iron_Pickaxe"),
					},
					{
						name = "diamond_pickaxe",
						offset = CFrame.Angles(math.rad(0), math.rad(90), math.rad(-95)),
						model = import:WaitForChild("Diamond_Pickaxe"),
					},	
					{
						name = "fireball",
						offset = CFrame.Angles(math.rad(0), math.rad(-90), math.rad(90)),
						model = import:WaitForChild("Fireball"),
					},	
					{
						name = "telepearl",
						offset = CFrame.Angles(math.rad(0), math.rad(-90), math.rad(90)),
						model = import:WaitForChild("Telepearl"),
					},
					{
						name = "diamond",
						offset = CFrame.Angles(math.rad(0), math.rad(-90), math.rad(-90)),
						model = import:WaitForChild("Diamond"),
					},
					{
						name = "iron",
						offset = CFrame.Angles(math.rad(0), math.rad(-90), math.rad(90)),
						model = import:WaitForChild("Iron"),
					},
					{
						name = "gold",
						offset = CFrame.Angles(math.rad(0), math.rad(-90), math.rad(90)),
						model = import:WaitForChild("Gold"),
					},
					{
						name = "emerald",
						offset = CFrame.Angles(math.rad(0), math.rad(-90), math.rad(-90)),
						model = import:WaitForChild("Emerald"),
					},
					{
						name = "wood_bow",
						offset = CFrame.Angles(math.rad(0), math.rad(0), math.rad(90)),
						model = import:WaitForChild("Bow"),
					},
					{
						name = "wood_crossbow",
						offset = CFrame.Angles(math.rad(0), math.rad(0), math.rad(90)),
						model = import:WaitForChild("Bow"),
					},
					{
						name = "tactical_crossbow",
						offset = CFrame.Angles(math.rad(0), math.rad(180), math.rad(-90)),
						model = import:WaitForChild("Bow"),
					},
					{
						name = "wood_dao",
						offset = CFrame.Angles(math.rad(0), math.rad(89), math.rad(-90)),
						model = import:WaitForChild("Wood_Sword"),
					},
					{
						name = "stone_dao",
						offset = CFrame.Angles(math.rad(0), math.rad(89), math.rad(-90)),
						model = import:WaitForChild("Stone_Sword"),
					},
					{
						name = "iron_dao",
						offset = CFrame.Angles(math.rad(0), math.rad(89), math.rad(-90)),
						model = import:WaitForChild("Iron_Sword"),
					},
					{
						name = "diamond_dao",
						offset = CFrame.Angles(math.rad(0), math.rad(89), math.rad(-90)),
						model = import:WaitForChild("Diamond_Sword"),
					},
				}
				local func = Workspace.Camera.Viewmodel.ChildAdded:Connect(function(tool)	
					if not tool:IsA("Accessory") then return end	
					for _, v in ipairs(index) do	
						if v.name == tool.Name then		
							for _, part in ipairs(tool:GetDescendants()) do
								if part:IsA("BasePart") or part:IsA("MeshPart") or part:IsA("UnionOperation") then				
									part.Transparency = 1
								end			
							end		
							local model = v.model:Clone()
							model.CFrame = tool:WaitForChild("Handle").CFrame * v.offset
							model.CFrame *= CFrame.Angles(math.rad(0), math.rad(-50), math.rad(0))
							model.Parent = tool			
							local weld = Instance.new("WeldConstraint", model)
							weld.Part0 = model
							weld.Part1 = tool:WaitForChild("Handle")			
							local tool2 = Players.LocalPlayer.Character:WaitForChild(tool.Name)			
							for _, part in ipairs(tool2:GetDescendants()) do
								if part:IsA("BasePart") or part:IsA("MeshPart") or part:IsA("UnionOperation") then				
									part.Transparency = 1				
								end			
							end			
							local model2 = v.model:Clone()
							model2.Anchored = false
							model2.CFrame = tool2:WaitForChild("Handle").CFrame * v.offset
							model2.CFrame *= CFrame.Angles(math.rad(0), math.rad(-50), math.rad(0))
							if v.name:match("rageblade") then
								model2.CFrame *= CFrame.new(0.7, 0, -.7)                           
							elseif v.name:match("sword") or v.name:match("blade") then
								model2.CFrame *= CFrame.new(.2, 0, -.8)
							elseif v.name:match("dao") then
								model2.CFrame *= CFrame.new(.7, 0, -1.3)
							elseif v.name:match("axe") and not v.name:match("pickaxe") and v.name:match("diamond") then
								model2.CFrame *= CFrame.new(.08, 0, -1.1) - Vector3.new(0, 0, -1.1)
							elseif v.name:match("axe") and not v.name:match("pickaxe") and not v.name:match("diamond") then
								model2.CFrame *= CFrame.new(-.2, 0, -2.4) + Vector3.new(0, 0, 2.12)
							elseif v.name:match("diamond_pickaxe") then
								model2.CFrame *= CFrame.new(.2, 0, -.26)
							elseif v.name:match("iron") and not v.name:match("iron_pickaxe") then
								model2.CFrame *= CFrame.new(0, -.24, 0)
							elseif v.name:match("gold") then
								model2.CFrame *= CFrame.new(0, .03, 0)
							elseif v.name:match("diamond") or v.name:match("emerald") then
								model2.CFrame *= CFrame.new(0, -.03, 0)
							elseif v.name:match("telepearl") then
								model2.CFrame *= CFrame.new(.1, 0, .1)
							elseif v.name:match("fireball") then
								model2.CFrame *= CFrame.new(.28, .1, 0)
							elseif v.name:match("bow") and not v.name:match("crossbow") then
								model2.CFrame *= CFrame.new(-.2, .1, -.05)
							elseif v.name:match("wood_crossbow") and not v.name:match("tactical_crossbow") then
								model2.CFrame *= CFrame.new(-.5, 0, .05)
							elseif v.name:match("tactical_crossbow") and not v.name:match("wood_crossbow") then
								model2.CFrame *= CFrame.new(-.35, 0, -1.2)
							else
								model2.CFrame *= CFrame.new(.0, 0, -.06)
							end
							model2.Parent = tool2
							local weld2 = Instance.new("WeldConstraint", model)
							weld2.Part0 = model2
							weld2.Part1 = tool2:WaitForChild("Handle")
						end
					end
				end)
			end)
		end,

        local Section = Tab:NewSection("Other Stuff")
        Section:NewButton("DamageIndicators", "Funny Indicators", function()
local Messages = {"Davi Da Skid", "Best KillAura", "Buy Sunrise", "Sunrise On Top", "EZ!!", "Knock!", "Clapped!", "NoLifeSweat", "L Bozo", "Stupid", "Lunar On Bottom", "Dumbahh", "vxpe on bottom",  "Sunrise Better"}
local old
local FunnyIndicator = {Enabled = false}

Function = function(Callback)
	FunnyIndicator.Enabled = Callback
	if FunnyIndicator.Enabled then
		old = debug.getupvalue(bedwars.DamageIndicator, 10)["Create"]
		debug.setupvalue(bedwars.DamageIndicator, 10, {
			Create = function(self, obj, ...)
				spawn(function()
					pcall(function()
						obj.Parent.Text = Messages[math.random(1, #Messages)]
						obj.Parent.TextColor3 = Color3.fromHSV(tick() % 10 / 10, 2, 2)
					end)
				end)
				return game:GetService("TweenService"):Create(obj, ...)
			end
		})
	else
		debug.setupvalue(bedwars.DamageIndicator, 10, {
			Create = old
		})
		old = nil
	end
end
})



Section:NewButton("CustomHealthBar", "Rainbow", function()
    function(callback)
        if callback then 
            spawn(function()
                pcall(function()
                    local tweenservice = game:GetService("TweenService")
                    local playerGui = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
                    local hotbar
                    local hotbar1
                    local hotbarHealthbarContainer
                    local healthbarProgressWrapper
                    local healthbar
                    local speed = 5
                    local hue = 0
                    repeat
                        if not healthbar or not healthbar.Parent then
                            print("Waiting for hotbar...")
                            hotbar = playerGui:WaitForChild("hotbar")
                            print("Finished waiting for hotbar. Waiting for hotbar1...")
                            hotbar1 = hotbar:WaitForChild("1")
                            print("Finished waiting for hotbar1. Waiting for hotbarHealthbarContainer...")
                            hotbarHealthbarContainer = hotbar1:WaitForChild("HotbarHealthbarContainer")
                            print("Finished waiting for hotbarHealthbarContainer. Waiting for healthbarProgressWrapper...")
                            healthbarProgressWrapper = hotbarHealthbarContainer:WaitForChild("HealthbarProgressWrapper")
                            print("Finished waiting for healthbarProgressWrapper. Waiting for healthbar...")
                            healthbar = healthbarProgressWrapper:WaitForChild("1")
                            print("Finished waiting. Running script...")
                        end
                        hue = (hue + speed/360) % 1
                        local color = Color3.fromHSV(hue, 1, 1)
                        local tween = tweenservice:Create(healthbar, TweenInfo.new(speed/360), {BackgroundColor3 = color})
                        tween:Play()
                        wait(speed/360)
                    until not CustomModule.Enabled
                end)
            end)
        end
    end
})
end)


local Tab = Window:NewTab("Utility")
local Section = Tab:NewSection("Main")
Section:NewButton("AutoBank", "Saves Stuff For You", function()

local AutoBank = {Enabled = false}
local AutoBankRange = {Value = 20}
local AutoBankApple = {Enabled = false}
local AutoBankBalloon = {Enabled = false}
local AutoBankTransmitted, AutoBankTransmittedType = false, false
local autobankoldapple
local autobankoldballoon
local autobankui

local function refreshbank()
    if autobankui then
        local echest = replicatedStorageService.Inventories:FindFirstChild(lplr.Name.."_personal")
        for i,v in pairs(autobankui:GetChildren()) do 
            if echest:FindFirstChild(v.Name) then 
                v.Amount.Text = echest[v.Name]:GetAttribute("Amount")
            else
                v.Amount.Text = ""
            end
        end
    end
end


    
    Function = function(callback)
        if callback then
            autobankui = Instance.new("Frame")
            autobankui.Size = UDim2.new(0, 240, 0, 40)
            autobankui.AnchorPoint = Vector2.new(0.5, 0)
            autobankui.Position = UDim2.new(0.5, 0, 0, -240)
            autobankui.Visible = AutoBankUIToggle.Enabled
            task.spawn(function()
                repeat
                    task.wait()
                    if autobankui then 
                        local hotbar = lplr.PlayerGui:FindFirstChild("hotbar")
                        if hotbar then 
                            local healthbar = hotbar["1"]:FindFirstChild("HotbarHealthbarContainer")
                            if healthbar then 
                                autobankui.Position = UDim2.new(0.5, 0, 0, healthbar.AbsolutePosition.Y - 50)
                            end
                        end
                    else
                        break
                    end
                until (not AutoBank.Enabled)
            end)
            autobankui.BackgroundTransparency = 1
            autobankui.Parent = GuiLibrary.MainGui
            local emerald = Instance.new("ImageLabel")
            emerald.Image = bedwars.getIcon({itemType = "emerald"}, true)
            emerald.Size = UDim2.new(0, 40, 0, 40)
            emerald.Name = "emerald"
            emerald.Position = UDim2.new(0, 120, 0, 0)
            emerald.BackgroundTransparency = 1
            emerald.Parent = autobankui
            local emeraldtext = Instance.new("TextLabel")
            emeraldtext.TextSize = 20
            emeraldtext.BackgroundTransparency = 1
            emeraldtext.Size = UDim2.new(1, 0, 1, 0)
            emeraldtext.Font = Enum.Font.SourceSans
            emeraldtext.TextStrokeTransparency = 0.3
            emeraldtext.Name = "Amount"
            emeraldtext.Text = ""
            emeraldtext.TextColor3 = Color3.new(1, 1, 1)
            emeraldtext.Parent = emerald
            local diamond = emerald:Clone()
            diamond.Image = bedwars.getIcon({itemType = "diamond"}, true)
            diamond.Position = UDim2.new(0, 80, 0, 0)
            diamond.Name = "diamond"
            diamond.Parent = autobankui
            local gold = emerald:Clone()
            gold.Image = bedwars.getIcon({itemType = "gold"}, true)
            gold.Position = UDim2.new(0, 40, 0, 0)
            gold.Name = "gold"
            gold.Parent = autobankui
            local iron = emerald:Clone()
            iron.Image = bedwars.getIcon({itemType = "iron"}, true)
            iron.Position = UDim2.new(0, 0, 0, 0)
            iron.Name = "iron"
            iron.Parent = autobankui
            local apple = emerald:Clone()
            apple.Image = bedwars.getIcon({itemType = "apple"}, true)
            apple.Position = UDim2.new(0, 160, 0, 0)
            apple.Name = "apple"
            apple.Parent = autobankui
            local balloon = emerald:Clone()
            balloon.Image = bedwars.getIcon({itemType = "balloon"}, true)
            balloon.Position = UDim2.new(0, 200, 0, 0)
            balloon.Name = "balloon"
            balloon.Parent = autobankui
            local echest = replicatedStorageService.Inventories:FindFirstChild(lplr.Name.."_personal")
            if entityLibrary.isAlive and echest then
                task.spawn(function()
                    local chestitems = bedwarsStore.localInventory.inventory.items
                    for i3,v3 in pairs(chestitems) do
                        if (v3.itemType == "emerald" or v3.itemType == "iron" or v3.itemType == "diamond" or v3.itemType == "gold" or (v3.itemType == "apple" and AutoBankApple.Enabled) or (v3.itemType == "balloon" and AutoBankBalloon.Enabled)) then
                            bedwars.ClientHandler:GetNamespace("Inventory"):Get("ChestGiveItem"):CallServer(echest, v3.tool)
                            refreshbank()
                        end
                    end
                end)
            else
                task.spawn(function()
                    refreshbank()
                end)
            end
            table.insert(AutoBank.Connections, replicatedStorageService.Inventories.DescendantAdded:Connect(function(p3)
                if p3.Parent.Name == lplr.Name then
                    if echest == nil then 
                        echest = replicatedStorageService.Inventories:FindFirstChild(lplr.Name.."_personal")
                    end	
                    if not echest then return end
                    if p3.Name == "apple" and AutoBankApple.Enabled then 
                        if autobankapple then return end
                    elseif p3.Name == "balloon" and AutoBankBalloon.Enabled then 
                        if autobankballoon then sunrise.Events.AutoBankBalloon:Fire() return end
                    elseif (p3.Name == "emerald" or p3.Name == "iron" or p3.Name == "diamond" or p3.Name == "gold") then
                        if not ((not AutoBankTransmitted) or (AutoBankTransmittedType and p3.Name ~= "diamond")) then return end
                    else
                        return
                    end
                    bedwars.ClientHandler:GetNamespace("Inventory"):Get("ChestGiveItem"):CallServer(echest, p3)
                    refreshbank()
                end
            end))
            task.spawn(function()
                repeat
                    task.wait()
                    local found, npctype = nearNPC(AutoBankRange.Value)
                    if echest == nil then 
                        echest = replicatedStorageService.Inventories:FindFirstChild(lplr.Name.."_personal")
                    end
                    if autobankballoon then 
                        local chestitems = echest and echest:GetChildren() or {}
                        if #chestitems > 0 then
                            for i3,v3 in pairs(chestitems) do
                                if v3:IsA("Accessory") and v3.Name == "balloon" then
                                    if (not getItem("balloon")) then
                                        task.spawn(function()
                                            bedwars.ClientHandler:GetNamespace("Inventory"):Get("ChestGetItem"):CallServer(echest, v3)
                                            refreshbank()
                                        end)
                                    end
                                end
                            end
                        end
                    end
                    if autobankballoon ~= autobankoldballoon and AutoBankBalloon.Enabled then 
                        if entityLibrary.isAlive then
                            if not autobankballoon then
                                local chestitems = bedwarsStore.localInventory.inventory.items
                                if #chestitems > 0 then
                                    for i3,v3 in pairs(chestitems) do
                                        if v3 and v3.itemType == "balloon" then
                                            task.spawn(function()
                                                bedwars.ClientHandler:GetNamespace("Inventory"):Get("ChestGiveItem"):CallServer(echest, v3.tool)
                                                refreshbank()
                                            end)
                                        end
                                    end
                                end
                            end
                        end
                        autobankoldballoon = autobankballoon
                    end
                    if autobankapple then 
                        local chestitems = echest and echest:GetChildren() or {}
                        if #chestitems > 0 then
                            for i3,v3 in pairs(chestitems) do
                                if v3:IsA("Accessory") and v3.Name == "apple" then
                                    if (not getItem("apple")) then
                                        task.spawn(function()
                                            bedwars.ClientHandler:GetNamespace("Inventory"):Get("ChestGetItem"):CallServer(echest, v3)
                                            refreshbank()
                                        end)
                                    end
                                end
                            end
                        end
                    end
                    if (autobankapple ~= autobankoldapple) and AutoBankApple.Enabled then 
                        if entityLibrary.isAlive then
                            if not autobankapple then
                                local chestitems = bedwarsStore.localInventory.inventory.items
                                if #chestitems > 0 then
                                    for i3,v3 in pairs(chestitems) do
                                        if v3 and v3.itemType == "apple" then
                                            task.spawn(function()
                                                bedwars.ClientHandler:GetNamespace("Inventory"):Get("ChestGiveItem"):CallServer(echest, v3.tool)
                                                refreshbank()
                                            end)
                                        end
                                    end
                                end
                            end
                        end
                        autobankoldapple = autobankapple
                    end
                    if found ~= AutoBankTransmitted or npctype ~= AutoBankTransmittedType then
                        AutoBankTransmitted, AutoBankTransmittedType = found, npctype
                        if entityLibrary.isAlive then
                            local chestitems = bedwarsStore.localInventory.inventory.items
                            if #chestitems > 0 then
                                for i3,v3 in pairs(chestitems) do
                                    if v3 and (v3.itemType == "emerald" or v3.itemType == "iron" or v3.itemType == "diamond" or v3.itemType == "gold") then
                                        if (not AutoBankTransmitted) or (AutoBankTransmittedType and v3.Name ~= "diamond") then 
                                            task.spawn(function()
                                                pcall(function()
                                                    bedwars.ClientHandler:GetNamespace("Inventory"):Get("ChestGiveItem"):CallServer(echest, v3.tool)
                                                end)
                                                refreshbank()
                                            end)
                                        end
                                    end
                                end
                            end
                        end
                    end
                    if found then 
                        local chestitems = echest and echest:GetChildren() or {}
                        if #chestitems > 0 then
                            for i3,v3 in pairs(chestitems) do
                                if v3:IsA("Accessory") and ((npctype == false and (v3.Name == "emerald" or v3.Name == "iron" or v3.Name == "gold")) or v3.Name == "diamond") then
                                    task.spawn(function()
                                        pcall(function()
                                            bedwars.ClientHandler:GetNamespace("Inventory"):Get("ChestGetItem"):CallServer(echest, v3)
                                        end)
                                        refreshbank()
                                    end)
                                end
                            end
                        end
                    end
                until (not AutoBank.Enabled)
            end)
        else
            if autobankui then
                autobankui:Destroy()
                autobankui = nil
            end
            local echest = replicatedStorageService.Inventories:FindFirstChild(lplr.Name.."_personal")
            local chestitems = echest and echest:GetChildren() or {}
            if #chestitems > 0 then
                for i3,v3 in pairs(chestitems) do
                    if v3:IsA("Accessory") and (v3.Name == "emerald" or v3.Name == "iron" or v3.Name == "diamond" or v3.Name == "apple" or v3.Name == "balloon") then
                        task.spawn(function()
                            pcall(function()
                                bedwars.ClientHandler:GetNamespace("Inventory"):Get("ChestGetItem"):CallServer(echest, v3)
                            end)
                            refreshbank()
                        end)
                    end
                end
            end
        end
    end
})



Section:NewButton("AutoConsume", "Heals and consumes thing for you", function()
    function(callback)
        if callback then
            table.insert(AutoConsume.Connections, sunriseEvents.InventoryAmountChanged.Event:Connect(AutoConsumeFunc))
            table.insert(AutoConsume.Connections, sunriseEvents.AttributeChanged.Event:Connect(function(changed)
                if changed:find("Shield") or changed:find("Health") or changed:find("speed") then 
                    AutoConsumeFunc()
                end
            end))
            AutoConsumeFunc()
        end
    end,
    Section:NewButton("AutoToxic", "If u enable u have higher chance of getting banned", function()
    function(callback)
        if callback then 
            table.insert(AutoToxic.Connections, sunriseEvents.BedwarsBedBreak.Event:Connect(function(bedTable)
                if AutoToxicBedDestroyed.Enabled and bedTable.brokenBedTeam.id == lplr:GetAttribute("Team") then
                    local custommsg = #AutoToxicPhrases6.ObjectList > 0 and AutoToxicPhrases6.ObjectList[math.random(1, #AutoToxicPhrases6.ObjectList)] or "i dont nedd a bed <name> | sunrise on top"
                    if custommsg then
                        custommsg = custommsg:gsub("<name>", (bedTable.player.DisplayName or bedTable.player.Name))
                    end
                    textChatService.ChatInputBarConfiguration.TargetTextChannel:SendAsync(custommsg)
                elseif AutoToxicBedBreak.Enabled and bedTable.player.UserId == lplr.UserId then
                    local custommsg = #AutoToxicPhrases7.ObjectList > 0 and AutoToxicPhrases7.ObjectList[math.random(1, #AutoToxicPhrases7.ObjectList)] or "easy bed <teamname> | sunrise on top"
                    if custommsg then
                        local team = bedwars.QueueMeta[bedwarsStore.queueType].teams[tonumber(bedTable.brokenBedTeam.id)]
                        local teamname = team and team.displayName:lower() or "white"
                        custommsg = custommsg:gsub("<teamname>", teamname)
                    end
                    textChatService.ChatInputBarConfiguration.TargetTextChannel:SendAsync(custommsg)
                end
            end))
            table.insert(AutoToxic.Connections,  sunriseEvents.EntityDeathEvent.Event:Connect(function(deathTable)
                if deathTable.finalKill then
                    local killer = playersService:GetPlayerFromCharacter(deathTable.fromEntity)
                    local killed = playersService:GetPlayerFromCharacter(deathTable.entityInstance)
                    if not killed or not killer then return end
                    if killed == lplr then 
                        if (not leavesaid) and killer ~= lplr and AutoToxicDeath.Enabled then
                            leavesaid = true
                            local custommsg = #AutoToxicPhrases3.ObjectList > 0 and AutoToxicPhrases3.ObjectList[math.random(1, #AutoToxicPhrases3.ObjectList)] or "U all skids thats why i dided <name> | sunrise on top"
                            if custommsg then
                                custommsg = custommsg:gsub("<name>", (killer.DisplayName or killer.Name))
                            end
                            textChatService.ChatInputBarConfiguration.TargetTextChannel:SendAsync(custommsg)
                        end
                    else
                        if killer == lplr and AutoToxicFinalKill.Enabled then 
                            local custommsg = #AutoToxicPhrases2.ObjectList > 0 and AutoToxicPhrases2.ObjectList[math.random(1, #AutoToxicPhrases2.ObjectList)] or "L bozo <name> | sunrise on top"
                            if custommsg == lastsaid then
                                custommsg = #AutoToxicPhrases2.ObjectList > 0 and AutoToxicPhrases2.ObjectList[math.random(1, #AutoToxicPhrases2.ObjectList)] or "L bozo <name> | sunrise on top"
                            else
                                lastsaid = custommsg
                            end
                            if custommsg then
                                custommsg = custommsg:gsub("<name>", (killed.DisplayName or killed.Name))
                            end
                            textChatService.ChatInputBarConfiguration.TargetTextChannel:SendAsync(custommsg)
                        end
                    end
                end
            end))
            table.insert(AutoToxic.Connections, sunriseEvents.MatchEndEvent.Event:Connect(function(winstuff)
                local myTeam = bedwars.ClientStoreHandler:getState().Game.myTeam
                if myTeam and myTeam.id == winstuff.winningTeamId or lplr.Neutral then
                    if AutoToxicGG.Enabled then
                        textChatService.ChatInputBarConfiguration.TargetTextChannel:SendAsync("gg")
                        if shared.ggfunction then
                            shared.ggfunction()
                        end
                    end
                    if AutoToxicWin.Enabled then
                        textChatService.ChatInputBarConfiguration.TargetTextChannel:SendAsync(#AutoToxicPhrases.ObjectList > 0 and AutoToxicPhrases.ObjectList[math.random(1, #AutoToxicPhrases.ObjectList)] or "EZ L TRASH KIDS | vxpe on top")
                    end
                end
            end))
            table.insert(AutoToxic.Connections, sunriseEvents.LagbackEvent.Event:Connect(function(plr)
                if AutoToxicLagback.Enabled then
                    local custommsg = #AutoToxicPhrases8.ObjectList > 0 and AutoToxicPhrases8.ObjectList[math.random(1, #AutoToxicPhrases8.ObjectList)]
                    if custommsg then
                        custommsg = custommsg:gsub("<name>", (plr.DisplayName or plr.Name))
                    end
                    local msg = custommsg or "Imagine lagbacking L "..(plr.DisplayName or plr.Name).." | vxpe on top"
                    textChatService.ChatInputBarConfiguration.TargetTextChannel:SendAsync(msg)
                end
            end))
            table.insert(AutoToxic.Connections, textChatService.MessageReceived:Connect(function(tab)
                if AutoToxicRespond.Enabled then
                    local plr = playersService:GetPlayerByUserId(tab.TextSource.UserId)
                    local args = tab.Text:split(" ")
                    if plr and plr ~= lplr and not alreadyreported[plr] then
                        local reportreason, reportedmatch = findreport(tab.Text)
                        if reportreason then 
                            alreadyreported[plr] = true
                            local custommsg = #AutoToxicPhrases4.ObjectList > 0 and AutoToxicPhrases4.ObjectList[math.random(1, #AutoToxicPhrases4.ObjectList)]
                            if custommsg then
                                custommsg = custommsg:gsub("<name>", (plr.DisplayName or plr.Name))
                            end
                            local msg = custommsg or "I don't care about the fact that I'm hacking, I care about you dying in a block game. L "..(plr.DisplayName or plr.Name).." | vxpe on top"
                            textChatService.ChatInputBarConfiguration.TargetTextChannel:SendAsync(msg)
                        end
                    end
                end
            end))
        end
    end


local Tab = Window:NewTab("World")
local Section = Tab:NewSection("World")
Section:NewButton("Anti Void", "Makes u unvoidable", function()
    function(callback) 
        if callback then
            local antivoidpart = Instance.new("Part", Workspace)
            antivoidpart.Name = "AntiVoid"
            antivoidpart.Size = Vector3.new(2100, 0.5, 2000)
            antivoidpart.Position = Vector3.new(160.5, 25, 247.5)
            antivoidpart.Transparency = 0.4
            antivoidpart.Anchored = true
            antivoidpart.Touched:connect(function(dumbcocks)
                if dumbcocks.Parent:WaitForChild("Humanoid") and dumbcocks.Parent.Name == lplr.Name then
                    game.Players.LocalPlayer.Character.Humanoid:ChangeState("Jumping")
                    wait(0.2)
                    game.Players.LocalPlayer.Character.Humanoid:ChangeState("Jumping")
                    wait(0.2)
                    game.Players.LocalPlayer.Character.Humanoid:ChangeState("Jumping")
                end
            end)
        end
    end,
    Default = false,
    Section:NewButton("AntiBan", "Leaves if staff joins", function()
        function(callback)
            if callback then
				repeat task.wait() until game:IsLoaded()
                local groupId = 5774246
                local roleId = 121
                local function checkUserRole(player)
                    if player:IsInGroup(groupId) and player:GetRankInGroup(groupId) == roleId then
                        
						wait(2)
                        bedwars.ClientHandler:Get("TeleportToLobby"):SendToServer()
                    end
                end
                local function checkAllUsersRoles()
                    for _, player in pairs(game.Players:GetPlayers()) do
                        checkUserRole(player)
                    end
                end
                checkAllUsersRoles()
            end
        end
    })
end)

Section:NewButton("Nuker", "Auto Break BED", function()
    local Nuker = {Enabled = false}
	local nukerrange = {Value = 1}
	local nukereflfects = {Enabled = false}
	local nukeranimation = {Enabled = false}
	local nukernofly = {Enabled = false}
	local nukerlegit = {Enabled = false}
	local nukerown = {Enabled = false}
    local nukerluckyblock = {Enabled = false}
	local nukerironore = {Enabled = false}
    local nukerbeds = {Enabled = false}
	local nukercustom = {RefreshValues = function() end, ObjectList = {}}
    local luckyblocktable = {}

	
		  function(callback)
            if callback then
				for i,v in pairs(bedwarsStore.blocks) do
					if table.find(nukercustom.ObjectList, v.Name) or (nukerluckyblock.Enabled and v.Name:find("lucky")) or (nukerironore.Enabled and v.Name == "iron_ore") then
						table.insert(luckyblocktable, v)
					end
				end
				table.insert(Nuker.Connections, collectionService:GetInstanceAddedSignal("block"):Connect(function(v)
                    if table.find(nukercustom.ObjectList, v.Name) or (nukerluckyblock.Enabled and v.Name:find("lucky")) or (nukerironore.Enabled and v.Name == "iron_ore") then
                        table.insert(luckyblocktable, v)
                    end
                end))
                table.insert(Nuker.Connections, collectionService:GetInstanceRemovedSignal("block"):Connect(function(v)
                    if table.find(nukercustom.ObjectList, v.Name) or (nukerluckyblock.Enabled and v.Name:find("lucky")) or (nukerironore.Enabled and v.Name == "iron_ore") then
                        table.remove(luckyblocktable, table.find(luckyblocktable, v))
                    end
                end))
                task.spawn(function()
                    repeat
						if (not nukernofly.Enabled or not GuiLibrary.ObjectsThatCanBeSaved.FlyOptionsButton.Api.Enabled) then
							local broke = not entityLibrary.isAlive
							local tool = (not nukerlegit.Enabled) and {Name = "wood_axe"} or bedwarsStore.localHand.tool
							if nukerbeds.Enabled then
								for i, obj in pairs(collectionService:GetTagged("bed")) do
									if broke then break end
									if obj.Parent ~= nil then
										if obj:GetAttribute("BedShieldEndTime") then 
											if obj:GetAttribute("BedShieldEndTime") > workspace:GetServerTimeNow() then continue end
										end
										if ((entityLibrary.LocalPosition or entityLibrary.character.HumanoidRootPart.Position) - obj.Position).magnitude <= nukerrange.Value then
											if tool and bedwars.ItemTable[tool.Name].breakBlock and bedwars.BlockController:isBlockBreakable({blockPosition = obj.Position / 3}, lplr) then
												local res, amount = getBestBreakSide(obj.Position)
												local res2, amount2 = getBestBreakSide(obj.Position + Vector3.new(0, 0, 3))
												broke = true
												bedwars.breakBlock((amount < amount2 and obj.Position or obj.Position + Vector3.new(0, 0, 3)), nukereffects.Enabled, (amount < amount2 and res or res2), false, nukeranimation.Enabled)
												break
											end
										end
									end
								end
							end
							broke = broke and not entityLibrary.isAlive
							for i, obj in pairs(luckyblocktable) do
								if broke then break end
								if entityLibrary.isAlive then
									if obj and obj.Parent ~= nil then
										if ((entityLibrary.LocalPosition or entityLibrary.character.HumanoidRootPart.Position) - obj.Position).magnitude <= nukerrange.Value and (nukerown.Enabled or obj:GetAttribute("PlacedByUserId") ~= lplr.UserId) then
											if tool and bedwars.ItemTable[tool.Name].breakBlock and bedwars.BlockController:isBlockBreakable({blockPosition = obj.Position / 3}, lplr) then
												bedwars.breakBlock(obj.Position, nukereffects.Enabled, getBestBreakSide(obj.Position), true, nukeranimation.Enabled)
												break
											end
										end
									end
								end
							end
						end
						task.wait()
                    until (not Nuker.Enabled)
                end)
            else
                luckyblocktable = {}
            end
		end,
    })



