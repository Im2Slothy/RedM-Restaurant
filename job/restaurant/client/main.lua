TriggerEvent("menuapi:getData",function(call)
    MenuData = call
end)

local job

-- Restaurants
Citizen.CreateThread(function()
    while true do
        local ped = GetPlayerPed()
        local coords = GetEntityCoords(PlayerPedId())
        local sleep = true

        for k,v in pairs(Config.RestaurantLocation) do
            if GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) <= 2 then
                sleep = false
                TriggerEvent("enter:res")
                if whenKeyJustPressed(keys["G"]) then
                    TriggerServerEvent("Redm-Restaurant:checkjobrestaurant")
                end
            end
        end

        Citizen.Wait(5)

        if sleep then
            Wait(1000)
        end
    end
end)

function openRestaurantmenu()
	MenuData.CloseAll()
	local elements = {
		{label = "Whiskey", value = 'whiskey' , desc = "Buy Whiskey For 4$"},
		{label = "Beer", value = 'beer' , desc = "Buy Beer For 4$"},
		{label = "Lambs Fry", value = 'lambs fry' , desc = "Buy Lambs Fry For 5$"},
		{label = "Lobster Bisque", value = 'lobster bisque' , desc = "Buy Lobster Bisque For 5$"},
        {label = "Prime Rib", value = 'prime rib' , desc = "Buy Prime Rib For 5$"},
        {label = "Fried Catfish", value = 'fried catfish', desc = "Buy Fried Catfish For $5"},
        {label = "Peach Cobbler", value = 'peach cobbler', desc = "Buy Peach Cobbler For $5"},
        {label = "Roast Beef", value = 'roast beef', desc = "Buy Roast Beef For $5"},



	}
   MenuData.Open('default', GetCurrentResourceName(), 'menuapi',
	{
		title    = "Restaurant Menu",
		subtext    = "Buy Food and Drinks",
		align    = 'left',
		elements = elements,
	},
	function(data, menu)
		if  (data.current.value == 'whiskey') then 
			TriggerServerEvent("Redm-Restaurant:giveResWhiskey")
            TriggerEvent("vorp:TipRight", "You Bought 1 Whiskey", 2000)

        elseif  (data.current.value == 'beer') then 
            TriggerServerEvent("Redm-Restaurant:giveResBeer")
            TriggerEvent("vorp:TipRight", "You Bought 1 Beer", 2000)

        elseif  (data.current.value == 'lambs fry') then 
            TriggerServerEvent("Redm-Restaurant:giveResLambsFry")
            TriggerEvent("vorp:TipRight", "You Bought 1 Lambs Fry", 2000)

        elseif  (data.current.value == 'lobster bisque') then 
            TriggerServerEvent("Redm-Restaurant:giveResLobsterBisque")
            TriggerEvent("vorp:TipRight", "You Bought 1 Lobster Bisque", 2000)

        elseif  (data.current.value == 'prime rib') then 
            TriggerServerEvent("Redm-Restaurant:giveResPrimeRib")
            TriggerEvent("vorp:TipRight", "You Bought 1 Prime Rib", 2000)

        elseif  (data.current.value == 'fried catfish') then 
            TriggerServerEvent("Redm-Restaurant:giveResFriedCatfish")
            TriggerEvent("vorp:TipRight", "You Bought 1 Fried Catfish", 2000)

        elseif  (data.current.value == 'peach cobbler') then 
            TriggerServerEvent("Redm-Restaurant:giveResPeachCobbler")
            TriggerEvent("vorp:TipRight", "You Bought 1 Peach Cobbler", 2000)

        elseif  (data.current.value == 'roast beef') then 
            TriggerServerEvent("Redm-Restaurant:giveResRoastBeef")
            TriggerEvent("vorp:TipRight", "You Bought 1 Roast Beef", 2000)
		end
	end,
	function(data, menu)
		menu.close()
	end)
end

RegisterNetEvent("enter:res")
AddEventHandler("enter:res", function()
    SetTextScale(0.3, 0.3)
    --SetTextFontForCurrentCommand(1)
    local msg = "Press G To Access The Resturant Menu"
    local str = Citizen.InvokeNative(0xFA925AC00EB830B9, 10, "LITERAL_STRING", msg, Citizen.ResultAsLong())

    Citizen.InvokeNative(0xFA233F8FE190514C, str)
    Citizen.InvokeNative(0xE9990552DEC71600)
end)

RegisterNetEvent(":open")
AddEventHandler("resturant:open", function()
    openSaloonmenu()
end)

function whenKeyJustPressed(key)
    if Citizen.InvokeNative(0x580417101DDB492F, 0, key) then
        return true
    else
        return false
    end
end

Citizen.CreateThread(function()
    for k, v in pairs(Config.RestaurantLocation) do
        local blip = N_0x554d9d53f696d002(1664425300, v.Pos.x, v.Pos.y, v.Pos.z)
        SetBlipSprite(blip, 1879260108, 1)
        Citizen.InvokeNative(0x9CB1A1623062F402, blip, "Resturant")
    end
end)