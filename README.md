## Just a note for my-self
___
# btn list:
```lua
  local ui = loadstring(game:HttpGet("https://raw.githubusercontent.com/HoangHienXScripts/Modules/refs/heads/main/btns_list.lua"))()
  -- add_button also return the btn --
  ui.add_button("Name", function() print("hi") end)
```
___
# console log:
```lua
  local rc = loadstring(game:HttpGet("https://raw.githubusercontent.com/HoangHienXScripts/Modules/refs/heads/alt/console_log.lua"))()
  -- rc.read return string or table based on arg 2
  -- rc.update update things
  local data = rc.read("Path Name", 0)
  local out = rc.update("Path Name", {})
```
