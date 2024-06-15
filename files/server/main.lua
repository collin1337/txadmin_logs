function SendToDiscord(discordWebhook, embedTitel, embedDesc, embedFields)
  local webhook = Config.Webhooks[discordWebhook]

  local DiscordEmbed = {
    {
      ['author'] = {
        name = Config.WebhookSettings.embed.author.name,
        url = Config.WebhookSettings.embed.author.url,
        icon_url = Config.WebhookSettings.embed.author.icon_url
      },
      ['color'] = Config.WebhookSettings.embed.color,
      ['title'] = embedTitel,
      ['description'] = embedDesc,
      ['fields'] = embedFields,
      ['footer'] = {
        text = Config.WebhookSettings.embed.footer.text,
        icon_url = Config.WebhookSettings.embed.footer.icon_url
      }
    }
  }

  PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({ username = Config.WebhookSettings.user.name, avatar_url = Config.WebhookSettings.user.icon_url, embeds = DiscordEmbed }), { ['Content-Type'] = 'application/json' })
end

AddEventHandler('txAdmin:events:healedPlayer', function(data)
  if data.id ~= -1 then
    SendToDiscord('playerHealed', 'txAdmin Healed Player', '`Player '.. GetPlayerName(data.id) ..' - ['.. data.id ..'] was Healed`', {
      { name = 'Message:', value = '```Player: '.. GetPlayerName(data.id) ..' - ['.. data.id ..'] was Healed```' }
    })
  else
    SendToDiscord('playerHealed', 'txAdmin Healed Everyone', '`Everyone was Healed`', {
      { name = 'Message:', value = '```Everyone was Healed```' }
    })
  end
end)

AddEventHandler('txAdmin:events:playerDirectMessage', function(data)
  SendToDiscord('playerDirectMessage', 'txAdmin Direct Message', '`'.. data.author ..' has sent an Direct Message to '.. GetPlayerName(data.target) ..'`', {
    { name = 'Admin Name:', value = '```'.. data.author ..'```' },
    { name = 'Target Name:', value = '```'.. GetPlayerName(data.target) ..' - ['.. data.target ..']```' },
    { name = 'Message:', value = '```'.. data.message ..'```' }
  })
end)

AddEventHandler('txAdmin:events:announcement', function(data)
  SendToDiscord('globalAnnouncement', 'txAdmin Announcement', '`'.. data.author ..' has sent an Announcement`', {
    { name = 'Admin Name:', value = '```'.. data.author ..'```' },
    { name = 'Message:', value = '```'.. data.message ..'```' }
  })
end)

AddEventHandler('txAdmin:events:playerWarned', function(data)
  SendToDiscord('playerWarned', 'txAdmin Warned Player', '`'.. data.author ..' has warned '.. GetPlayerName(data.target) ..' with the Reason: '.. data.reason ..'`', {
    { name = 'Admin Name:', value = '```'.. data.author ..'```' },
    { name = 'Target Name:', value = '```'.. GetPlayerName(data.target) ..' - ['.. data.target ..']```' },
    { name = 'Reason:', value = '```'.. data.reason ..'```' },
    { name = 'Action Id:', value = '```'.. data.actionId ..'```' }
  })
end)

AddEventHandler('txAdmin:events:playerKicked', function(data)
  SendToDiscord('playerKicked', 'txAdmin Kicked Player', '`'.. data.author ..' has kicked '.. GetPlayerName(data.target) ..' with the Reason: '.. data.reason ..'`', {
    { name = 'Admin Name:', value = '```'.. data.author ..'```' },
    { name = 'Target Name:', value = '```'.. GetPlayerName(data.target) ..' - ['.. data.target ..']```' },
    { name = 'Reason:', value = '```'.. data.reason ..'```' }
  })
end)

