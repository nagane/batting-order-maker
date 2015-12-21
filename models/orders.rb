require 'pathname'
require 'securerandom'

class Orders
  @path = Pathname.new("./data/orders")
  @userpath = Pathname.new("./data/users")

  def self.create(title,element)
    title_id = SecureRandom.hex
    File.open(@path + title_id , "w") do |file|
      file.puts element
    end

    File.open(@userpath + title_id , "a") do |file|
      file.puts ""
    end

    File.open(@path + "orders-title-hash.txt","a") do |file|
      file.puts title_id + "," + title
    end
  end

  def self.add_order_object(title_hash_key,element)
    File.open(@path + title_hash_key , "a") do |file|
      file.puts element
    end
    p title_hash_key
  end

  def self.get_order_titles
    data = open(@path + "orders-title-hash.txt").read
    Hash[*data.split("\n").map{|e| e.split(",")}.flatten]
  end

  def self.get_order_eletemts(title_hash_key)
    data = open(@path + title_hash_key).read
    data.split("\n")
  end

  def delete

  end

  def exists?

  end
end
