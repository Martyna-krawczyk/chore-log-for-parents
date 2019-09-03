require 'colorize'
require "tty-prompt"
prompt = TTY::Prompt.new

chore1 = {
  task:"vacuum house",
  value: 5.00
}
chore2 = {
  task:"mop floors",
  value: 5.00
}
chore3 = {
  task:"clean toilet",
  value: 5.00
}

user = {
    total_balance: 0,
    tasks: []
}

chores = [chore1, chore2, chore3]

# transactions = []


loop do 
  puts "1. Log completed chores"
  puts "2. Add custom chore to list"
  puts "3. Remove chore from list"
  puts "4. View balance"
  puts "5. Payout" 
  puts "6. Exit"

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

    # prompt.select("Which chore has been completed?", %w(vacuum clean flush))
    def select_chore
        {self.task + ("\n") + self.value + ("\n") self.index}
    end
    prompt.select("Which chore has been completed?", %w(vacuum clean flush))
    
    # p "Which chore would you like to mark as completed?"
    # print "> "
    # deposit_amount = gets.strip.to_i
    # balance += deposit_amount
    # system("clear")
    # p "Your balance is now $#{balance}"
    # transactions.push "Deposited #{deposit_amount}"
    # user_input == "end"

  when 2
    puts "Type in your new chore:"
    print "> "
    task = gets.chomp
    puts "Value:"
    print "> "
    value = gets.chomp.to_f
    
    chore = {
        task: task,
        value: value
    }
    chores.push(chore)
    puts "Your chore has been added"


  when 3
    puts "Select the chore to remove:"
    print "> "
    task = gets.chomp
    chores.each do |chore| 
    if chore[:task] == task
    puts "Are you sure you want to remove this chore?"
    print "> "
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
         if chore[:task] != task
        puts "This chore isn't on the list. Please try again." #This is printing three times
         end
    end #Need to come up with better error handling?
  end
  
  when 4
        p "Your Child's Current Balance is $#{user[:total_balance]}"#" for completing #{} - list of jobs
        # system("clear")

  when 5
    loop do    
        p "How much would you like to payout to your child?"
        print "> "
        payout = gets.chomp.to_i
        if payout <= chore[:value]
            chore[:value] = chore[:value] - payout
            system("clear")
            p "Your childs balance is now $#{chore[:value]}"
            transactions.push "Paid out #{payout} to child"
            break
        else payout > chore[:value]
            system("clear")
            p "Your child hasn't earned that much!"
            break
        end
    end

  when 6
    break

end #ends case
end #ends loop


# ##V2

# require 'colorize'
# require "tty-prompt"

# prompt = TTY::Prompt.new

# chore1 = {
#   task:"vacuum house",
#   value: 5.00
# }
# chore2 = {
#   task:"mop floors",
#   value: 5.00
# }
# chore3 = {
#   task:"clean toilet",
#   value: 5.00
# }

# user = {
#     total_balance: 0,
#     tasks: []
# }

# chores = [chore1, chore2, chore3]

# transactions = []


# loop do 
#   puts "0. Log completed chore" #chore[:value]
#   puts "1. View chores"
#   puts "2. Add custom chore to list"
#   puts "3. Remove chore from list"
#   puts "4. View balance"
#   puts "5. Payout" 
#   puts "6. Exit"

#   action = gets.chomp.to_i

#   case action

#   when 1
#     for chore in chores
#       puts "________________________".colorize(:blue)
#       puts "Task: #{chore[:task]}"
#       puts "Value: $#{chore[:value]}".colorize(:green) #to_f doesn't work here - how can I add two decimal spaces?
#       puts "________________________".colorize(:blue)
#       puts "" #using the each_with_index method, the user can select based on index value
#     end
#     prompt.select("Which chore has been completed?", %w(chore[:task]))
#     # p "Which chore would you like to mark as completed?"
#     # print "> "
#     # deposit_amount = gets.strip.to_i
#     # balance += deposit_amount
#     # system("clear")
#     # p "Your balance is now $#{balance}"
#     # transactions.push "Deposited #{deposit_amount}"
#     # user_input == "end"

#   when 2
#     puts "Type in your new chore:"
#     print "> "
#     task = gets.chomp
#     puts "Value:"
#     print "> "
#     value = gets.chomp.to_f
    
#     chore = {
#         task: task,
#         value: value
#     }
#     chores.push(chore)
#     puts "Your chore has been added"


#   when 3
#     puts "Select the chore to remove:"
#     print "> "
#     task = gets.chomp
#     chores.each do |chore| 
#     if chore[:task] == task
#     puts "Are you sure you want to remove this chore?"
#     print "> "
#     confirm = gets.chomp
#         if confirm.downcase == 'yes' 
#             index = chores.index(chores).to_i
#             chores.delete_at(index)
#             puts "Chore successfully deleted"
#             break
#         else
#             puts "Chore has not been deleted"
#             break
#         end
#     else
#          if chore[:task] != task
#         puts "This chore isn't on the list. Please try again." #This is printing three times
#          end
#     end #Need to come up with better error handling?
#   end
  
#   when 4
#         p "Your Child's Current Balance is $#{user[:total_balance]}"#" for completing #{} - list of jobs
#         # system("clear")

#   when 5
#     loop do    
#         p "How much would you like to payout to your child?"
#         print "> "
#         payout = gets.chomp.to_i
#         if payout <= chore[:value]
#             chore[:value] = chore[:value] - payout
#             system("clear")
#             p "Your childs balance is now $#{chore[:value]}"
#             transactions.push "Paid out #{payout} to child"
#             break
#         else payout > chore[:value]
#             system("clear")
#             p "Your child hasn't earned that much!"
#             break
#         end
#     end

#   when 6
#     break

# end #ends case
# end #ends loop