AddEventHandler('txAdmin:events:playerBanned', function(data)
  SendToDiscord('playerBanned', 'txAdmin Banned Player', '`'.. data.author ..' has banned '.. data.targetName ..' with the Reason: '.. data.reason ..'`', {
    { name = 'Admin Name:', value = '```'.. data.author ..'```' },
    { name = 'Target Name:', value = '```'.. data.targetName ..' - ['.. (data.targetNetId or 0) ..']```' },
    { name = 'Kick Message:', value = '```'.. data.kickMessage ..'```', inline = true },
    { name = 'Reason:', value = '```'.. data.reason ..'```', inline = true },
    { name = 'Duration:', value = '```'.. data.durationInput ..'```' },
    { name = 'Action Id:', value = '```'.. data.actionId ..'```' }
  })
end)

AddEventHandler('txAdmin:events:actionRevoked', function(data)
  SendToDiscord('actionRevoked', 'txAdmin Revoked Action', '`'.. data.revokedBy ..' has revoked '.. data.actionAuthor ..'`s action ('.. data.actionId ..')`', {
    { name = 'Admin Name:', value = '```'.. data.revokedBy ..'```' },
    { name = 'Action Author Name:', value = '```'.. data.actionAuthor ..'```' },
    { name = 'Type:', value = '```'.. data.actionType ..'```', inline = true },
    { name = 'Reason:', value = '```'.. data.actionReason ..'```' },
    { name = 'Action Id:', value = '```'.. data.actionId ..'```', inline = true }
  })
end)

AddEventHandler('txAdmin:events:whitelistPlayer', function(data)
  SendToDiscord('whitelistPlayer', 'txAdmin Player Whitelist', '`'.. data.adminName ..' has added/removed '.. (data.playerName or 'Unkown') ..'`s whitelist`', {
    { name = 'Admin Name:', value = '```'.. data.adminName ..'```' },
    { name = 'Whitelisted Target Name:', value = '```'.. (data.playerName or 'Unkown') ..'```' },
    { name = 'Whitelisted Target License:', value = '```'.. data.license ..'```' },
    { name = 'Type:', value = '```'.. data.action ..'```' }
  })
end)

AddEventHandler('txAdmin:events:whitelistPreApproval', function(data)
  SendToDiscord('whitelistPreApproval', 'txAdmin Player Whitelist', '`'.. data.adminName ..' has added/removed '.. (data.playerName or 'Unkown') ..'`s whitelist`', {
    { name = 'Admin Name:', value = '```'.. data.adminName ..'```' },
    { name = 'Whitelisted Target Name:', value = '```'.. (data.playerName or 'Unkown') ..'```' },
    { name = 'Whitelisted Target License:', value = '```'.. data.identifier ..'```' },
    { name = 'Type:', value = '```'.. data.action ..'```' }
  })
end)

AddEventHandler('txAdmin:events:whitelistRequest', function(data)
  SendToDiscord('whitelistRequest', 'txAdmin Player Whitelist', '`Whitelist Actions`', {
    { name = 'Admin Name:', value = '```'.. (data.adminName or 'Unkown') ..'```' },
    { name = 'Whitelisted Target Name:', value = '```'.. (data.playerName or 'Unkown') ..'```' },
    { name = 'Whitelisted Target License:', value = '```'.. (data.identifier or 'Unkown') ..'```' },
    { name = 'Type:', value = '```'.. data.action ..'```' },
    { name = 'Request Id:', value = '```'.. (data.requestId or 'Unkown') ..'```' }
  })
end)

AddEventHandler('txAdmin:events:configChanged', function(data)
  SendToDiscord('configChanged', 'txAdmin Config Changed', '`txAdmin Config has been Changed`', {
    { name = 'Message:', value = '```txAdmin Config has been Changed```' },
  })
end)

AddEventHandler('txsv:logger:menuEvent', function(player, action, allow, args)
  local argsString = ''

  if type(args) == 'table' then
    argsString = json.encode(args)
  else
    argsString = tostring(args)
  end

  SendToDiscord('ingameMenu', 'txAdmin Ingame Menu Actions', '`'.. GetPlayerName(player) ..' - ['.. player ..'] has performed ingame menu actions`', {
    { name = 'Ingame Admin Name:', value = '```'.. GetPlayerName(player) ..' - ['.. player ..']```' },
    { name = 'Action:', value = '```'.. action ..' - '.. argsString ..'```' },
    { name = 'Allow:', value = '```'.. tostring(allow) ..'```' }
  })
end)