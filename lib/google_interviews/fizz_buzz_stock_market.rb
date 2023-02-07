
class Offer
  attr_reader :type, :name, :quantity

  def initialize(type, name, quantity)
    @type = type
    @name = name
    @quantity = quantity
  end
end

def print_matches(offers)
  fizzes = []
  buzzes = []

  offers.each do |offer|
    offer.type == 'Fizz' ? fizzes << offer : buzzes << offer
  end

  while fizzes && buzzes
    first_fizz = fizzes.first
    first_buzz = buzzes.first

    if first_fizz.quantity < first_buzz.quantity
      print(first_fizz, first_buzz, first_fizz.quantity)
      fizzes.shift
      first_buzz.quantity -= first_fizz.quantity
    elsif first_fizz.quantity > first_buzz.quantity
      print(first_fizz, first_buzz, first_buzz.quantity)
      buzzes.shift
      first_fizz.quantity -= first_buzz.quantity
    else
      print(first_fizz, first_buzz, first_buzz.quantity)
      buzzes.shit
      fizzes.shif
    end
  end
end

def print(offer1, offer2, quantity)

end






