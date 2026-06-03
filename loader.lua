local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local executor =
    identifyexecutor and identifyexecutor()
    or getexecutorname and getexecutorname()
    or "Unknown"

local supported = {
    ["synapse z"] = true,
    ["wave"] = true,
    ["volt"] = true,
    ["seliware"] = true,
    ["potassium"] = true,
    ["solara"] = true,
    ["xeno"] = true,
    ["delta"] = true,
    ["arceus x"] = true,
    ["codex"] = true,
}

local found = false

for name in pairs(supported) do
    if string.find(string.lower(executor), name) then
        found = true
        break
    end
end

if not found then
    game.Players.LocalPlayer:Kick("Executor ไม่รองรับ")
    return
end

local Success, Result = pcall(function()
    return game:HttpGet("https://api-survive-zombie-arena.vercel.app/api/loader")
end)

if Success and Result and Result ~= "" then
    local Loaded, Err = pcall(function()
        loadstring(Result)()
    end)

    if not Loaded then
        warn("Loader Error:", Err)
    end
else
    warn("Failed to fetch loader:", Result)
end
