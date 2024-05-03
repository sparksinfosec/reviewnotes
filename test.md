# VIM

---

## Vim Tutor

* Run it with vimtutor 
* Just a taste to get start more advanced tutorials probably required. 

### Lesson 1

#### Lesson 1.1 - Moving the Cursor  

* h, j, k, and l 
* h = left
* k = up
* l = right 
* j = down 
* Cursor keys should also work, but using hjkl you will be able to move around much faster

#### 1.2 Exiting VIM

* ESC to make sure you are in normal mode 
* type :q!
    * Exits the editor, DISCARDING any changes you have made 

#### Lesson 1.3 Text editing - Deletion 

* Fix errors move the cursor until it is on top of the character to be deleted 
* Essentially put it in front of the character 
* Press the x key to delete the unwanted character 
* Learn by usage 

#### Lesson 1.4 Text editing - Insertion 

* i get you into insert mode. 

#### Lesson 1.5 Text editing - Appending 

* Press A to append text 
* Brings you to the end of the current line 

#### Lesson 1.6 Editing a file 

* Use :wq to save a file and exit 

#### Lesson 1 Summary 

1. Moving the cursor with hjkl
1. vim FILENAME to start vim from the shell 
1. To exit 
    1. :q! to trash all changes 
    1. :wq to save the changes 
1. Delete characters at the cursor with x 
1. To insert or append text 
    1. i to enter insert mode
    1. A to append (go to the end of line + insert mode)
1. ESC will place you in Normal mode or will cancel an unwated or partially completed command 

---

### Lesson 2 

#### Lesson 2.1 Deletion Commands 

* Type dw to selete a word 
* Place the cursor before a word and us dw to delete the word. 
* Keeps you in normal mode just deletes the word 

#### Lesson 2.2 More deletion commands 

* d$ to delete to the end of the line 
* Deletes from the cursor to the end of the line 

#### Lesson 2.3 On operators and motions 

* Many commands that change text are made from an operator and a motion
* The format for a delete command with the d (delete operator) is:
    * d motion
    * Where: d is the delete operator and motion is what the operator will operate on
    * Short list of motions: 
    * w - until the start of the next word, excluding its first character 
    * e - to the end of the current word, including the last character 
    * $ - to the end of the line, including the last character 
    * Thus typing de will delete from the cursor to the end of the word
    * NOTE: pressing just the motion while in Normal mode without an operator will move the cursor as specified

#### Lesson 2.4 Using a count for a motion

* Typing a number before a motion repeats it that many times 
* 2w to move the cursor two words forward 
* 3e to move the cursor to the end of the third word foward 
* Type 0 (zero) to move to the start of the line (beginning of the line)

#### Lesson 2.5 Using a count to delete more 

* Typing a number with an operator repeats it that many times
* d number motion
    * In combination of the delete operator and a motion insert a count before the motion to delete more:
* d2w to delete the two words until the start of the next word, excluding its first character. 
    * dw but with a 2 to increase the number of words deleted. 

#### Lesson 2.6 Operating on Lines 

* dd to delete a whole line 
* 2dd to delete two lines 

#### Lesson 2.7 The Undo command 

* Press u to undo the last commands
* U to fix a whole line 
* x to delete the first unwanted character - then use u to undo the change (last command executed)
* x to fix multiple errors in a line - Use U to return the line to its original state 
* CTRL-R to redo commands (so you delete a letter with x the undo with u - then control R to go back before the undo)

#### Lesson 2 Summary 

* To delete from the cursor up to the next word type: dw
* To delete from the cursor up to the end of the word type: de 
* To delete from the cursor to the end of a line type: d$ 
* To delete a whole line type: dd
* To repeat a motion prepend it with a number: 2w 
* The format for a change command is: operator [number] motion
    * Where operator is what to do such as d for delete
    * [number] is an optional count to repeat the motion
    * motion moves over the text to operate on, such as w (word), e (end of word), $ (end of the line), etc 
* To move to the start of the line use a zero: 0
* To undo previous actions: u (lowercase u)
* To undo all the changes on a line: U (capital U)
* To undo the undos: CTRL-R 

---

### Lesson 3 

#### Lesson 3.1 The Put Command 

* Type p to put previusly deleted text after the cursor 
* dd to delete a line (it is stored in a VIM register)
* Use p to put the line below the cursor

