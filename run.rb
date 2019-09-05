require_relative '0_master_code.rb'

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
      remove_chore(chores)
      
    when 4
      print_balance(user)
      
    when 5
      payout_child(user)
    when 6
      break
    end 
  end 