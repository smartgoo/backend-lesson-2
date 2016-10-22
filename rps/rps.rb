VALID_CHOICES = %w(rock paper scissors spock lizard)
WINS_AGAINST = { 'rock' => %w(scissors lizard),
                 'paper' => %w(spock rock),
                 'scissors' => %w(lizard paper),
                 'spock' => %w(rock scissors),
                 'lizard' => %w(spock paper) }
SHORTHAND_ENTRIES = { 'r' => 'rock',
                      'p' => 'paper',
                      's' => 'scissors',
                      'o' => 'spock',
                      'l' => 'lizard' }

def prompt(message)
  Kernel.puts("=> #{message}")
end

def result?(first, second)
  if WINS_AGAINST[first].include?(second)
    'won'
  elsif WINS_AGAINST[second].include?(first)
    'lost'
  else
    'tied'
  end
end

def display_results(player, computer)
  if result?(player, computer) == 'won'
    prompt("You won!")
  elsif result?(player, computer) == 'lost'
    prompt("You lost!")
  else
    prompt("You tied!")
  end
end

def clear_screen
  system('clear') || system('cls')
end

clear_screen

game_welcome = <<-MSG
Welcome to Rock Paper Scissors Spock Lizard!

   The rules are as follows:

   First to 5 wins the game
   -----------------------------------------------
   Scissors cuts Paper
   Paper covers Rock
   Rock crushes Lizard
   Lizard poisons Spock
   Spock smashes Scissors
   Scissors decapitates Lizard
   Lizard eats Paper
   Paper disproves Spock
   Spock vaporizes Rock
   Rock crushes Scissors
   -----------------------------------------------
   You can use the following shorthand choices:
   r for rock
   p for paper
   s for scissors
   o for spock
   l for lizard
   -----------------------------------------------

  MSG

prompt(game_welcome)
user_score = 0
computer_score = 0

until user_score == 5 || computer_score == 5
  choice = ''

  prompt("Enter your choice!")
  loop do
    entry = Kernel.gets().chomp()

    if entry.size > 1
      choice = entry
      if VALID_CHOICES.include?(entry)
        break
      else
        prompt("That is not a valid choice")
      end
    elsif entry.size == 1
      choice = SHORTHAND_ENTRIES[entry.downcase]
      if VALID_CHOICES.include?(choice)
        break
      else
        prompt("That's not a valid choice.")
      end
    end
  end

  computer_choice = VALID_CHOICES.sample

  Kernel.puts("You chose: #{choice}. Computer chose: #{computer_choice}.")

  display_results(choice, computer_choice)
  match_result = result?(choice, computer_choice)
  if match_result == 'won'
    user_score += 1
  elsif match_result == 'lost'
    computer_score += 1
  end

  prompt("User: #{user_score}. Computer: #{computer_score}")
end

if user_score == 5
  prompt("You won!")
else
  prompt("Computer won!")
end