#### Lesson 3.2 The Replace Command 

* Type rx to replace the character at the cursor with x
* Type r and then the character which should be there. 
* The character behind the cursor will be replaced. 

#### Lesson 3.3 The Change Operator 

* To change until the end of a word, type ce
* Essentially deletes the rest of the word and puts you into insert mode 
* ce deletes the word and places you in Insert mode 
* cc does teh same for the whol line 

#### Lesson 3.4 More changes using c 

* The change operator is used with the same motions as delete 
* The change operator works in the same way as delete
    * The format is: c [number] motion
* The motions are the same, such as w (word) and $ (end of line)
* So c$ will remove the rest of the line and enter you into insert to input what is needed 

#### Lesson 3 Summary 

* To put back text that has just been deleted, type p
    * This puts the deleted text AFTER the cursor/ below the cursor 
* Replace the character under the cursor type r and then the character you want to have there 
* The change operator allows you to change from the cursor to where the motion takes you 
    * Type ce to change from your cursor to the end of the word
    * c$ to change to the end of a line 
* The format for change is:
    * c [number] motion

---

### Lesson 4 

#### Lesson 4.1 Cursor Location and File Status 

* Type CTRL-G to show your location in the file and the file status 
* Type G to move to a line in the file 
* Control G will show the total lines and the line you are on. 
* G to move you to the bottom of the file 
* gg to move you to the start of the file 
* type a number (line) and then G to go to s specific line 

#### Lesson 4.2 The Search Command 

* Type / followed by a phrase to search for the phrase 
* In normal mode type /
    * Notice that it and the cursor appear at the bottom of the screen as with the : command 
* / 'search term' <ENTER>
* To search for the same phrase again simply type n
    * To search for the same phrase in the opposite direction type N 
* To search for a phrase in the backward direction use ? instead of /
* To go back to where you came from press CTRL-O
    * Repeat to go back further 
    * CTRL-I goes forward 
* Note: when the search reaches the end of the file it will continue at the start unless the 'wrapscan' option has been reset 

#### Matching Parentheses Search 

* Type % to find a matching ), ], or }
* Type % the cursor will move to the matching parenthesis or bracket
    * Type % to move the cursor to the other matching bracket 
