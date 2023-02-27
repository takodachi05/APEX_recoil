--data=dofile[[D:\a.lua]]
local set_key1 = 4
local set_key2 = 5
local off_key = 6
local mouse_sensitivity = 2.0--1.3 
local ads = 1.3--1.0
---gun table---
local recoil_table = {}
recoil_table["none"] = {
    vertical = {0,0,
                0,0,
                0,0,
                0,0,
                0,0,
                0,0,
                0,0,
                0,0, 
                0,0,
                0,0,--10
                0,0,
                0,0,
                0,0,
                0,0,
                0,0,
                0,0,
                0,0,
                0,0, 
                0,0, 
                --------------
                0,0,
                0,0,
                --------------
                0,0,
                0,0,
                --------------
                0,0,
                0,0,
                0,0,
                --------------
                0},
    
    horizontal = {0,0,
                  0,0,
                  0,0,
                  0,0,
                  0,0,
                  0,0,
                  0,0,
                  0,0, 
                  0,0,
                  0,0,--10
                  0,0,
                  0,0,
                  0,0,
                  0,0,
                  0,0,
                  0,0,
                  0,0,
                  0,0, 
                  0,0, 
                  --------------
                  0,0,
                  0,0,
                  --------------
                  0,0,
                  0,0,
                  --------------
                  0,0,
                  0,0,
                  0,0,
                  --------------
                  0},
    
    delay = {0,0},
}
recoil_table["Devotion_Turbocharger"] = {
    vertical = {0,0,
                0,0,
                0,0,
                0,0,
                0,0,
                0,0,
                0,0,
                0,0, 
                0,0,
                0,0,--10
                0,0,
                0,0,
                0,0,
                0,0,
                0,0,
                0,0,
                0,0,
                0,0, 
                0,0, 
                0,0,--20
                0,0,
                0,0,
                0,0,
                0,0,
                0,0,
                0,0,
                0,0,
                0,0, 
                0,0, 
                0,0,--30
                0,0,
                0,0,
                0,0,
                0,0, 
                0,0, 
                --------------
                0,0,
                0,0,
                0,0,
                0,0,
                --------------
                0,0,
                0,0,
                0,0,
                0,0,
                --------------
                0,0,
                0,0,
                0,0,
                0,0,
                --------------
                0},
    
    horizontal = {14,13,
                  12,13,
                  0,0,
                  0,0,
                  0,0,
                  0,0,
                  0,0,
                  0,0, 
                  0,0,
                  0,0,--10
                  0,0,
                  0,0,
                  0,0,
                  0,0,
                  0,0,
                  0,0,
                  0,0,
                  0,0, 
                  0,0, 
                  0,0,--20
                  0,0,
                  0,0,
                  0,0,
                  0,0,
                  0,0,
                  0,0,
                  0,0,
                  0,0, 
                  0,0, 
                  0,0,--30
                  0,0,
                  0,0,
                  0,0,
                  0,0, 
                  0,0, 
                  --------------
                  0,0,
                  0,0,
                  0,0,
                  0,0,
                  --------------
                  0,0,
                  0,0,
                  0,0,
                  0,0,
                  --------------
                  0,0,
                  0,0,
                  0,0,
                  0,0,
                  --------------
                  0},
    
    delay = {150, 270, 377, 475, 564, 646, 722, 792, 858, 925, 991, 1057, 1123, 1189, 1255, 1321, 1388, 1454, 1520, 1586, 1652, 1718, 1784, 1851, 1917, 1983, 2049, 2115, 2181, 2248, 2314, 2380, 2446, 2512, 2578, 2644, 2711, 2777, 2843, 2909, 2975, 3041, 3108, 3174, 3240, 3306, 3372,9999},
}
recoil_table["HAVOC_Turbocharger"] = {
    vertical = {-3,-3,
                -4,-3,
                2,1,
                0,-1,
                2,1,
                3,2,
                1,1,
                2,2, 
                2,2,
                -2,-1,--10
                -3,-3,
                -4,-3,
                -3,-3,
                -3,-4,
                -3,-1,
                2,2,
                2,2,
                3,3,
                3,3,
                3,2,
                3,4,
                -1,2,
                -2,-2,
                --------------
                2,2,
                2,2,
                -1,1,
                2,3,
                --------------
                3,3,
                2,3,
                3,3,
                -1,1,
                --------------
                -2,-1,
                -1,-1,
                1,2,
                -2,-2,
                --------------
                0},
    
    horizontal = {7,8,
                  9,10,
                  8,8,
                  8,8,
                  5,5,
                  3,4,
                  4,6,
                  4,5, 
                  4,4,
                  4,4,--10
                  2,2,
                  2,2,
                  -1,-2,
                  0,0,
                  4,5,
                  3,3,
                  2,2,
                  
                  2,3,
                  -1,-2,
                  -2,3,
                  2,2,
                  5,4,
                  5,5,
                  --------------
                  4,3,
                  3,4,
                  5,5,
                  5,5,
                  --------------
                  3,2,
                  4,4,
                  4,3,
                  4,4,
                  --------------
                  4,5,
                  4,4,
                  4,4,
                  3,4,
                  --------------
                  0},
    
    delay = {91, 182, 273, 365, 456, 547, 638, 729,
             820, 912, 1003, 1094, 1185, 1276, 1367, 1459, 1550, 1641,
             1732, 1823, 1914, 2006, 2097, 2188, 2279, 2370, 2461, 2553, 2644,
             2735, 2826, 2917, 3008, 3100, 3191,9999},
}
recoil_table["HAVOC_NO_Turbocharger"] = {
    vertical = {0,0,
                -3,-3,
                -4,-3,
                2,1,
                0,-1,
                2,1,
                3,2,
                1,1,
                2,2, 
                2,2,
                -2,-1,--10
                -3,-3,
                -4,-3,
                -3,-3,
                -3,-4,
                -3,-1,
                2,2,
                2,2,
                3,3,
                3,3,
                3,2,
                3,4,
                -1,2,
                -2,-2,
                --------------
                2,2,
                2,2,
                -1,1,
                2,3,
                --------------
                3,3,
                2,3,
                3,3,
                -1,1,
                --------------
                -2,-1,
                -1,-1,
                1,2,
                -2,-2,
                --------------
                0},
    
    horizontal = {0,0,
                  7,8,
                  9,10,
                  8,8,
                  8,8,
                  5,5,
                  3,4,
                  4,6,
                  4,5, 
                  4,4,
                  4,4,--10
                  2,2,
                  2,2,
                  -1,-2,
                  0,0,
                  4,5,
                  3,3,
                  2,2,
                  
                  2,3,
                  -1,-2,
                  -2,3,
                  2,2,
                  5,4,
                  5,5,
                  --------------
                  4,3,
                  3,4,
                  5,5,
                  5,5,
                  --------------
                  3,2,
                  4,4,
                  4,3,
                  4,4,
                  --------------
                  4,5,
                  4,4,
                  4,4,
                  3,4,
                  --------------
                  0},
    
    delay = {481, 572, 663, 755, 846, 937, 1028, 1119,
             1210, 1302, 1393, 1484, 1575, 1666, 1757, 1849, 1940,
             2031, 2122, 2213, 2304, 2396, 2487, 2578, 2669, 2760, 2851,
             2943, 3034, 3125, 3216, 3307, 3398, 3490, 3581, 10389},
}
recoil_table["Volt"] = {
    vertical = {-2,-3,
                0,-1,
                1,1,
                -3,-2,
                0,1,
                -5,-4,
                -1,-1,
                3,2, 
                -3,-3,
                1,1,--10
                4,4,
                5,5,
                3,3,
                3,2,
                -2,-1,
                -3,-4,
                -3,-3,
                2,1, 
                --------------
                3,3,
                3,3,
                --------------
                2,2,
                1,1,
                --------------
                0,0,
                1,0,
                1,0,
                --------------
                0},
    
    horizontal = {5,7,
                  6,8,
                  7,9,
                  5,5,
                  9,10,
                  5,6,
                  8,9,
                  6,7, 
                  6,7,
                  5,5,--10
                  1,1,
                  -1,-1,
                  4,3,
                  4,5,
                  3,3,
                  -2,2,
                  -2,2,
                  3,2, 
                  --------------
                  2,2,
                  1,1,
                  --------------
                  -2,2,
                  -1,2,
                  --------------
                  2,2,
                  2,2,
                  4,3,
                  --------------
                  0},
    
    delay = {83, 167, 250, 333, 417, 500, 583, 667,
             750, 833, 917, 1000, 1083, 1167, 1250, 1333, 1417, 1500,
             1583, 1667, 1750, 1833, 1917, 2000, 2083,9999},
}

