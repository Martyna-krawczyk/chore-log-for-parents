require 'colorize'

chore1 = {
  task:"Vacuum House",
  value: 5.00
}
chore2 = {
  task:"Mop Floors",
  value: 5.00
}
chore3 = {
  task:"Clean Toilet",
  value: 5.00
}

user = {
    total: 0,
    tasks: []
}
# p "Current Balance is #{balance}"
chores = [chore1, chore2, chore3]


loop do 
  puts "1. Log completed chores"
  puts "2. Add custom chore to list"
  puts "3. Remove chore from list"
  puts "4. View balance"
  puts "5. Payout" 
  puts "6. Log Completed chore"
  puts "7. Exit"

  action = gets.chomp.to_i

  case action
  when 1
    for chore in chores
      puts "________________________".colorize(:blue)
      puts "Task: #{chore[:task]}"
      puts "Value: $#{chore[:value]}".colorize(:green) #to_f doesn't work here - how can I add two decimal spaces?
      puts "________________________".colorize(:blue)
      puts "" #using the each_with_index method, the user can select based on index value
    end

  when 2
    puts "Task:"
    task = gets.chomp
    puts "Value:"
    value = gets.chomp.to_f
    
    chore = {
        task: task,
        value: value
    }
    chores.push(chore)
    puts "Your chore has been added"
#   end

  when 3
    puts "Select the chore to remove:"
    task = gets.chomp
    chores.each do |chore| 
    if chore[:task] == task
    puts "Are you sure you want to remove this chore?"
    confirm = gets.chomp
        if confirm.downcase == 'yes' 
            index = chores.index(chores).to_i
            chores.delete_at(index)
            puts "Chore successfully deleted"
            break
        else
            puts "Chore has not been deleted"
            break
        end
    else
        chore[:task] != task
        puts "This chore isn't on the list. Please try again." #This is printing three times
    end
  end
  end #ends case
end #ends loop

#   when 4
#         p balance
#   end
#   when 5
#     loop do    
#         p "How much would you like to payout to your child??"
#         print "> "
#         payout = gets.chomp.to_i
#         if payout <= balance
#             balance = balance - payout
#             system("clear")
#             p "Your childs balance is now $#{balance}"
#             transactions.push "Paid out #{withdraw_amount} to child"
#             break
#         else withdraw_amount > balance
#             system("clear")
#             p "Your child hasn't earned that much!"
#             break
#         end
#     end
#   end
# end
    # when 6
    #      p "Which chore would you like to mark as completed?"
    #      print "> "
    #      deposit_amount = gets.strip.to_i
    #      balance += deposit_amount
    #      system("clear")
    #      p "Your balance is now $#{balance}"
    #      transactions.push "Deposited #{deposit_amount}"
    # elsif user_input == "end"
#   when 7
#     break
#   end
