# ask the user for two numbers
# ask the user for an operation to perform
# perform the operation on the two numbers
# output the results

require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

def prompt(message)
  Kernel.puts("=> #{message}")
end

def number?(input)
  if input.to_i().to_s() == input
    return true
  elsif input.to_f().to_s() == input
    return true
  else
    return false
  end
end
  
def operation_to_message(op)
  perform = case op
            when '1'
              'Adding'
            when '2'
              'Subtracting'
            when '3'
              'Multiplying'
            when '4'
              'Dividing'
            end
  return perform
end

prompt(MESSAGES['welcome'])

name = ''
loop do
  name = Kernel.gets().chomp()

  if name.empty?()
    prompt(MESSAGES['valid_name'])
  else
    break
  end
end

prompt(MESSAGES['hi'] + "#{name}")

input_integer = ''
input_float = ''

loop do
  number1 = ''
  loop do
    prompt(MESSAGES['number1'])
    number1 = Kernel.gets().chomp()

    if number?(number1)
      break
    else
      prompt(MESSAGES['number_error'])
    end
  end

  number2 = ''
  loop do
    prompt(MESSAGES['number2'])
    number2 = Kernel.gets().chomp()

    if number?(number2)
      break
    else
      prompt(MESSAGES['number_error'])
    end
  end

  prompt(MESSAGES['operator_prompt'])

  operator = ''
  loop do
    operator = Kernel.gets().chomp()

    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt(MESSAGES['operator_error'])
    end
  end

  prompt("#{operation_to_message(operator)}" + MESSAGES['performing'])

  result = case operator
           when '1'
             result = number1.to_i + number2.to_i
           when '2'
             result = number1.to_i - number2.to_i
           when '3'
             result = number1.to_i * number2.to_i
           when '4'
             result = number1.to_f / number2.to_f
           end

  prompt(MESSAGES['result'] + "#{result}")

  prompt(MESSAGES['perform_again'])
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt(MESSAGES[thank_you])
