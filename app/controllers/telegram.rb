require 'telegram_bot'

bot = TelegramBot.new(token: '149230034:AAH_Q-s-KOxWaafJwlOMDWYQLxDMHNCehVU', logger: Logger.new(STDOUT), offset: 123, timeout: 30)
bot.get_updates(fail_silently: false) do |message|
  puts "@#{message.from.username}: #{message.text}"
  command = message.get_command_for(bot)

  message.reply do |reply|
    case command
    when /greet/i
      reply.text = "Hello, #{message.from.first_name}!"
    else
      reply.text = "#{message.from.first_name}, have no idea what #{command.inspect} means."
    end
    puts "sending #{reply.text.inspect} to @#{message.from.username}"
    reply.send_with(bot)
  end
end