recoil_table["R99"] = {
    vertical = {0,-3,
                1,1,
                2,2,
                -2,-2,
                -2,-1,
                -3,-3,
                -4,-3,-----
                -2,-1, 
                -1,1,
                3,3,--10
                3,3,
                1,1,
                1,1,
                -1,-2,
                -4,-3,
                -2,-3,
                -3,-3,
                4,3, 
                2,3, 
                --------------
                5,4,
                4,4,
                --------------
                3,3,
                -5,-4,
                -5,-6,
                --------------
                -2,-2,
                -2,-2,
                2,2,
                --------------
                0},
    
    horizontal = {5,6,
                  5,5,
                  3,5,
                  6,7,
                  7,8,
                  6,8,
                  5,5,
                  5,7, 
                  6,6,
                  5,5,--10
                  6,5,
                  5,4,
                  4,3,
                  3,3,
                  1,2,
                  1,1,
                  -2,2,
                  1,1, 
                  -2,2, 
                  --------------
                  2,-2,
                  1,2,
                  --------------
                  0,1,
                  2,-2,
                  0,1,
                  --------------
                  2,-2,
                  0,1,
                  2,-2,
                  --------------
                  0},
    
    delay = {56, 111, 167, 222, 278, 333, 389, 444,
             500, 556, 611, 667, 722, 778, 833, 889, 944,
             1000, 1056, 1111, 1167, 1222, 1278, 1333, 1389, 1444,9999},
}
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
    vertical = {2,2,
                1,0,
                5,4,
                4,3,
                2,1,
                -1,1,
                -3,-3,
                -5,-5, 
                -2,-2,
                -2,-3,--10
                -4,1,
                4,3,
                6,5,
                4,4,
                6,5,
                3,3,
                0,1,
                0,1, 
                5,4, 
                --------------
                6,4,
                3,2,
                -1,1,
                -5,-3,
                -4,-3,
                --------------
                -5,-4,
                -5,-4,
                -4,-5,
                --------------
                -2,-1,
                -2,-2,
                --------------
                0},

    
    horizontal = {10,10,
                  4,3,
                  5,5,
                  4,4,
                  5,5,
                  5,5,
                  2,1,
                  -1,0,
                  -3,0,
                  0,5,--10
                  5,4,
                  1,2,
                  3,3,
                  -2,3,
                  -2,1,
                  -2,3,
                  5,6,
                  5,6,
                  2,2,
                  ------------------
                  1,1,
                  1,1,
                  3,3,
                  2,2,
                  2,1,
                  ----------------------
                  2,2,
                  2,1,
                  0,-3,
                  -------------------------
                  4,3,
                  5,3,
                  ------------------
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
    --OutputLogMessage("%d %d \n",adjustedX, adjustedY)
end

function keybinds(arg)
  if(arg == off_key) then
      current_weapon = "none"
  elseif (arg == set_key1) then
      current_weapon = "HAVOC_Turbocharger"
  elseif (arg == set_key2) then
      current_weapon = "HAVOC_NO_Turbocharger"
  end
end

function OnEvent(event, arg)
 -- OutputLogMessage("Event: "..event.."Arg: "..arg.."\n")
  
  if(event == "PROFILE_ACTIVATED") then
    EnablePrimaryMouseButtonEvents(true)
    current_weapon = "Devotion_Turbocharger"
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
            delaytime = 15
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