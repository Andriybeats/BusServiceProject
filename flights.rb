class Flights
  attr_reader :departure_city, :arrival_city,:tickets,:date_departure,:date_arrival,:price,:tickets,:customers
  def initialize(departure_city, arrival_city,price,date_departure,date_arrival,seats)
    @departure_city = departure_city
    @arrival_city = arrival_city
    @price = price
    @date_departure = date_departure
    @date_arrival = date_arrival
    @tickets = Array.new(15)
    @customers = Array.new
    @seats = seats
    create_ticket
    @sold_ticket = Array.new
  end

  def show_flight
    puts "Departure_city: " + @departure_city.to_s
    puts 'Arrival_city: ' + @arrival_city.to_s
    puts 'Price: ' + @price.to_s
    puts 'Seats: ' + @seats.to_s
    puts 'Date_departure: '+  @date_departure.to_s
    puts 'Date_arrival: ' + @date_arrival.to_s+"\n"
  end

  def show_customers
    @customers.each do |customer|
      puts 'name: '+ customer.to_s
    end
  end

  def create_ticket
    @tickets.each  do |ticket|
      ticket = Tickets.new
    end
  end


  def check_ticket?(ticket)
    if @tickets[ticket] != true && @tickets.length > ticket && ticket>=0
      return true
    else
      return false
    end
  end


  def buy_ticket(ticket)
    if check_ticket?(ticket)
      @tickets[ticket]=true
      puts "You bought ticket"
    else
      puts 'You can`t buy this ticket'
    end
  end

  def sold_ticket?
    @tickets.each do |ticket|
      if ticket == true
        return false
      else
        return true
      end
    end
  end

end