require 'pathname'
require 'securerandom'

class Orders
  @path = Pathname.new("./data/orders")

  def self.create(title,element)
    title_id = SecureRandom.hex
    File.open(@path + title_id , "w") do |file|
      file.puts element
    end

    if title == ""
      title = "無題"
    end

    File.open(@path + "orders-title-hash.txt","a") do |file|
      file.puts title_id + "," + title
    end
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
