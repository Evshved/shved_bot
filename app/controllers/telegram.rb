require 'telegram/bot'
token = '149230034:AAH_Q-s-KOxWaafJwlOMDWYQLxDMHNCehVU'
Telegram::Bot::Client.run(token) do |bot|
  bot.listen do |message|
    case message.text
    when 'start'
      bot.api.sendMessage(chat_id: message.chat.id, text: "Hello, #{message.from.first_name}")
      offset = update_id of last processed update + 1
    end
  end
end
