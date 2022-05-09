RegisterServerEvent("discordMember.getIsAllowed")
AddEventHandler("discordMember.getIsAllowed", function()
    if IsPlayerAceAllowed(source, Config.DiscordMemberAcePerm) then
        TriggerClientEvent("discordMember.returnIsAllowed", source, true, true)
    else
        TriggerClientEvent("discordMember.returnIsAllowed", source, false)
    end
end)

RegisterServerEvent("whitelistedMember.getIsAllowed")
AddEventHandler("whitelistedMember.getIsAllowed", function()
    if IsPlayerAceAllowed(source, Config.WhitelistedAcePerm) then
        TriggerClientEvent("whitelistedMember.returnIsAllowed", source, true)
    else
        TriggerClientEvent("whitelistedMember.returnIsAllowed", source, false)
    end
end)

RegisterServerEvent("serverBooster.getIsAllowed")
AddEventHandler("serverBooster.getIsAllowed", function()
    if IsPlayerAceAllowed(source, Config.ServerBoosterAcePerm) then
        TriggerClientEvent("serverBooster.returnIsAllowed", source, true)
    else
        TriggerClientEvent("serverBooster.returnIsAllowed", source, false)
    end
end)

RegisterServerEvent("tier1.getIsAllowed")
AddEventHandler("tier1.getIsAllowed", function()
    if IsPlayerAceAllowed(source, Config.Tier2AcePerm) then
        TriggerClientEvent("tier1.returnIsAllowed", source, true)
    else
        TriggerClientEvent("tier1.returnIsAllowed", source, false)
    end
end)

RegisterServerEvent("tier2.getIsAllowed")
AddEventHandler("tier2.getIsAllowed", function()
    if IsPlayerAceAllowed(source, Config.Tier2AcePerm) then
        TriggerClientEvent("tier2.returnIsAllowed", source, true)
    else
        TriggerClientEvent("tier2.returnIsAllowed", source, false)
    end
end)

RegisterServerEvent("tier3.getIsAllowed")
AddEventHandler("tier3.getIsAllowed", function()
    if IsPlayerAceAllowed(source, Config.Tier3AcePerm) then
        TriggerClientEvent("tier3.returnIsAllowed", source, true)
    else
        TriggerClientEvent("tier3.returnIsAllowed", source, false)
    end
end)