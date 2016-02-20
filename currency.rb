require 'net/http'
require 'json'

count = ARGV[0] || 1000
currency = ARGV[1] || 'BYR'
case currency.downcase
when 'byr'
  selector = 'USDBYR,EURBYR,RUBBYR'
when 'usd'
  selector = 'BYRUSD,EURUSD,RUBUSD'
when 'eur'
  selector = 'BYREUR,USDEUR,RUBEUR'
when 'RUB'
  selector = 'BYRRUB,USDRUB,EURRUB'
else
  selector = 'USDBYR,EURBYR,RUBBYR'
end



url = 'https://query.yahooapis.com/v1/public/yql?q=select+*+from+yahoo.finance.xchange+where+pair+=+%22' + selector + '%22&format=json&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys&callback='
uri = URI(url)
response = Net::HTTP.get(uri)
parsed = JSON.parse(response)
parsed["query"]["results"]["rate"].each do |cur|
  s = "\e[1;91m" + cur["Name"].split('/').first + "\e[0m " + (count.to_i / cur["Rate"].to_f).round(3).to_s
  puts s
end
