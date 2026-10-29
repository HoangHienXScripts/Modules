-- Esp using Drawing.new --
local ws, plrs, rs
ws = game:GetService("Workspace")
plrs = game:GetService("Players")
rs = game:GetService("RunService")

local plr, cmr, drw, mdl, boxes, settings
plr = plrs.LocalPlayer
cmr = ws.CurrentCamera
drw = Drawing.new
mdl = {}
boxes = {}
settings = {
  size = {x = 20, y = 30},
  color = {0, 255, 255}
}

function create_box(t)
  local box = drw("Square")
  box.Color = Color3.new(1, 1, 1)
  box.Visible = false
  boxes[t] = box
end

function remove_box(t)
  local box = boxes[t]
  if box then
    box:Remove()
  end
end

mdl.cons = {}
mdl.esp = function(state)
  if state and type(state) == "string" then
    if state:lower():match("enable") then
      table.insert(mdl.cons, rs.PostSimulation:Connect(function()
        for user, box in boxes do local char = user.Character
          if char then local root = char:FindFirstChild("HumanoidRootPart")
            if root then local scr_pos, on_scr = cmr:WorldToViewportPoint(root.Position)
              if on_scr then local new_size = Vector2.new(settings.size.x, settings.size.y) * (100 / scr_pos.Z)
                local new_pos = Vector2.new(scr_pos.X - (new_size.X / 2), scr_pos.Y - (new_size.Y / 2))
                box.Visible = true
                box.Color = Color3.fromRGB(table.unpack(settings.color))
                box.Size = new_size
                box.Position = new_pos
              else box.Visible = false
              end
            else box.Visible = false
            end
          else box.Visible = false
          end
        end
      end)) return "Enabled"
    elseif state:lower():match("disable") then
      for _, box in boxes do box.Visible = false end
      if #mdl.cons > 0 then for i = 1, #mdl.cons do if mdl.cons[i] then mdl.cons[i]:Disconnect() mdl.cons[i] = nil end end end
      return "Disabled"
    else
      return "ARG1: Enable or Disable"
    end
  end
end

plrs.PlayerAdded:Connect(create_box)
plrs.PlayerRemoving:Connect(remove_box)
for _, user in next, plrs:GetPlayers() do
  if user and user ~= plr then
    create_box(user)
  end
end print("[Esp Module: Loaded...]")

return mdl, settings
