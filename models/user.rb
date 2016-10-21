

class User
  attr_reader :email, :password
  attr_accessor :count

  def initialize(email, password)
    @email = email
    @password = password
    @count = 0
  end

  def increment
    @count += 1
  end

end
