local set_key1 = 4
local set_key2 = 5
local off_key = 6
---gun table---
---yeah---
local recoil_table = {}
recoil_table["R301"] = {
    --vertical = {-1,1,-2,1,1,-1,0,-1,-1,-1,0,1,4,3,3,3,1,-1,-2,-2,-2,-2,-2,-2,0,1,-1,3,0},
    vertical = {-2,0,-2,1,-1    ,0,0,-2,-2,-2    ,-1,3,3,3,3    ,2,1,1,-1,-3     ,-1,-3,-2,-2,-3     ,1,-1,0},
    --horizontal = {10,10,10,8,7,1,1,1,1,1,2,5,1,1,1,1,1,0},
    horizontal = {-6,-7,-5,-6,-5    ,-3,-3,-1,-2,2    ,-3,-4,-3,-1,-1    ,1,0,-3,-3,-3    ,0,0,0,0,-1   ,-2,-2,0 },
    speed = 100,
    delay = 74,
}  
recoil_table["flatline"] = {
    --vertical = {3,0,4,4,4,4  ,-5,-8,-1,-1,-2  ,3,4,0,6,2,2,2,4,0},
    vertical = {3,0,3,2,2,2  ,-2,-5,-1,-1,-2  ,3,4,0,6,2,1,1,4,0},
    horizontal = {10,10,10,10,10,5  ,1,1,1,3,3  ,1,1,1,1,1,8,4,4,0},
    speed = 100,
    delay = 100,
}

function recoil_value(_weapon,_duration)
  local step = math.floor(_duration/10) + 1
  if step > #recoil_table[_weapon]["vertical"] then
        step = #recoil_table[_weapon]["vertical"]
  end
  local weapon_ver = recoil_table[_weapon]["vertical"][step]
  local weapon_hor = recoil_table[_weapon]["horizontal"][1]
  local weapon_interval = recoil_table[_weapon]["speed"] 
  local weapon_delay = recoil_table[_weapon]["delay"]
  return weapon_ver,weapon_hor,weapon_interval,weapon_delay
  --return recoil_table[_weapon]["vertical"][step],recoil_table[_weapon]["horizontal"][step],recoil_table[_weapon]["speed"] 
end


function keybinds(arg)
  if(arg == off_key) then
      current_weapon = "none"
  elseif (arg == set_key1) then
      current_weapon = "flatline"
  elseif (arg == set_key2) then
      current_weapon = "R301"
  end
end

function OnEvent(event, arg)
  OutputLogMessage("Event: "..event.."Arg: "..arg.."\n")
  
  if(event == "PROFILE_ACTIVATED") then
    OutputLogMessage("Lua script start~\n")
    EnablePrimaryMouseButtonEvents(true)
    current_weapon = "flatline"
    
  elseif (event == "PROFILE_DEACTIVATED") then
    ReleaseMouseButton(1)
  end
  
  
  if(event == "MOUSE_BUTTON_PRESSED") then
    keybinds(arg)
    OutputLogMessage("weapon:"..current_weapon.."\n\n")
  end
  if (IsKeyLockOn("capslock") )then
    if IsMouseButtonPressed(3) then
      repeat
        if IsMouseButtonPressed(1) then
        OutputLogMessage("This script has been running for: %d ms", GetRunningTime())
            shoot_duration = 0.0
            repeat
                ver,hor,interval,delaytime = recoil_value(current_weapon,shoot_duration)
                MoveMouseRelative(ver,hor)
                Sleep(delaytime)
                shoot_duration = shoot_duration + (interval / 10)

            until not IsMouseButtonPressed(1)
            OutputLogMessage("This script has been running for: %d ms", GetRunningTime())
        end
      until not IsMouseButtonPressed(3)
      
    end
  end
end





--[[
function float_f()
  if (IsKeyLockOn("capslock") )then
    if IsMouseButtonPressed(1) then
      --if(float_count == 1 and float_boolen == true)then
        Sleep(50)
        MoveMouseRelative(3,10)--1
        Sleep(99)
        MoveMouseRelative(0,2)--2
        Sleep(99)
        MoveMouseRelative(4,10)--3
        Sleep(99)
        MoveMouseRelative(4,10)--4
        Sleep(99)
        MoveMouseRelative(4,7)--5
        Sleep(99)
        MoveMouseRelative(4,7)--6
        Sleep(99)
        float_count = float_count + 1
    --  elseif(float_count == 2 and float_boolen == true) then
        MoveMouseRelative(-5,1)--7
        Sleep(99)
        MoveMouseRelative(-8,1)--8
        Sleep(99)
        MoveMouseRelative(-5,1)--9
        Sleep(99)
        MoveMouseRelative(-5,3)--10
        Sleep(99)
        MoveMouseRelative(-5,3)--11
        Sleep(99)
        float_count = float_count + 1
    --  elseif(float_count == 3 and float_boolen == true) then
        MoveMouseRelative(6,1)--12
        Sleep(99)
        MoveMouseRelative(6,1)--13
        Sleep(99)
        MoveMouseRelative(6,1)--14
        Sleep(99)
        MoveMouseRelative(10,1)--15
        Sleep(99)
        MoveMouseRelative(6,10)--16
        Sleep(99)
        MoveMouseRelative(6,10)--17
        Sleep(99)
        MoveMouseRelative(6,7)--18
        Sleep(99)
        MoveMouseRelative(6,7)--19
        Sleep(99)
        float_count = 0
    --  end
    end
  end
end]]

--[[repeat
              MoveMouseRelative(5,1)
              Sleep(15)
              MoveMouseRelative(-5,1)
              Sleep(15)
              --[[MoveMouseRelative(5,0) 
              Sleep(15)
              MoveMouseRelative(-5,0)
              Sleep(15)
            until not IsMouseButtonPressed(1)]]
