
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

chores = [chore1, chore2, chore3]

def check_add_new_chores(chores)
    initial_number_of_chores = chores.length
    new_chore_list = add_new_chore(chores)
    if new_chore_list.length - initial_number_of_chores >=1
        return "Test passes!".colorize(:green)
    else
        return "Test fails 😭".colorize(:red)
    end
end

# Testing Add_New_Chores Method
puts check_add_new_chores(chores)


def check_remove_chores(chores)
  initial_number_of_chores = chores.length
    new_removed_chore_list = remove_chore(chores)
    if new_removed_chore_list.length + initial_number_of_chores >=1
        return "Test passes!".colorize(:green)
    else
        return "Test fails 😭".colorize(:red)
    end
end

# Testing Remove_chore Method
puts check_remove_chores(chores)