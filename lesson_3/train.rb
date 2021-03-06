class Train < Route
  @@arr_train = []  
  @@hash_kind_quantity = {}
  
  attr_accessor :speed
  attr_reader   :quantity_wagon

  def initialize(speed=0, number_train, kind_train, quantity_wagon)
    @number_train = number_train
    @kind_train = kind_train
    @quantity_wagon = quantity_wagon
    @speed = speed
  end

  def save
    @@arr_train << @number_train
    @@hash_kind_quantity[@number_train] = @kind_train             
  end

  def stop
    self.speed = 0
  end

  def new_wagon
    @quantity_wagon += 1 if @speed == 0
    puts @quantity_wagon
  end

  def destroy_wagon
    @quantity_wagon -= 1 if @speed == 0
    puts @quantity_wagon
  end

  def route_train
    puts @@arr_station.join(", ")
  end

  def arrive(name_station)
    @name_station = name_station
    if @@arr_station.include?(@name_station)
      puts "Train arrived in #{name_station}"
    else
      puts "This station isn't include in route"
    end

    hash = Hash[@@arr_station.map.with_index.to_a]
    index = hash[@name_station]

    if index == nil
      puts "Try to enter other station"
    elsif index == 0
      puts "It's initial station, next station is #{@@arr_station[index + 1]}"
    elsif index == @@arr_station.size - 1
      puts "It's final station, previous station is #{@@arr_station[index - 1]}"
    else
      puts "previous station is #{@@arr_station[index - 1]}, next station is #{@@arr_station[index + 1]}"
    end
  end
end