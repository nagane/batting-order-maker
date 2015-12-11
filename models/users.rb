require 'pathname'

class Users
  @path = Pathname.new("./data/users")

  UserData = Struct.new(
    :name,
    :first,
    :second,
    :third,
    :fourth,
    :fifth,
    :sixth,
    :seventh,
    :ehghth,
    :ninth,
    :starter,
    :setupman,
    :closer
  )

  def self.create(params)
    File.open(@path + params[:hash] , "a") do |file|
      file.print params[:name] 
      file.print ","
      (1..9).each do |num|
        file.print params.invert[num.to_s]
        file.print ","
      end
      file.print "\n"
    end
  end

  def self.get_inputed_date(order_key)
    users_data = []
    # File.open(@path + order_key) do |file| でやろうとすると上手くいかない
    data = File.open(@path + order_key).read
    data.split("\n").each do |line|
      userdata = line.split(",")
      users_data.push(UserData.new(*userdata))
    end
  end

  def self.delete

  end

end
