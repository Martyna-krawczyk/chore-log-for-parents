# Software Development Plan

## Statement of Purpose
The purpose of this app is to assist parents by tracking completed chores, logging new completed chores and accruing the respective dollar value of the chores so that parents can dispense pocket money to their child in one lump sum. 
As a parent myself, I would like to be able to track the extra chores the kids do so that I can pay them for their efforts in one lump sum. I feel that the financial insentive to do extra household chores would increase children's interest in helping their parents as well as help them to understand how small amounts of money can add up quickly, turning into a decent sum of money. As the app will have the ability to accrue the total dollar amount earned, this would help with decision making about whether the child should be dispensed cash, or receive money into their bank accounts, thus opening up a dialogue between parents and their children about finance, saving and responsible spending. In a society that is using cash a lot less, I believe this app will also encourage parents to deposit accrued pocket money into their child's bank account instead of dropping a couple of coins into a money box (without the ability to track savings or spendings).
The tarket audience for this app are parents of any age, with a child under 15 years old. The parent(user) will be able to select a chore from a pre-set library and mark it as complete, as well as enter a custom chore with its dollar value as chosen by the user.  The user will be able to view a balance of pocket money earned for the completed tasks, as well as the list of completed tasks.


## Features
### Menu
On starting the app, the user will be presented with a menu, where they can select options from 1-6 to run a specific task (by utilising case statements) which are outlined in the below features.  The below cases are contained within a loop.

### Feature 1 - View and Log Completed Chores
    This feature enables the user to view the list of pre-set chores and mark off which task has been completed by their child. The list is wrapped in a defined method called view_chores_list, and the selection menu functionality is provided by the gem 'tty-prompt'. This feature will pull the value from it's respective chore and will push it into the balance of the child along with the completed chore so that the user can view the chores their child has completed as well as see the accrued balance.

### Feature 2 - Adding Custom Chores to List
    Rather than limiting the user to the pre-set chore options and their dollar values, the user will be able to add a custom chore and it's respective value which will show up in the menu as an option to mark complete. This feature requires user input and pushes this data into its new hash.

### Feature 3 - Removing Chores From List
    Some users may feel the pre-set chores are not applicable to them, therefore the user will be able to remove a chore and it's respective value from the list. This feature requires user input and an if/ else statement to loop through.  This case requires the user to input the name of the chore they'd like to delete, making sure the input matches the list item and will ask the user for confirmation of deletion.  If the wrong name has been entered, the user will be notified that the chore is not on the list via an else statement which will run on the final iteration.

### Feature 4 - View Balance and Completed Chores
    As each chore has been marked completed, the accrued balance will update in the background so that when the information is required, the user can view their child's accrued balance. This case is a puts statement with a string interpolation referencing the user hash values.

### Feature 5 - Payout Your Child
    As in a bank application, there is a withdrawl function (or in this case, a payout your child).  At some point the child would like to be paid out and this case allows for a deduction to be made from the total balance.  On selection of this option, the user is presented with the current balance and requests user input for how much they would like to payout to their choild. This function iterates through an if loop where, if their payout is less than the total balance, the payout will deduct from their total balance and return their new balance to the screen. If they are paying out too much, a notification returns to advise that the child hasn't earned this much (error handling).

### Feature 6 - Exit
    Case 6 allows the user to exit - this will break out of the application.

### Future improvements
The following improvements would be advantageous:
*   Ability to use this for multiple children
*   Login/out method for user
*   Retention of changes made to library and balances 
*   Updating the remove function to utilize the tty-prompt menu and thus, improve customer experience by removing the need to type in the chore name (thus saving the user from looping through the error handling process).


## User Experience Outline
On starting the app, the user will be presented with a menu, where they can select options from 1-6 to run a specific task. Parents will be able to select the feature they require by entering the respective number and pushing enter.  The following features listed will outline the user experience for each selection:


### 1. View and Log Completed Chores
    On selection of option 1, the the list of pre-set chores will appear on the screen, followed by a menu that allows the selection of the chore that has been completed by their child. The user will scroll through the menu options using the up and down arrow keys untin the completed chore is highlighted, then by pushing enter, the application will return a note advising that the $ value of that chore has been added to the child's total balance.

### Feature 2 - Adding Custom Chores to List
    Rather than limiting the user to the pre-set chore options and their dollar values, the user will be able to add a custom chore and it's respective value which will show up in the menu as an option to mark complete. This feature requires user input and pushes this data into its new hash.

### Feature 3 - Removing Chores From List
    Some users may feel the pre-set chores are not applicable to them, therefore the user will be able to remove a chore and it's respective value from the list. This feature requires user input and an if/ else statement to loop through.  This case requires the user to input the name of the chore they'd like to delete, making sure the input matches the list item and will ask the user for confirmation of deletion.  If the wrong name has been entered, the user will be notified that the chore is not on the list via an else statement which will run on the final iteration.

### Feature 4 - View Balance and Completed Chores
    As each chore has been marked completed, the accrued balance will update in the background so that when the information is required, the user can view their child's accrued balance. This case is a puts statement with a string interpolation referencing the user hash values.

### Feature 5 - Payout Your Child
    As in a bank application, there is a withdrawl function (or in this case, a payout your child).  At some point the child would like to be paid out and this case allows for a deduction to be made from the total balance.  On selection of this option, the user is presented with the current balance and requests user input for how much they would like to payout to their choild. This function iterates through an if loop where, if their payout is less than the total balance, the payout will deduct from their total balance and return their new balance to the screen. If they are paying out too much, a notification returns to advise that the child hasn't earned this much (error handling).

### Feature 6 - Exit
    Case 6 allows the user to exit - this will break out of the application.

Your outline must include:
- how the user will find out how to interact with / use each feature
- how the user will interact with / use each feature
- how errors will be handled by the application and displayed to the user


Flow Diagram

