#### Lesson 7.2 Create a startup script 

* Vim has many more features than Vi, but most of them are disable by default 
* To start using more feature you should create a "vimrc" file 
* Start editing the vimrc file depending on your system 
    * :e ~/.vimrc (Unix)
    * :e ~/\_vimrc (Wimdows NOTE the escape character in md)
* Now read teh example vimrc file content: :r $VIMRUNTIME/vimrc_exmple.vim
* Write the file with :w 
* Next time you start VIM it will use syntax highlighting
* You can add all your preferred settings to this "vimrc" file
* For more information type :help vimrc-intro

#### Lesson 7.3 Completion 

* Command line completion with CTRL-D and <TAB>
* Make sure Vim is not in compatible mode :set nocp
* Look what files exist in the directory :!ls or :!dir 
* Type the start of a command :e 
* Press CTRL-D and VIM will show a list of commands that start with "e" 
* Type d<TAB> and VIM will complete the command to ":edit"
* Now add a space and the start of the existing file name
    * Press <TAB> VIM will complete the name (if it is unique)
* Note completion works for many commands
    * Just try pressing CTRL-D and <TAB>
    * It is especially useful for :help 

#### Lesson 7 Summary 

* Type :help or press F1 or <HELP> to open help window 
* Type :help cmd to find help on cmd 
* Type CTRL-W CTRL-W to jump to another window 
* Type :q to close the help Wind

### NEXT STEPS 

* Read the user manual (:help user-manual)







    ```
       	if one = one 
           Then do 
        fi 
        test 
    ```
 










