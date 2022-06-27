local VorpCore = {}

TriggerEvent("getCore",function(core)
    VorpCore = core
end)

VorpInv = exports.vorp_inventory:vorp_inventoryApi()

RegisterServerEvent("Redm-Restaurant:checkjobrestaurant")
AddEventHandler("Redm-Restaurant:checkjobrestaurant", function()
    local _source = source
    local Character = VorpCore.getUser(_source).getUsedCharacter
    local job = Character.job
    for k,v in pairs(Config.RestaurantLocation) do
        if job == v.Job then
            TriggerClientEvent('resturant:open', _source)
        --[[else
            TriggerClientEvent("vorp:Tip", _source, "You dont work at the resturant", 4000) -- from server side]]
        end
    end
end)

RegisterServerEvent("Redm-Restaurant:checkjobresturant2")
AddEventHandler("Redm-Restaurant:checkjobresturant2", function()
    local _source = source
    local Character = VorpCore.getUser(_source).getUsedCharacter
    local job = Character.job
    if job == 'resturant2' then
        TriggerClientEvent('resturant:open', _source)
    else
        TriggerClientEvent("vorp:Tip", _source, "You dont work at the resturant", 4000) -- from server side
    end
end)

RegisterServerEvent("Redm-Restaurant:checkjobsdresturant")
AddEventHandler("Redm-Restaurant:checkjobsdresturant", function()
    local _source = source
    local Character = VorpCore.getUser(_source).getUsedCharacter
    local job = Character.job
    if job == 'sdresturant' then
        TriggerClientEvent('resturant:open', _source)
    else
        TriggerClientEvent("vorp:Tip", _source, "You dont work at the resturant", 4000) -- from server side
    end
end)

RegisterServerEvent("Redm-Restaurant:checkjobsdresturant2")
AddEventHandler("Redm-Restaurant:checkjobsdresturant2", function()
    local _source = source
    local Character = VorpCore.getUser(_source).getUsedCharacter
    local job = Character.job
    if job == 'sdresturant2' then
        TriggerClientEvent('resturant:open', _source)
    else
        TriggerClientEvent("vorp:Tip", _source, "You dont work at the resturant", 4000) -- from server side
    end
end)

RegisterServerEvent("Redm-Restaurant:checkjobrhresturant")
AddEventHandler("Redm-Restaurant:checkjobrhresturant", function()
    local _source = source
    local Character = VorpCore.getUser(_source).getUsedCharacter
    local job = Character.job
    if job == 'rhresturant' then
        TriggerClientEvent('resturant:open', _source)
    else
        TriggerClientEvent("vorp:Tip", _source, "You dont work at the resturant", 4000) -- from server side
    end
end)

RegisterServerEvent("Redm-Restaurant:checkjobvanhornresturant")
AddEventHandler("Redm-Restaurant:checkjobvanhornresturant", function()
    local _source = source
    local Character = VorpCore.getUser(_source).getUsedCharacter
    local job = Character.job
    if job == 'vanhornresturant' then
        TriggerClientEvent('resturant:open', _source)
    else
        TriggerClientEvent("vorp:Tip", _source, "You dont work at the resturant", 4000) -- from server side
    end
end)

RegisterServerEvent("Redm-Restaurant:checkjobadresturant")
AddEventHandler("Redm-Restaurant:checkjobadresturant", function()
    local _source = source
    local Character = VorpCore.getUser(_source).getUsedCharacter
    local job = Character.job
    if job == 'adresturant' then
        TriggerClientEvent('resturant:open', _source)
    else
        TriggerClientEvent("vorp:Tip", _source, "You dont work at the resturant", 4000) -- from server side
    end
end)

RegisterServerEvent("Redm-Restaurant:checkjobtwresturant")
AddEventHandler("Redm-Restaurant:checkjobtwresturant", function()
    local _source = source
    local Character = VorpCore.getUser(_source).getUsedCharacter
    local job = Character.job
    if job == 'twresturant' then
        TriggerClientEvent('resturant:open', _source)
    else
        TriggerClientEvent("vorp:Tip", _source, "You dont work at the resturant", 4000) -- from server side
    end
end)




