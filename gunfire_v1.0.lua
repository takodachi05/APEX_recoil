--data=dofile[[D:\a.lua]]
local set_key1 = 4
local set_key2 = 5
local off_key = 6
local mouse_sensitivity = 1.7
local ads = 1.0
---gun table---
---yeah---
local recoil_table = {}
recoil_table["R301"] = {
    vertical = {0,-6,
                -1,2,
                -4,-4,
                1,1,
                -1,-1,
                0,1,
                0,-1,
                -2,-3,
                -2,-2,
                -3,-4,--10
                -1,-1,
                2,2,
                2,2,--
                3,3,--
                3,3,--
                3,3,
                2,3, 
                -----------18
                1,0,
                -1,0,
                -----------20
                -2,-3,
                -3,-2,
                -3,-3,
                -2,-2,
                -3,-2,
                -----------25
                -2,-3,
                0,-1,
                1,1,
                -----------28
                0},
                
                
    horizontal = {6,5,
                  6,6,
                  4,5,
                  6,5,
                  5,3,--5
                  2,2,
                  2,2,
                  1,0,
                  2,1,
                  -2,-1,--10
                  2,1,
                  3,3,
                  3,3,
                  2,-1,
                  -1,1,--15
                  -1,-1,
                  -1,0,
                  ----------18
                  2,1,
                  2,1,
                  -----------20
                  1,1,
                  1,-1,
                  1,-1,
                  1,-1,
                  1,-1,
                  -----------25
                  1,-1,
                  1,-1,
                  1,1,
                  -----------28
                  
                  
                  0},

    delay = {74, 148, 222, 296, 370, 444, 519, 593, 667, 741, 815, 889, 963, 1037, 1111, 1185, 1259, 1333, 
             1407, 1481, 1556, 1630, 1704, 1778, 1852, 1926, 2000,9998},

}  
recoil_table["flatline"] = {
    vertical = {3,4,
                1,0,
                5,5,
                4,3,
                2,1,
                -1,1,
                -3,-3,--SHOT 8
                -4,-4, 
                -2,-2,--200
                -2,-2,
                -4,1,
                4,3,
                6,5,
                4,3,
                6,5,
                2,2,
                -1,1,
                0,1,
                4,3, 
                
                3,3,--打完20執行這行
                2,1,
                -1,1,
                -3,-3,
                -2,-3,
                
                -5,-4,
                -4,-4,
                -4,-5,
                
                -1,-1,
                -2,-2,
                
                0},

    
    horizontal = {7,6,
                  4,3,
                  5,4,
                  4,4,
                  5,3,
                  3,3,
                  2,1,
                  -1,1,
                  -1,0,
                  -1,1,
                  3,2,
                  1,1,
                  3,2,
                  -2,2,
                  -2,1,
                  -2,2,
                  5,4,
                  5,4,
                  2,2,
                  
                  1,1,--打完20執行這行
                  1,1,
                  3,2,
                  2,2,
                  2,1,
                  
                  1,2,
                  2,1,
                  0,-1,
                  
                  2,1,
                  3,2,
                  
                  0},
    delay = {100, 200, 300, 400, 500, 600, 
             700, 800, 900, 1000, 1100, 1200, 
             1300, 1400, 1500, 1600, 1700, 1800,
             1900, 2000, 2100, 2200, 2300, 2400,
             2500, 2600, 2700, 2800, 2900,9998},
}

function recoil_value(_weapon,_duration,delaycount)
  local step_delay = delaycount
  local step = _duration + 1
  if step > #recoil_table[_weapon]["vertical"] then
        step = #recoil_table[_weapon]["vertical"]
  end
  local weapon_ver = recoil_table[_weapon]["vertical"][step]
  local weapon_hor = recoil_table[_weapon]["horizontal"][step]
  local weapon_delay = recoil_table[_weapon]["delay"][step_delay]
  --local weapon_delay = recoil_table[_weapon]["delay"]
  return weapon_ver,weapon_hor,weapon_delay
  --return recoil_table[_weapon]["vertical"][step],recoil_table[_weapon]["horizontal"][step],recoil_table[_weapon]["speed"] 
end

function moveMouseRelativeAdjusted(x, y, sensitivity)
    local adjustedX = math.floor(x * sensitivity + 0.5)
    local adjustedY = math.floor(y * sensitivity + 0.5)
    MoveMouseRelative(adjustedX, adjustedY)
    OutputLogMessage("%d %d \n",adjustedX, adjustedY)
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
 -- OutputLogMessage("Event: "..event.."Arg: "..arg.."\n")
  
  if(event == "PROFILE_ACTIVATED") then
    EnablePrimaryMouseButtonEvents(true)
    current_weapon = "R301"
    defaultSensitivity = 2.0
    defaultADS = 1.3
    mousse_SenADS = mouse_sensitivity*ads
    defaultSenADS = defaultSensitivity*defaultADS
    BalanceSensitivity = defaultSenADS / mousse_SenADS
  elseif (event == "PROFILE_DEACTIVATED") then
    ReleaseMouseButton(1)
  end
  
  
  if(event == "MOUSE_BUTTON_PRESSED") then
    keybinds(arg)
--    OutputLogMessage("weapon:"..current_weapon.."\n\n")
  end
  if (IsKeyLockOn("capslock") )then
    if IsMouseButtonPressed(3) then
      repeat
        if IsMouseButtonPressed(1) then
        --OutputLogMessage("This script has been running for: %d ms", GetRunningTime())
            shoot_duration = 0
            delay_count = 0
            delaytime = 0
            last_time = GetRunningTime()
            
            repeat
            --OutputLogMessage("This script has been running for: %d ms", GetRunningTime())
                if(GetRunningTime()-last_time>=delaytime) then
                    delay_count = delay_count+1
                    for i = 1,2 do
                     --OutputLogMessage("This script has been running for: %d ms \n", GetRunningTime()-last_time)
                      Sleep(10)
                      ver,hor,delaytime = recoil_value(current_weapon,shoot_duration,delay_count)
                      moveMouseRelativeAdjusted(ver,hor,BalanceSensitivity)
                      shoot_duration = shoot_duration + 1
                    end
                    
                else
                    --OutputLogMessage("%d \n",GetRunningTime()-last_time)
                    Sleep(10)
                end
            until not IsMouseButtonPressed(1)
            --OutputLogMessage("This script has been running for: %d ms", GetRunningTime())
        end
      until not IsMouseButtonPressed(3)
      
    end
  end
end