class Person
  attr_accessor :bank_account
  attr_reader :name, :happiness, :hygiene

  def happiness=(happiness)
    if (happiness < 10 && happiness > 0)
      @happiness = happiness
    elsif (happiness >= 10)
      @happiness = 10
    else
      @happiness = 0
    end
  end

  def hygiene=(hygiene)
    if (hygiene < 10 && hygiene > 0)
      @hygiene = hygiene
    elsif (hygiene >= 10)
      @hygiene = 10
    else
      @hygiene = 0
    end
  end

  def initialize(name, bank_account = 25, happiness = 8, hygiene = 8)
    @name = name
    self.send("bank_account=", bank_account)
    self.send("happiness=", happiness)
    self.send("hygiene=", hygiene)
  end

  def clean?
    @hygiene > 7
  end

  def happy?
    @happiness > 7
  end

  def get_paid(amount)
    self.bank_account = (amount + @bank_account)
    "all about the benjamins"
  end

  def take_bath
    self.hygiene = (@hygiene + 4)
    "♪ Rub-a-dub just relaxing in the tub ♫"
  end

  def work_out
    self.hygiene = (@hygiene - 3)
    self.happiness = (@happiness + 2)
    "♪ another one bites the dust ♫"
  end

  def call_friend(friend)
    self.happiness = (@happiness + 3)
    friend.happiness = (friend.happiness + 3)
    "Hi #{friend.name}! It's #{@name}. How are you?"
  end

  def start_conversation(friend, topic)
    case topic
    when "politics"
      self.happiness = (@happiness - 2)
      friend.happiness = (friend.happiness - 2)
      "blah blah partisan blah lobbyist"
    when "weather"
      self.happiness = (@happiness + 1)
      friend.happiness = (friend.happiness + 1)
      "blah blah sun blah rain"
    else
      "blah blah blah blah blah"
    end
  end
end
