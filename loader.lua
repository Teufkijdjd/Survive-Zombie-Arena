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
