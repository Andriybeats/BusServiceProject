require File.expand_path(File.dirname(__FILE__) + '/users')
require File.expand_path(File.dirname(__FILE__) + '/tickets')
require File.expand_path(File.dirname(__FILE__) + '/flights')
require File.expand_path(File.dirname(__FILE__) + '/bus_service')

class Menu
  def initialize
    @service=BusService.new
    create_users
  end


  def choose_action
    while @action != 0
      puts "\nInput\n1-Login\n0-Exit"
      printf "Choice:"
      @action=gets.to_i
      case @action
        when 1
          @role = nil
          sign_in
          case @role
            when 'admin'
              admin_choose_action
            when 'client'
              client_choose_action
            else
              puts "\nWrong login or password"
          end

        when 0
            exit
            else
              puts "\nWrong value"
      end
    end
  end

  def sign_in
    printf "\nInput (admin,1/user,122) \nLogin:"
    login = gets.chomp
    printf "Password:"
    password=gets.chomp

    @users.each do |user|
      if user.check_login_password?(login, password)
        @role = user.role
        @login = user.login
      end
    end
  end

  def admin_choose_action
    while @action != 10
      puts "\nChoose: \n1-Show all flights\n2-Add flight\n3-Delete flight\n4-Update flight\n5-Show sold ticket\n10-Back\n0-Exit"
      printf "Choice:"
      @action = gets.to_i
      case @action
        when 1
          @service.show_flights
        when 2
          @service.add_flight
        when 3
          @service.del_flight
        when 4
          @service.update_flight
        when 5
          @service.show_sold_tickets
        when 10
          return
        when 0
          exit
        else
          puts "Wrong value"
      end
    end
  end

  def client_choose_action
    while @action != 10
      puts "\nChoose: \n1-Show all flights\n2-Find city\n3-Find date\n4-Find city and date\n5-Buy ticket\n6-Show bought ticket\n10-Back\n0-Exit"
      printf "Choice:"
      @action = gets.to_i
      case @action
        when 1
          @service.show_flights
        when 2
          puts 'Input city:'
          city = gets.chomp
          @service.filter_city(city)
        when 3
          puts 'Input date:'
          date = Time.mktime(gets)
          @service.filter_date(date)
        when 4
          puts 'Input city:'
          city=gets.chomp
          puts 'Input date:'
          date = Time.mktime(gets)
          @service.filter_date_city(date, city)
        when 5
          @service.buy_ticket(@login)
        when 6
          @service.show_bought_tickets
        when 10
          return
        when 0
          exit
        else
          puts "Wrong value"
      end
    end
  end

  def create_users
    @users = [Users.new('admin', '1', 'admin'), Users.new('user', '122', 'client')]
  end


end


@menu=Menu.new

@menu.choose_action
