=begin
class Player
  @lives
  @answer?
class Console
  @@current player
  self.game_end?
  self.generate_two_nums
  @@expect_answer
  self.correct?
=end
# require "./Player"


class Console
  attr_accessor :p1, :p2, :game_end, :curr_player, :answer
  def initialize(p1, p2)
    self.p1 = p1
    self.p2 = p2
    self.game_end = false
    self.curr_player = p1
    self.answer = nil
  end

  def check_game_end
    if (p1.lives == 0 || p2.lives == 0)
      self.game_end = true
      puts "----- GAME OVER -----"
      puts "Good bye!"
    else 
      puts "----- NEW TURN -----"
    end
  end

  def random_num
    rand(1..20)
  end
  
  def display_lives
    puts "P1: #{self.p1.lives}/3 vs P2: #{self.p2.lives}/3"
  end

  def make_question
    num1 = self.random_num
    num2 = self.random_num
    player = (self.curr_player == self.p1)? "Player 1" : "Player 2"
    puts "#{player}: What does #{num1} plus #{num2} equal?"
    self.answer = num1 + num2
  end

  def answer_correct?(bool)
    sentence = ""
    player = (self.curr_player == self.p1)? "Player 1" : "Player 2"
    if (bool) 
      sentence = "#{player}: YES! You are correct."
    else
      sentence = "#{player}: Seriously? No!"
      self.curr_player.lives -= 1
    end
    puts sentence
  end

  def start_game
    while(!self.game_end) do
      make_question
      answer_correct?(self.answer == self.curr_player.answer_question.to_i)
      display_lives
      check_game_end
      self.curr_player = (self.curr_player == self.p1)? self.p2 : self.p1
    end
  end

end