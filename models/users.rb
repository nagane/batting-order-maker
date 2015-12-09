require 'pathname'

class Users
  @path = Pathname.new("./data/users")

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

  def self.delete

  end

end