RegisterServerEvent("Redm-Restaurant:giveResWhiskey")
AddEventHandler("Redm-Restaurant:giveResWhiskey", function()
    local _source = source
    if count == nil then 
        count = 1
    end
    local User = VorpCore.getUser(source) -- Return User with functions and all characters
    local Character = VorpCore.getUser(source).getUsedCharacter
    local playername = Character.firstname .. ' ' .. Character.lastname
    local money = Character.money
    local take =  4
    local total = money - take
    TriggerEvent("vorpCore:canCarryItems", tonumber(_source), 1, function(canCarry)
        if canCarry then
            if total >= 0 then
                Character.removeCurrency(0, take)
                VorpInv.addItem(_source, "whiskey", 1)
            else
                TriggerClientEvent("vorp:TipRight", _source, "You dont have enough money", 3000)
            end
        else
            TriggerClientEvent("vorp:TipRight", _source, "You cant carry more of these", 3000)
        end
    end)
end)

RegisterServerEvent("Redm-Restaurant:giveResBeer")
AddEventHandler("Redm-Restaurant:giveResBeer", function()
    local _source = source
    if count == nil then 
        count = 1
    end
    local User = VorpCore.getUser(source) -- Return User with functions and all characters
    local Character = VorpCore.getUser(source).getUsedCharacter
    local playername = Character.firstname .. ' ' .. Character.lastname
    local money = Character.money
    local take =  4
    local total = money - take
    TriggerEvent("vorpCore:canCarryItems", tonumber(_source), 1, function(canCarry)
        if canCarry then
            if total >= 0 then
                Character.removeCurrency(0, take)
                VorpInv.addItem(_source, "Beer", 1)
            else
                TriggerClientEvent("vorp:TipRight", _source, "You dont have enough money", 3000)
            end
        else
            TriggerClientEvent("vorp:TipRight", _source, "You cant carry more of these", 3000)
        end
    end)
end)

RegisterServerEvent("Redm-Restaurant:giveResLambsFry")
AddEventHandler("Redm-Restaurant:giveResLambsFry", function()
    local _source = source
    if count == nil then 
        count = 1
    end
    local User = VorpCore.getUser(source) -- Return User with functions and all characters
    local Character = VorpCore.getUser(source).getUsedCharacter
    local playername = Character.firstname .. ' ' .. Character.lastname
    local money = Character.money
    local take =  4
    local total = money - take
    TriggerEvent("vorpCore:canCarryItems", tonumber(_source), 1, function(canCarry)
        if canCarry then
            if total >= 0 then
                Character.removeCurrency(0, take)
                VorpInv.addItem(_source, "lambs_fry", 1)
            else
                TriggerClientEvent("vorp:TipRight", _source, "You dont have enough money", 3000)
            end
        else
            TriggerClientEvent("vorp:TipRight", _source, "You cant carry more of these", 3000)
        end
    end)
end)

RegisterServerEvent("Redm-Restaurant:giveResLobsterBisque")
AddEventHandler("Redm-Restaurant:giveResLobsterBisque", function()
    local _source = source
    if count == nil then 
        count = 1
    end
    local User = VorpCore.getUser(source) -- Return User with functions and all characters
    local Character = VorpCore.getUser(source).getUsedCharacter
    local playername = Character.firstname .. ' ' .. Character.lastname
    local money = Character.money
    local take =  4
    local total = money - take
    TriggerEvent("vorpCore:canCarryItems", tonumber(_source), 1, function(canCarry)
        if canCarry then
            if total >= 0 then
                Character.removeCurrency(0, take)
                VorpInv.addItem(_source, "lobster_bisque", 1)
            else
                TriggerClientEvent("vorp:TipRight", _source, "You dont have enough money", 3000)
            end
        else
            TriggerClientEvent("vorp:TipRight", _source, "You cant carry more of these", 3000)
        end
    end)
end)

