# Development Log

## Status Update
### 4th September 2019

## Menu Changes
I have had to revise the orginal plan with the menu, as I realise that additional features would be advantageous.  I now have 6 menu options instead of the original four and realise that by allowing users to input new chores and respective values, I will have trouble allowing the users to log the completed chore.  On a senion developer's recommendation, I have added ruby gem 'tty-prompt' to handle the selection of the hash value from the :task key.

## Ruby Gem: TTY-PROMPT
I am in the process of coding the app and have hit a major roadblock involving using the correct syntax for gem 'tty-prompt'.  The prompt.select method allows the user to scroll through menu items held within an array or a hash, however I have not been able to successfully print the required hash values.  Having tried numerous versions of the syntax as well as referring to the tty-prompt documentation (and others), I know it's possible do do, I just can't access an example of the syntax.  Currently the menu is printing with the key name instead of the value.  My research suggests that this is not the right gem to use for this purpose and to get around this, the solution will require a new metod be defined.