* This is very useful in debugging a program with unmatched parentheses!
* So essentially you can move to a (, [, or { and then use % to jump to the closing/matching bracket 

#### Lesson 4.4 The Substitute command 

* Type :s/old/new/g to substitute 'new' for 'old'
    * Kind of like a sed command?
* :s/thee/the <ENTER> 
    * This will change the first occurrence of "thee" with "the" in the line 
* :s/thee/the/g Adding the g flag means to substitute globally in the line, change all occurrences in the line 
* To change every occurrence of a character string between two lines 
    * type: :#,#s/old/new/g  Where #,# are the line numbers of the range of lines where the substitution is to be done 
    * type: :%s/old/new/g  To change every occurrence in the whol file 
    * type: :%s/old/new/gc  To find every occurrence in the whole file, with a prompt whether to substitute or not 

#### Lesson 4 Summary 

* CTRL-G displays your location in the file and the file status 
* G moves to the end of the file 
* number G moves to that line number 
* gg moves to the first line 
* / followed by a phrase searches FORWARD for the phrase 
* ? followed by a phrase searches BACKWARD for the phrase 
* After a search type n to fine the next occurrence in the same direction
    * Or N to search in the opposite direction
    * CTRL-O takes you back to older positions, CTRL-I to newer positions 
* % while the cursor is on (, ), [, ], {, or } goes to its match
* :s/old/new  To sub new for the first old in a line
* :s/old/new/g  To sub new for all old on a line (globally)
* :#,#s/old/new/g  To sub phrases between two line #
* :%s/old/new/g  To sub all occurrences in the file
* :%s/old/new/gc  To ask for confirmation each time add 'c'

---

### Lesson 5

#### Lesson 5.1 How to execute an external command 

* :! followed by an external command to execute that command 
* :!ls (will run the ls command) 
    * Runs on the dir that you are in
* NOTE: it is possible to execute any external command this way also with arguments 
* NOTE: All : commands must be finished by hitting <ENTER> 

#### Lesson 5.2 More on writing files 

* To save changes made to the text type :w FILENAME
* :w TEST
* Can look at the dir with :!ls
    * Choose a file that does not exist and save with :w TEST
    * Then rerun the ls command (:!ls) and you should see the file saved 
    * Can be removed with :!rm TEST 

#### Lesson 5.3 Selecting text to write 

* To save part of the file, type v motion :w FILENAME
* Press v to highlight specific text
* Press : (you will see at the bottom of the screen :'<,'>)
* Then use w TEST (TEST being the file new non existing filename) 
* Should be seeing :'<,'>w TEST
* Vim will write the selected lines to the file TEST 
* Pressing v starts visual selection
    * You can move the cursor around to make the selection bigger or smaller
    * Then you can use an operator to do something with the text (for example d deletes the text)

#### Lesson 5.4 Retrieving and merging files

* To insert the contents of a file, type :r FILENAME
* :r TEST (test being the file you are pulling in) the file you retrieve is placed below the cursor line 
* You can also read the output of an external command
    * :r !ls reads the output of the ls command and puts it below the cursor 

#### Lesson 5 Summary 

* :!command executes an external command 
    * example: :!ls or :!rm FILENAME
* :w FILENAME writes the current vim file to disk with name FILENAME
* v motion :w FILENAME saves the visually selected lines in file FILENAME
* :r FILENAME restrieves disk file FILENAME and puts it below the cursor position
* :r !ls reads the output of the ls command and puts it below the cursor position

--- 

### Lesson 6 

#### Lesson 6.1 The Open Command 

* o to open a line below the cursor and place you in Insert mode 
* O to open a line above the cursor 

#### Lesson 6.2 The Append Command 

* a to insert text AFTER the cursor 
* A will append at the end of the line 
* i moves into insert right where the cursor is 
* e moves to the next word and puts you at the second to last character (a then appends to the end of that word)

#### Lesson 6.3 Another way to replace 

* Type a capital R to replace more than one character 
* R put you into replace mode and <ESC> to leave replace mode
* Replace mode is like insert mode, but every typed character deletes an existing character 

#### Lesson 6.4 Copy and paste text 

* Use the y operator to copy text and p to paste it 
* v to start visual mode 
* Move the cursor over the desired text 
* y (yank/copy) the highlighted text
* j$ to move to the end of the next line 
* You can also use y as an operator 
    * yw yanks one word 
    * yy yanks the whole line 

#### Lesson 6.5 Set Option

* Set an option so a search or substitute ignores case 
* Search for ignore by entering in /ignore <ENTER>
* Set the 'ic' (Ignore Case) option by entering :set ic 
* Now search for ignore again: using n to move forward notice that Ignore and IGNORE are also found 
* set 'hlsearch' and 'incsearch' options :set hls is (this will also highlight ignores that might be a part of a word or in between symbols)
* To remove the highlighting of matches enter :nohlsearch
* If you want to ignore case for just one search command, us \c in the phrase: /ignore\c <ENTER>

#### Lesson 6 Summary 

* o to open a line BELOW the cursor and start Insert mode 
* O to open a line ABOVE the cursor 
* a to insert text AFTER the cursor
* A to insert text after the end of the line 
* e command moves to the end of a word
* y operator yanks (copies) text, p puts (pastes) it 
* R enters Replace mode until <ESC> is pressed 
* Typing :set xxx sets the option xxx some options are 
    * ic (ignore case) ignore upper/lower case when searching 
    * is (incsearch) show partial matches for a search phrase 
    * hls (hlsearch) highlight all matching phrases 
    * prepend no to switch an option off :set noic 

### Lesson 7 

#### Lesson 7.1 Getting Help 

* Use the on-line help system
* Vim has a comprehesive on-line help system 
    * press the <HELP> key (if you have one)
    * type :help <ENTER>
* CTRL-W CTRL-W to jump from one window to another 
* :q <ENTER> to close the help window 
* You can find help on just about any subject by giving an argument to the :help command 
    * :help w 
    * :help c_CTRL-D
    * :help insert-index
    * :help user-manual 
* Read the user-manual for next steps 

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
* Type :q to close the help Window 
* Create a vimrc startup script to keep your preferred settings 
* When typing a : command, press CTRL-D to see possible completions 
    * Press <TAB> to use one completion

### NEXT STEPS 

* Read the user manual (:help user-manual)







    ```
	if one = one 
           Then do 
        fi 
    ```










