# Reviewnotes

Bash script to review markdown notes line by line 

* Created because in 2023 I began to take notes via markdown in order to get more familar with vi, git, and git-bash
* To also encourage me to review these notes daily I made this little script to read out the lines notes 
* Enter will produce the next line.
* Added test.md to test with
* Some additional functionality allows for a list and read option
    * Will always run the script then file then can use list or read
    * List will list all headers
    * Read followed by a header search (exact match first word) will print the entire header section content until the next h tag 
* Will add some samples files for formatting however essentially the markdown notes consist of # for headers
* * For bullets 
* 1. For numbered list 

## Look to add 

* Add additional markdown formatting (For example block quotes >)
* IMPORTANT adding a way to 
1. List the headers with an additional arugment (think another case statement if else)
1. See if there is a way to only read that specific section of headers (how to stop it maybe see another header and quit)
