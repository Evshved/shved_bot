require 'telegram/bot'
token = '149230034:AAH_Q-s-KOxWaafJwlOMDWYQLxDMHNCehVU'
=begin
class BotFitcher
  def initialize(name)
    @name = name
  end

  def filtering
    @name = `curl http://geektimes.ru/post/268688/`
  end
end
=end


#text = BotFilter.new(name).filtering
#text = `curl http://geektimes.ru/post/268688/`
text = "11"
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
    when '/test'
      bot.api.send_message(chat_id: message.chat.id,
      text: "111#{text}",
      disable_web_page_preview: false, parse_mode: 'Markdown')

    when '/stop'
      bot.api.send_message(chat_id: message.chat.id,
      text: "Bye, #{message.from.first_name}")

    when '/help'
      bot.api.send_message(chat_id: message.chat.id,
      text: "You can control me by sending these commands:
      \n/start - Blabla\n/stop - Blabla\n/help - Blabla",
      disable_web_page_preview: false, parse_mode: 'Markdown')

    else
      bot.api.send_message(chat_id: message.chat.id,
      text: "You can control me by sending these commands:
      \n/start - Blabla\n/stop - Blabla\n/help - Blabla",
      disable_web_page_preview: false, parse_mode: 'Markdown')
    end
  end
end
