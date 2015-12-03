require 'pathname'
require 'securerandom'

class Orders
  @path = Pathname.new("./data")

  def self.create(title,element)

    title_id = SecureRandom.hex
    File.open(@path + title_id , "w") do |file|
      file.puts element
    end

    File.open(@path + "orders-title-hash.txt","a") do |file|
      file.puts title_id + "," + title
    end

  end

  def self.get_order_titles
    #todo topページにorder要素があればリンクを作りたい
    File.read(@path + "orders-title-hash.txt")
  end

  def delete

  end

  def exists?

  end
end
