require 'yaml'
class Person
  
  def initialize()
    @players = []
    @player = []
    open()
  end
  
  def open
    if File.exists?('players.yml')
      @players = YAML.load_file('players.yml')
    end
  end
  
  def save
    File.open('players.yml', 'a+') do |file|
      file.write(@player.to_yaml)
    end
  end
  
  def new_player
    puts "What is your name? "
    name = gets.chomp
    @player.push(name)
    puts "What level are you? "
    level = gets.chomp
    @player.push(level)
    save()
  end
  
  def view_player
    puts @player.inspect
  end
end

player = Person.new
player.new_player
puts "You were saved!"
player.view_player





