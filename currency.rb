require 'net/http'
require 'json'

count = ARGV[0] || 1000
currency = ARGV[1] || 'BYR'
isByr = false

case currency.downcase
when 'byr'
  selector = 'USDBYR,EURBYR,RUBBYR'
  isByr = true
when 'usd'
  selector = 'USDBYR,USDEUR,USDRUB'
when 'eur'
  selector = 'EURBYR,EURUSD,EURRUB'
when 'rub'
  selector = 'RUBBYR,RUBUSD,RUBEUR'
else
  selector = 'USDBYR,EURBYR,RUBBYR'
  isByr = true
end

url = 'https://query.yahooapis.com/v1/public/yql?q=select+*+from+yahoo.finance.xchange+where+pair+=+%22' + selector + '%22&format=json&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys&callback='
uri = URI(url)
response = Net::HTTP.get(uri)
parsed = JSON.parse(response)
parsed["query"]["results"]["rate"].each do |cur|
  money = isByr ? (count.to_i / cur["Rate"].to_f).round(3).to_s : (count.to_i * cur["Rate"].to_f).round(3).to_s
  s = "\e[1;91m" + (isByr ? cur["Name"].split('/')[0] : cur["Name"].split('/')[1] ) + "\e[0m " + money
  puts s
end
