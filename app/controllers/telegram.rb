require 'telegram/bot'

token = '149230034:AAH_Q-s-KOxWaafJwlOMDWYQLxDMHNCehVU'

Telegram::Bot::Client.run(token) do |bot|
  bot.listen do |message|
    case message.text
    when '/start'
      bot.api.send_message(chat_id: message.chat.id,
      text: "Hello, *#{message.from.first_name}*!",
      disable_web_page_preview: false, parse_mode: 'Markdown')
      bot.api.send_message(chat_id: message.chat.id,
      text: "[Visit my documentation.](https://github.com/Evshved/shved_bot)",
      disable_web_page_preview: false, parse_mode: 'Markdown')
      bot.api.send_message(chat_id: message.chat.id,
      text: "Type  _help_ for more info.",
      disable_web_page_preview: false, parse_mode: 'Markdown')
    when '/stop'
      bot.api.send_message(chat_id: message.chat.id,
      text: "Bye, #{message.from.first_name}")
    end
  end
end
