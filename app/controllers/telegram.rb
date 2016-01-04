require 'telegram/bot'

token = '149230034:AAH_Q-s-KOxWaafJwlOMDWYQLxDMHNCehVU'

Telegram::Bot::Client.run(token) do |bot|
  bot.listen do |message|
    case message.text
    when '/start'
      bot.api.send_message(chat_id: message.chat.id,  text: "Kallalask **asdasd** llalal 2-2-2", disable_web_page_preview: true, parse_mode: *bold text*)
    when '/stop'
      bot.api.send_message(chat_id: message.chat.id, text: "Bye, #{message.from.first_name}")
    end
  end
end
