class Game
  def self.find_artifact(type)
    artifacts = [
      '',
      '',
      %w(Camembert Parmesan Cheddar Wisconsin Brie Stinky Blue Gorgonzola Goat Gouda),
      ['Mayan', 'Greek', 'Chinese', "Collector's Edition", 'Persian', 'Roman'],
      ['human', 'neanderthal', 'sasquatch', 'velociraptor', 'human child', 'buffalo', 'alien'],
      ['Aaron the Aardvark', 'Commando Frog', 'Wile E. Coyote', 'killer rabbit', 'Chupacabra', 'Tobbits the Hobbit', 'Pikachu', 'Ling-Ling']
    ]
    artifacts[type][rand(artifacts[type].length)]
  end

  def self.output(item)
    type = find_artifact(item)
    output = [
      'You find nothing.',
      'You found some crap. No really, it seems a dog conducted some business and cleaned up after itself.',
      "You find a hunk of #{type} cheese. It's still wrapped up and hasn't expired yet either. Weird.",
      "You find some ancient #{type} gold coins. Congratulations.",
      "You find some bones. As you continue digging, you find the remainder of a #{type} skeleton.",
      "You have disturbed the #{type} resting in its burrow. The angry #{type} attacks and you barely escape with your life"
    ]
    output[item]
  end

  def self.treasure(depth)
    distribution = [
      [0, 0, 0, 0, 0, 1, 1, 2, 5, 5],
      [0, 0, 0, 0, 0, 0, 0, 1, 2, 4],
      [0, 0, 0, 0, 0, 0, 2, 3, 3, 4]]
    output(distribution[depth][rand(10)])
  end
end
