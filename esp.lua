local ws, plrs, rs
ws = game:GetService("Workspace")
plrs = game:GetService("Players")
rs = game:GetService("RunService")

local plr, cmr, drw, boxes
plr = plrs.LocalPlayer
cmr = ws.CurrentCamera
drw = Drawing.new
boxes = setmetatable({}, {
  __mode = "kv"
})

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

rs.PostSimulation:Connect(function()
  for user, box in boxes do
    local char = user.Character
    if char then
      local root = char:FindFirstChild("HumanoidRootPart")
      if root then
        local scr_pos, on_scr = cmr:WorldToViewportPoint(root.Position)
        if on_scr then
          local new_size, new_pos = Vector2.new(40, 50) * (100 / scr_pos.Z), Vector2.new(scr_pos.X - (new_size.X / 2), scr_pos.Y - (new_size.Y / 2))
          box.Visible = true
          box.Size = new_size
          box.Position = new_pos
        else
          box.Visible = false
        end
      else
        box.Visible = false
      end
    else
      box.Visible = false
    end
  end
end)

plrs.PlayerAdded:Connect(create_box)
plrs.PlayerRemoving:Connect(remove_box)
for _, user in next, plrs:GetPlayers() do
  if user and user ~= plr then
    create_box(user)
  end
end print("[ESP]: Enabled!")
