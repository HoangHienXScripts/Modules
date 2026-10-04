function srv(n) return game:GetService(n) end
-- Idk --
local ws, plrs, reps
ws = srv"Workspace"
plrs = srv"Players"
reps = srv"ReplicatedStorage"

local plr, vars, mdl
plr = plrs.LocalPlayer
vars, mdl = {
  rsn = 0
}, {}

mdl.rcv_char = function(t) return t and t.Character end
mdl.rcv_child = function(t) return t:GetChildren() end
mdl.rcv_desce = function(t) return t:GetDescendants() end
mdl.rcv_plrs = function() return plrs:GetPlayers() end
mdl.rcv_hrp = function(t) return t and mdl.rcv_char(t) and t.Character:FindFirstChild"HumanoidRootPart" end
mdl.rcv_hmoid = function(t) return t and mdl.rcv_char(t) and t.Character:FindFirstChildOfClass"Humanoid" end
mdl.is_alive = function(t) return t and mdl.rcv_hmoid(t) and t.Character.Humanoid.Health > 0 end
mdl.is_sit = function(t) return t and mdl.rcv_hmoid(t) and t.Character.Humanoid.Sit end
mdl.is_jump = function(t) return t and mdl.rcv_hmoid(t) and t.Character.Humanoid.Jump end
mdl.rcv_plr_fullname = function(t)
  for _, usr in next, mdl.rcv_plrs() do
    if usr.Name:lower():sub(1, #t) == t or usr.DisplayName:lower():sub(1, #t) == t then
      return usr.Name
    end
  end
end

mdl.set_ws = function(v)
  local hmoid = mdl.rcv_hmoid(plr)
  if hmoid then hmoid.WalkSpeed = v end
end

return mdl
