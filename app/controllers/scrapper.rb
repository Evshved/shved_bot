require 'open-uri'
require 'nokogiri'
require 'json'
class Worker
  def initialize(index_page)
    @index_page = index_page
  end

  def process
    url = "http://servers-monitoring.ru/servera-cs/#{@index_page}/"
    html = open(url)

    doc = Nokogiri::HTML(html)
    showings = []
    doc.css('.row1').each do |showing|
      description = showing.at_css('.td_currentmap').text
      ip_adress = showing.at_css('.td_ipadress').text
      online = showing.at_css('.td_players').text
      slash = online.index("/")
      players_online = online[0..-slash].to_i
      players_max = online[slash+1..-1].to_i
      if (description == 'de_dust2_2x2') && (players_online > 5) && (players_max < 20)
        showings.push(
        description: description,
        ip: ip_adress,
        online: online
        )
      end
    end
    File.open("test.txt", 'a')  { |f|
      f.puts "Parsing page number#{@index_page}"
      f.puts JSON.pretty_generate(showings)
    }
  end
end

class Output

  def initialize(index_page)
    @index_page = index_page
  end

  def writer
    File.open("test.txt", 'w')
    while @index_page <= 6 do
      work = Worker.new(@index_page)
      work.process
      @index_page = @index_page + 1
    end
  end
end

out = Output.new(1)
out.writer
