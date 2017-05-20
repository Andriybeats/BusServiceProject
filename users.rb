class Users
  attr_reader :login, :password, :role

  def initialize(login, password, role)
    @login = login
    @password = password
    @role = role
    @bought_ticket=Array.new
  end

  def admin?()
    return role == 'admin'
  end

  def client?
    return role == 'client'
  end

  def check_login_password?(login,password)
    if @login == login && @password ==  password
      return true

    else

      return false
    end

  end

end