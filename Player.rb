class Player
  attr_accessor :lives
  def initialize
    self.lives = 3
  end

  def answer_question
    gets.chomp
  end
end