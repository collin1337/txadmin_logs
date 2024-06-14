Config = {}

Config.WebhookSettings = {
  ['user'] = {
    name = 'TXADMIN x LOGS', -- USERNAME
    icon_url = nil -- INSERT LINK OR LEAVE AS IS
  },

  ['embed'] = {
    ['author'] = {
      name = 'TXADMIN x LOGS', -- EMBED AUTHOR
      url = 'https://github.com/collin1337', -- URL
      icon_url = nil -- INSERT LINK OR LEAVE AS IS
    },
    ['color'] = '16711680', -- Color [https://www.spycolor.com/ / Decimal value]
    ['footer'] = {
      text = 'by collin1337 - '.. os.date('%d.%m.%Y - %X'),
      icon_url = nil -- INSERT LINK OR LEAVE AS IS
    }
  }
}

Config.Webhooks = {
  ['playerHealed'] = 'https://discord.com/api/webhooks/', -- WEBHOOK
  ['playerDirectMessage'] = 'https://discord.com/api/webhooks/', -- WEBHOOK
  ['globalAnnouncement'] = 'https://discord.com/api/webhooks/', -- WEBHOOK
  ['playerWarned'] = 'https://discord.com/api/webhooks/', -- WEBHOOK
  ['playerKicked'] = 'https://discord.com/api/webhooks/', -- WEBHOOK
  ['playerBanned'] = 'https://discord.com/api/webhooks/', -- WEBHOOK
  ['actionRevoked'] = 'https://discord.com/api/webhooks/', -- WEBHOOK
  ['whitelistPlayer'] = 'https://discord.com/api/webhooks/', -- WEBHOOK
  ['whitelistPreApproval'] = 'https://discord.com/api/webhooks/', -- WEBHOOK
  ['whitelistRequest'] = 'https://discord.com/api/webhooks/', -- WEBHOOK
  ['configChanged'] = 'https://discord.com/api/webhooks/' -- WEBHOOK
}