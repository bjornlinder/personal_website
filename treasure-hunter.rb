#Game Design - Treasure Hunter - by Bjorn Linder
#A grid-based game of searching for hidden artifacts.

class Game

  attr_reader :width, :length, :location
  #I want to return a different distribution of items at each level of the map.
  #Ideally this section would not require three global variables and repeat code.

  def populate level
    if level==0
      return @items1[rand(10)]
    elsif level==1
      return @items2[rand(10)]
    elsif level==2
      return @items3[rand(10)]
    end
  end

  # function populate(items, level) {
  # 	if (level === 0) {
  # 		return items[Math.rand]
  # 	}
  # }

  #Treasure generation for the entire map is done here in the map initialization.
  #The game could also be coded to roll for treasure every time the user digs for it.
  def generate
    for i in 0..@dimensions[0]-1
      for j in 0..@dimensions[1]-1
        for k in 0..@d-1
          item=populate k
          if item!=0          
            @grid[[i,j,k]]=item
          end
        end
      end
    end
  end
  #how would I best avoid initializing the artifact arrays & strings each time this method is called?
  #All I can think of right now is using more global variables.
  def self.find_artifact (type) 
    artifacts = [
    '',
    '',
    ["Camembert","Parmesan","Cheddar","Wisconsin","Brie","Stinky","Blue","Gorgonzola","Goat","Gouda"],
    ["human","neanderthal","sasquatch","velociraptor","human child","buffalo","alien"],
    ["Mayan","Greek","Chinese","Collector's Edition","Persian","Roman"],
    ["Aaron the Aardvark","Commando Frog","Wile E. Coyote","killer rabbit","Chupacabra","Tobbits the Hobbit","Pikachu","Ling-Ling"]
    ]
    return artifacts[type][rand(artifacts[type].length)]
    
    # artifacts = {}
  #   artifacts["cheeses"] = ["Camembert","Parmesan","Cheddar","Wisconsin","Brie","Stinky","Blue","Gorgonzola","Goat","Gouda"]
  #   artifacts["bones"] = ["human","neanderthal","sasquatch","velociraptor","human child","buffalo","alien"]
  #   artifacts["civs"] = ["Mayan","Greek","Chinese","Collector's Edition","Persian","Roman"]
  #   artifacts["animals"] = ["Aaron the Aardvark","Commando Frog","Wile E. Coyote","killer rabbit","Chupacabra","Tobbits the Hobbit","Pikachu","Ling-Ling"]
  # 
  #   return artifacts[type][rand(artifacts[type].length)]
  end

  def self.output (item)
    type = find_artifact(item)
    output = [
    "You find nothing.",
    "You found some crap. No really, it seems a dog conducted some business and cleaned up after itself.",
    "You find a hunk of #{type} cheese. It's still wrapped up and hasn't expired yet either. Weird.",
    "You find some ancient #{type} gold coins. Congratulations.",
    "You find some bones. As you continue digging, you find the remainder of a #{type} skeleton.",
    "You have disturbed the #{type} resting in its burrow. The angry #{type} attacks and you barely escape with your life"
    ]
    return output[item]
  end
    
    
  #   @output[0]=("You find nothing.")
  #   @output[1]=("You found some crap. No really, it seems a dog conducted some business and cleaned up after itself.")
  #   if item==2
  #     cheese=find_artifact ("cheeses")
  #     @output[2]="You find a hunk of #{cheese} cheese. It's still wrapped up and hasn't expired yet either. Weird."
  #   elsif item==3
  #     coin=find_artifact ("civs")
  #     @output[3]="You find some ancient #{coin} gold coins. Congratulations."
  #   elsif item==4
  #     bones=find_artifact ("bones")
  #     @output[4]="You find some bones. As you continue digging, you find the remainder of a #{bones} skeleton."
  #   elsif item==5
  #     animal=find_artifact ("animals")
  #     @output[5]="You have disturbed the #{animal} resting in its burrow. The angry #{animal} attacks and you barely escape with your life"
  #   end
  #   return @output[item]
  # end

  def self.treasure (depth)
    distribution = [
      [0,0,0,0,0,1,1,2,5,5],
      [0,0,0,0,0,0,0,1,2,4],
      [0,0,0,0,0,0,2,3,3,4]]
    output(distribution[depth][rand(10)])
  end

  def initialize
    puts "Initialize called. Game dimensions 4x4 or null: " 
    puts @dimensions

    @items1=[0,0,0,0,0,1,1,2,5,5]
    @items2=[0,0,0,0,0,0,0,1,2,4]
    @items3=[0,0,0,0,0,0,2,3,3,4]
    @grid=Hash.new(0) #The grid, aka gameboard
    @d=3              #Number of levels down items are generated.
    # @location=[0,0,0] #Current location
    @output=[]        #Output generated when user digs for items
    @dimensions=[4,4]    #Size of map as entered by user
    #The grid is set up as a hash so that data is only stored for those tiles that have an item or have been dug out.
    @width = @dimensions[0]
    @length = @dimensions[1]
  
    #puts "Welcome to Treasure Hunter! Before we begin, I must warn you that this game has no purpose. \
    #There is no way to win or lose. In fact, I'm hoping to inspire existential angst and despair \
    #when you see that in the long run, nothing you do really matters. Well, have fun playing!"
    #puts "How large would you like the gameboard to be?
    #Please enter the desired board dimensions in the format 'x.y' (for example, '5.7')."
    #@dimensions=player_input('init').split(".").map{|s| s.to_i}
    #unless @dimensions.length == 2 && (@dimensions[0] > 0 && @dimensions[1] > 0) 
    #  puts "It's really not supposed to be that hard. Try again."
    #end
    puts "Type 'dig' to search for buried treasure, 'map' to display your location,'move (n/s/e/w)' to move in the given direction, or 'done' to exit the game."
    #return
    generate
    # turn('first move')
  end

  # def move dir
  #   @location[2]=0
  #   if dir=="n"
  #     @location[0]=@location[0].+1
  #   elsif dir=="s"
  #     @location[0]=@location[0].-1
  #   elsif dir=="e"
  #     @location[1]=@location[1].+1
  #   elsif dir=="w"
  #     @location[1]=@location[1].-1
  #   else
  #     puts "DOES NOT COMPUTE. REPORT CODE 00000000001011101111 TO ADMINISTRATOR."
  #     return false
  #   end
  #   if @location[0]>=@dimensions[0]||@location[0]<0||@location[1]<0||@location[1]>=@dimensions[1]
  #     abort dir
  #     return false
  #   else
  #     return true
  #   end
  # end

  def display #displays the grid in current state
    display=[]
    for i in 0..@dimensions[0]-1
      row=[]
      for j in 0..@dimensions[1]-1
        current=@grid[[i,j,0]]
        if [i,j]==[@location[0],@location[1]]
          row.push("X")
          #elsif current=="dug"   Not fully working yet
        #  row.push(current)
        else
          row.push(0)
        end
      end
      display[i]=row
      #puts row.inspect
    end
    display.reverse_each do |i|
      puts i.inspect
    end
  end
    
  # def player_input(input)
  #   #call turn from html
  #   #Ajax
  #   
  #   #do javascript?
  #   #prompt user for input
  #   #$(document).on('click.remote', '.remote', function() {
  #   #  // a similar ajax call to the one rails uses
  #   #});
  #   input = gets.chomp
  #   return input
  # end

  def turn (input)
    #puts @grid
    if input=="done"
      puts "Have a nice day!"
      exit
    elsif input=="map"
     display
    elsif input.include? "dig"
      dig
      puts "Would you like to dig or move?"
    elsif ((input.include? "move") && (input[-2,2]!="ve"))
      dir=input[-1,1]
      if move dir
        puts "You move one tile #{dir}. Care for some wine?"
      end
    else
      puts "Please type 'dig', 'move (n/s/e/w)', or 'done'."
    end
    #turn
  end

end
