# Development Log

## Status Update
### 4th September 2019

## Menu Changes
I have had to revise the orginal plan with the menu, as I realise that additional features would be advantageous.  I now have six menu options instead of the original four and realise that by allowing users to input new chores and respective values, I will have trouble allowing the users to log the completed chore.  On a senior developer's recommendation, I have added ruby gem 'tty-prompt' to handle the selection of the hash value from the :task key.

## Ruby Gem: TTY-PROMPT
I am in the process of coding the app and have hit a major roadblock involving using the correct syntax for gem 'tty-prompt'.  The prompt.select method allows the user to scroll through menu items held within an array or a hash, however I have not been able to successfully print the required hash values.  Having tried numerous versions of the syntax as well as referring to the tty-prompt documentation (and others), I know it's possible do do, I just can't access an example of the syntax.  Currently the menu is printing with the key name instead of the value.  My research suggests that this is not the right gem to use for this purpose and to get around this, the solution will require a new metod be defined.


## Status Update
### 5th September 2019

## Ruby Gem: TTY-PROMPT
After working with a senior developer to address the issues I was facing with the syntax required by tty-prompt, we were able to pass the correct information to the selector. 

## DRYing out the code
The app is running, and though I haven't fully tested errors and handling yet, I am pleased that the functionality is as planned. The next step is to wrap up the menu as well as cases into defined methods so that the code is cleaner and DRYer. I would like to spend today improving the flow if the app and re-using some of the methods which have been defined to improve user experience.

## Aesthetics
I have one task left in the code - I would like to return a comma-separated string where the interpolation is currently printing me the array. This is high on my priority list for today's final day of development.