RegisterServerEvent("Redm-Restaurant:giveResPrimeRib")
AddEventHandler("Redm-Restaurant:giveResPrimeRib", function()
    local _source = source
    if count == nil then 
        count = 1
    end
    local User = VorpCore.getUser(source) -- Return User with functions and all characters
    local Character = VorpCore.getUser(source).getUsedCharacter
    local playername = Character.firstname .. ' ' .. Character.lastname
    local money = Character.money
    local take =  5
    local total = money - take
    TriggerEvent("vorpCore:canCarryItems", tonumber(_source), 1, function(canCarry)
        if canCarry then
            if total >= 0 then
                Character.removeCurrency(0, take)
                VorpInv.addItem(_source, "prime_rib", 1)
            else
                TriggerClientEvent("vorp:TipRight", _source, "You dont have enough money", 3000)
            end
        else
            TriggerClientEvent("vorp:TipRight", _source, "You cant carry more of these", 3000)
        end
    end)
end)

RegisterServerEvent("Redm-Restaurant:giveResFriedCatfish")
AddEventHandler("Redm-Restaurant:giveResFriedCatfish", function()
    local _source = source
    if count == nil then 
        count = 1
    end
    local User = VorpCore.getUser(source) -- Return User with functions and all characters
    local Character = VorpCore.getUser(source).getUsedCharacter
    local playername = Character.firstname .. ' ' .. Character.lastname
    local money = Character.money
    local take =  5
    local total = money - take
    TriggerEvent("vorpCore:canCarryItems", tonumber(_source), 1, function(canCarry)
        if canCarry then
            if total >= 0 then
                Character.removeCurrency(0, take)
                VorpInv.addItem(_source, "fried_catfish", 1)
            else
                TriggerClientEvent("vorp:TipRight", _source, "You dont have enough money", 3000)
            end
        else
            TriggerClientEvent("vorp:TipRight", _source, "You cant carry more of these", 3000)
        end
    end)
end)

RegisterServerEvent("Redm-Restaurant:giveResPeachCobbler")
AddEventHandler("Redm-Restaurant:giveResPeachCobbler", function()
    local _source = source
    if count == nil then 
        count = 1
    end
    local User = VorpCore.getUser(source) -- Return User with functions and all characters
    local Character = VorpCore.getUser(source).getUsedCharacter
    local playername = Character.firstname .. ' ' .. Character.lastname
    local money = Character.money
    local take =  5
    local total = money - take
    TriggerEvent("vorpCore:canCarryItems", tonumber(_source), 1, function(canCarry)
        if canCarry then
            if total >= 0 then
                Character.removeCurrency(0, take)
                VorpInv.addItem(_source, "peach_cobbler", 1)
            else
                TriggerClientEvent("vorp:TipRight", _source, "You dont have enough money", 3000)
            end
        else
            TriggerClientEvent("vorp:TipRight", _source, "You cant carry more of these", 3000)
        end
    end)
end)

RegisterServerEvent("Redm-Restaurant:giveResRoastBeef")
AddEventHandler("Redm-Restaurant:giveResRoastBeef", function()
    local _source = source
    if count == nil then 
        count = 1
    end
    local User = VorpCore.getUser(source) -- Return User with functions and all characters
    local Character = VorpCore.getUser(source).getUsedCharacter
    local playername = Character.firstname .. ' ' .. Character.lastname
    local money = Character.money
    local take =  5
    local total = money - take
    TriggerEvent("vorpCore:canCarryItems", tonumber(_source), 1, function(canCarry)
        if canCarry then
            if total >= 0 then
                Character.removeCurrency(0, take)
                VorpInv.addItem(_source, "roast_beef", 1)
            else
                TriggerClientEvent("vorp:TipRight", _source, "You dont have enough money", 3000)
            end
        else
            TriggerClientEvent("vorp:TipRight", _source, "You cant carry more of these", 3000)
        end
    end)
end)