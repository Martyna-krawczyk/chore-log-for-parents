# frozen_string_literal: true

require 'colorize'
require 'tty-prompt'
require 'rubocop'
require 'tty-font'

font = TTY::Font.new(:doom)
puts font.write("Chorely")

PROMPT = TTY::Prompt.new

chore1 = {
  task:"Vacuum house",
  value: 3.00
}
chore2 = {
  task:"Mop floors",
  value: 4.00
}
chore3 = {
  task:"Clean toilet",
  value: 5.00
}

user = {
  total_balance: 0.0,
  tasks: []
}

chores = [chore1, chore2, chore3] 

def view_menu
  puts "1. View and log completed chores".colorize(:light_magenta)
  puts "2. Add custom chore to list".colorize(:light_magenta)
  puts "3. Remove chore from list".colorize(:light_magenta)
  puts "4. View balance and completed chores".colorize(:light_magenta)
  puts "5. Payout your child" .colorize(:light_magenta)
  puts "6. Exit".colorize(:light_magenta)
end

def view_chores_list(chores)
  for chore in chores
    puts "__________________________________".colorize(:blue)
    puts "Chore: #{chore[:task]}"
    puts "Worth: $#{chore[:value]}0".colorize(:light_green)
    puts "__________________________________".colorize(:blue)
    puts ""
  end
end

def user_data(chores, user)
  answer = PROMPT.select("Which chore has your child completed?", chores.map {|i| i[:task]})
  
  user[:tasks] << answer
  
  selected_chore = chores.find do |chore|
    chore[:task] == answer
  end
  
  user[:total_balance] =  user[:total_balance] + selected_chore[:value]
  system("clear")
  puts "Fantastic! $#{selected_chore[:value]}0 has been added to your child's balance!".colorize(:green)
end

def add_new_chore(chores)
  puts "Type in your new chore to add to the list:"
  print "> "
  task = STDIN.gets.chomp.capitalize
  puts "How much would you like to pay your child for this chore(enter without $ eg. 1.00)?"
  print "> "
  value = STDIN.gets.chomp.to_f
  
  chore = {
    task: task,
    value: value
  }
  chores.push(chore)
  system("clear")
  view_chores_list(chores)
  puts "Your custom chore has been added to the list.".colorize(:blue)
  chores
end

def remove_chore(chores)
  view_chores_list(chores)
  puts "Type in the name of the chore to remove from the list"
  print "> "
  task = STDIN.gets.strip.capitalize
  chores.each do |chore| 
    if chore[:task] == task
      puts "Are you sure you want to remove this chore?"
      print "> "
      confirm = STDIN.gets.strip
      if confirm.downcase == 'yes' 
        index = chores.index(chore)
        chores.delete_at(index)
        system("clear")
        puts "Chore successfully deleted".colorize(:blue)
        view_chores_list(chores)
        return chores
      else
        system("clear")
        puts "Chore has not been deleted".colorize(:red)
        break
      end
    else
      # Check if this is the final iteration.
      if chores.index(chore) == chores.length - 1
        if chore[:task] != task
          puts "This chore isn't on the list. Push 3 to try again.".colorize(:red) 
        end
      end
    end 
  end
end

def print_balance(user)
  system("clear")
  puts "Your Child's Current Balance is $#{user[:total_balance]}0 for completion of the following task(s):"
  user[:tasks].each do |task|
    puts task
  end
end

def payout_child(user)
  loop do  
    puts "Your child's current balance is $#{user[:total_balance]}0".colorize(:green)
    puts "How much would you like to payout to your child?".colorize(:green)
    print "> "
    payout = STDIN.gets.chomp.to_f
    if payout <= user[:total_balance]
      user[:total_balance] = user[:total_balance] - payout
      system("clear")
      puts "You have paid out $#{payout}0 to your child"
      puts "Your childs balance is now $#{user[:total_balance]}0"
      break
    else payout > user[:total_balance]
      system("clear")
      puts "Your child hasn't earned that much!".colorize(:red)
      break
    end
  end
end


