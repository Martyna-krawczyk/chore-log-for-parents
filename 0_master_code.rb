require 'colorize'
require "tty-prompt"

prompt = TTY::Prompt.new

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


loop do 
  puts "1. View and log completed chores"
  puts "2. Add custom chore to list"
  puts "3. Remove chore from list"
  puts "4. View balance and completed chores"
  puts "5. Payout your child" 
  puts "6. Exit"

  action = gets.chomp.to_i

  case action
  when 1
    for chore in chores
      puts "__________________________________".colorize(:blue)
      puts "Chore: #{chore[:task]}"
      puts "Worth: $#{chore[:value]}0".colorize(:green) #to_f doesn't work here - how can I add two decimal spaces?
      puts "__________________________________".colorize(:blue)
    end

    answer = prompt.select("Which chore has your child completed?", chores.map {|i| i[:task]})

    user[:tasks] << answer
    
    selected_chore = chores.find do |chore|
        chore[:task] == answer
    end
    
    user[:total_balance] =  user[:total_balance] + selected_chore[:value]
    
    puts "Fantastic! $#{selected_chore[:value]}0 has been added to your child's balance!".colorize(:green)


  when 2
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
    puts "Your custom chore has been added to the list.".colorize(:blue)


  when 3
    puts "Select the chore to remove from the list(enter exact name)"
    print "> "
    task = gets.chomp.capitalize
    chores.each do |chore| 
    if chore[:task] == task
    puts "Are you sure you want to remove this chore?"
    print "> "
    confirm = gets.chomp
        if confirm.downcase == 'yes' 
            index = chores.index(chores).to_i
            chores.delete_at(index)
            puts "Chore successfully deleted".colorize(:blue)
            break
        else
            puts "Chore has not been deleted".colorize(:red)
            break
        end
    else
         if chore[:task] != task
        puts "This chore isn't on the list. Please try again." #This is printing three times
         end
    end #Need to come up with better error handling?
  end
  
  when 4
        puts "Your Child's Current Balance is $#{user[:total_balance]} for completion of the following task(s) #{user[:tasks].to_s}!"
        # p user[:tasks]
        # system("clear")

  when 5
    loop do    
        p "How much would you like to payout to your child?"
        print "> "
        payout = gets.chomp.to_f
        if payout <= user[:total_balance]
            user[:total_balance] = user[:total_balance] - payout
            system("clear")
            p "Your childs balance is now $#{user[:total_balance]}"
            "Paid out #{payout} to child"
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


