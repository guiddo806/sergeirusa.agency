local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/guiddo806/sergeirusa.agency/refs/heads/main/UI/ModdedLinoria.lua"))()

if game.PlaceId == 13253735473 then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/guiddo806/sergeirusa.agency/refs/heads/main/PituniaProduction/feofelact.TridentSurvival.lua", true))()
elseif game.PlaceId == 301549746 then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/guiddo806/sergeirusa.agency/refs/heads/main/PituniaProduction/feofelact.CounterBlox.lua", true))()
elseif game.PlaceId == 4483381587 then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/guiddo806/sergeirusa.agency/refs/heads/main/PituniaProduction/feofelact.TridentSurvival.lua", true))()
else
    Library:Notify('Feofelact.gg doesn`t support this game now', 7)
    Library:Notify('Supported games: Counter Blox, Trident Survival', 7)
end
