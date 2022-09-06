# require_relative './data/NASDAQ.txt'
# require_relative './data/NYSE.txt'

def seed_symbols
  nas = File.open("db/data/NASDAQ.txt")
  nas.readlines.each do |line|
    temp = Regexp.quote(line.chomp).split('\\')
    inv = Ticker.create(name: temp.shift, description: temp.join)
  end

  ny = File.open("db/data/NYSE.txt")
  ny.readlines.each do |line|
    temp = Regexp.quote(line.chomp).split('\\')
    inv = Ticker.create(name: temp.shift, description: temp.join)
  end
end