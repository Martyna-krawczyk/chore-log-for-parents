require 'colorize'
require "tty-prompt"

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
    task = gets.chomp.capitalize
    puts "How much would you like to pay your child for this chore(enter without $ eg. 1.00)?"
    print "> "
    value = gets.chomp.to_f
    
    chore = {
        task: task,
        value: value
    }
    chores.push(chore)
    system("clear")
    puts "Your custom chore has been added to the list.".colorize(:blue)
end

loop do 
  puts view_menu

  action = gets.chomp.to_i
  system("clear")
  case action

  when 1
    view_chores_list(chores)
    user_data(chores, user)

    
  when 2
    add_new_chore(chores)


  when 3
    puts "Select the chore to remove from the list"
    print "> "
    task = gets.chomp.capitalize
    chores.each do |chore| 
    if chore[:task] == task
    puts "Are you sure you want to remove this chore?"
    print "> "
    confirm = gets.chomp
        if confirm.downcase == 'yes' 
            index = chores.index(chore)
            chores.delete_at(index)
            system("clear")
            puts "Chore successfully deleted".colorize(:blue)

            break
        else
            system("clear")
            puts "Chore has not been deleted".colorize(:red)
            break
        end
    else
        # Check if this is the final iteration.
        if chores.index(chore) == chores.length - 1
            if chore[:task] != task
                puts "This chore isn't on the list. Please try again.".colorize(:red) 
             end
        end
        
    end 
  end
  
  when 4
    system("clear")
    puts "Your Child's Current Balance is $#{user[:total_balance]}0 for completion of the following task(s) #{user[:tasks]}!".colorize(:green)

  when 5
    loop do  
        p "Your child's current balance is $#{user[:total_balance]}0"  
        p "How much would you like to payout to your child?"
        print "> "
        payout = gets.chomp.to_f
        if payout <= user[:total_balance]
            user[:total_balance] = user[:total_balance] - payout
            system("clear")
            p "Your childs balance is now $#{user[:total_balance]}0"
            p "You have paid out $#{payout}0 to your child"
            break
        else payout > user[:total_balance]
            system("clear")
            puts "Your child hasn't earned that much!".colorize(:red)
            break
        end
    end

  when 6
    break

end #ends case
end #ends loop


