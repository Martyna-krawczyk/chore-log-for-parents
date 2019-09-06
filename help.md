# Help
### To run the app, follow the steps below:

1. Make sure that you've installed ruby on your machine. I used 'rbenv'. This required homebrew.

2. Clone the repo.
````txt
git clone name.git
````
3. 'cd' into the directory you've cloned.

## Run the build.sh File
 To run the app, run the build.sh file to install the required gems and copy the appropriate ruby files.

4. Run the following command:
```txt
ruby run.rb
```

5. If you want to run in advanced mode - with a custom welcome message, enter the following command, typing your name into the 'name' field:
```txt
ruby run.rb name
```


On starting the app, you will be presented with a welcome note as well as a menu, where you can select options from 1-6 to run a specific task which are outlined in the below options.

### Option 1 - View and Log Completed Chores
    This Option enables you to view the list of pre-set chores and mark off which task has been completed by your child. To scroll through the menu options, use the up and down arrow keys until the completed chore is highlighted, then by pushing enter, the application will return a note advising that the $ value of that chore has been added to your child's total balance.

### Option 2 - Adding Custom Chores to List
    You will be asked to input the name of the chore you'd like to add to the list as well as the $ value of that chore. This new chore will show up in the menu as an option to mark complete if option 1 is selected as above.

### Option 3 - Removing Chores From List
    You will be asked to type the name of the chore you'd like to remove - make sure the input matches the list item name, you will be asked to confirm if this is correct.  If the wrong name has been entered, you will be notified that the chore is not on the list and to try again.

### Option 4 - View Balance and Completed Chores
    On selection of option 4, you will be presented a statement advising the balance payable to your child as well as a list of the tasks they have completed. 

### Option 5 - Payout Your Child
    On selection of option 5, you will be presented with the current balance accrued by your child, followed by being asked to input the amount you'd like to payout. Once you enter the amount and pushe enter, as long as the payout amount is less than the balance, it will deduct this amount from the balance. If you are paying out too much, a notification will pop up to advise that your child hasn't earned this much.

### Option 6 - Exit
    Selection of option 6 will exit the application.

