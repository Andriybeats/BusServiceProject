class BusService
  def initialize
    @flights=Array.new
    @bought_ticket=Array.new
  end

  def add_flight
    printf "\nInput\nDeparture city: "
    @departure_city=gets.chomp
    printf "City of arrival: "
    @arrival_city=gets.chomp
    printf "Price: "
    @price=gets.to_i
    printf "Date departure: "
    @departure_date=Time.mktime(gets)
    printf "Date of arrival: "
    @arrival_date=Time.mktime(gets)
    printf "Seats: "
    @seats=gets.chomp.to_i
    @flight=Flights.new(@departure_city,@arrival_city,@price,@departure_date,@arrival_date,@seats)
    @flights.push(@flight)
  end

  def show_flights
    if @flights.empty?
      puts "\nCurrently are no flights\n"
    else
      @flights.each do |flight|
      puts "\n\t\t\tFlight number: "+@flights.index(flight).to_s
      flight.show_flight
      end
    end

  end

  def del_flight
    puts "\nInput number of flight:"
    @number=gets.to_i
    if @flights.length>@number&&@number>=0
      if @flights[@number].sold_ticket?
        @flights.delete_at(@number)
        puts "Flight deleted"
      else
        puts 'Tickets is realized, you can`t delete flight`'
      end

    else
      puts "Wrong number of flight!"
    end
  end

  def update_flight
    puts "Input number of flight:"
    @number=gets.to_i
    if @flights.length>@number&&@number>=0
      if  @flights[@number].sold_ticket?
        @flights.delete_at(@number)
        add_flight
        @flight=@flights[@flights.length-1]
        @flights.pop
        @flights.insert(@number,@flight)
        puts "Flight updated"
      else
        puts 'Tickets is realized'
      end

    else
      puts "Wrong number of flight!"
    end

  end

  def filter_city(city)
    @flights.each do |flight|
      if flight.departure_city == city.to_s
        printf "\t\t\tFlight number: "+@flights.index(flight).to_s
        flight.show_flight
      else
        @flag=false
      end

    end

    if @flag == false
      puts "Not founded"
    end

  end

  def filter_date(date)
    @flights.each do |flight|
      if flight.date_departure == date
        printf "\t\t\tFlight number: "+@flights.index(flight).to_s
        flight.show_flight
      else
        @flag = false
      end

    end

    if @flag==false
      puts "Not founded"
    end

  end

  def filter_date_city(date,city)
    @flights.each do |flight|
      if flight.date_departure == date && flight.departure_city == city.to_s
        printf "\t\t\tFlight number: " + @flights.index(flight).to_s
        flight.show_flight
      else
        @flag = false
      end

    end

    if @flag==false
      puts "Not founded"
    end

  end

  def buy_ticket(name)
    if @flights.empty?
      puts "\n Not any flights "
    else
    puts "\nInput number of flight:"
    @number_flight=gets.to_i
    if @flights.length > @number_flight && @number_flight >= 0
      puts "\nInput number of seat:"
      @seat=gets.to_i
      if @flights[@number_flight].check_ticket?(@seat)
        @flights[@number_flight].buy_ticket(@seat)
        @bought_ticket.push(@flights[@number_flight])
        @flights[@number_flight].customers.push(name);
      else
        puts 'You can`t buy this ticket'
        return
      end

    else
      puts "Wrong value"
    end

    end

  end

  def show_sold_tickets
    @flights.each do |flight|
      puts "Number of flight:"+@flights.index(flight).to_s
      if flight.customers.empty?
      puts "Not sold any tickets "
      else
        flight.show_customers
        puts
      end

    end

  end

  def show_bought_tickets
    if @bought_ticket.empty?
      puts "\nYou don`t have any bought tickets"
    else
      @bought_ticket.each do |flight|
        puts
        flight.show_flight
      end
    end
  end



end
