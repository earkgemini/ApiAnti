script_key = script_key or _G.Key or "YOUR_KEY_HERE"

local v1 = game:GetService("Players");
local v2 = game:GetService("HttpService");
local v3 = game:GetService("CoreGui");
local v4 = string.format;
local v5 = tostring;
local v6 = game.HttpGet;

local _0x1 = "https://anityx-server.onrender.com";
local _0x2 = "/loader?key=";
local _0x3 = "&hwid=";
local _ID = "&id=default";

local function _Connect(k)
    local p = v1.LocalPlayer;
    local u = v5(p.UserId);
    
    if not k or k == "" then return print(":: AnityX Error :: Missing 'script_key'") end
    
    local _url = v4("%s%s%s%s%s%s", _0x1, _0x2, k, _0x3, u, _ID);
    
    local s, r = pcall(function()
        return v6(game, _url);
    end);

    if s and r then
        if string.find(r, "print") or string.find(r, "Error") then
            loadstring(r)();
        else
            local f, e = loadstring(r);
            if f then
                f();
            else
                warn(":: AnityX Integrity Error ::");
            end
        end
    else
        warn(":: AnityX Connection Failed :: Server unreachable.");
    end
end

_Connect(script_key);
