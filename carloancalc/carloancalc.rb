def prompt(st)
  puts("=> " + st)
end

# test if integer
def integer?(input)
  return true if Integer(input) rescue false
end

# test if float
def float?(input)
  return true if Float(input) rescue false
end

=begin
#combine integer and float test into one and test if even a number
def number?(input)
  integer?(input) || float?(input)
end
=end

# welcome the user to the application
prompt("Welcome to the payment calculator!")

loop do
  duration = ''
  amount = ''
  apr = ''

  # find out loan amount
  prompt("What is your loan amount?")

  loop do
    amount = gets().chomp()

    if integer?(amount)
      amount = amount.to_f
      break
    elsif float?(amount)
      amount = amount.to_f
      break
    else
      prompt("Please enter a valid amount")
    end
  end

  # find out loan duration in years
  prompt("What is your loan duration in years?")

  loop do
    duration = gets().chomp()

    if integer?(duration)
      duration = duration.to_f
      break
    elsif float?(duration)
      duration = duration.to_f
      break
    else
      prompt("Please enter a valid loan duration in years")
    end
  end

  # calculate loan duration in months
  monthly_duration = (duration * 12)

  # find out the apr
  prompt("What is your APR?")
  prompt("(Example: 5 for 5%, 2.5 for 2.5%")

  loop do
    apr = gets().chomp()

    if integer?(apr)
      apr = apr.to_f
      break
    elsif float?(apr)
      apr = apr.to_f
      break
    else
      prompt("Please enter a valid APR")
    end
  end

  # calculate monthly interest rate
  monthly_rate = (apr / 12)

  # output inputs/calculated info for a summary
  prompt("Amount: #{amount}")
  prompt("Monthly rate: #{monthly_rate}")
  prompt("Monthly duration: #{monthly_duration}")

  # calculate apr & monthly interest rate into values as a % of 1
  apr /= 100
  monthly_rate /= 100

  # calculate monthly payment and output it
  monthly_payment = amount * (monthly_rate / (1 - (1 + monthly_rate)**-monthly_duration))
  monthly_payment = '%.2f' % monthly_payment
  prompt("$#{monthly_payment}")

  # ask if user wants to calcualte another monthly payment
  prompt("Would you like to find out another loan's monthly payment?")
  break unless gets().chomp().downcase() == 'y'
end
