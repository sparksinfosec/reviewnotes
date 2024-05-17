# Reviewnotes

Bash script to review markdown notes line by line 

* Note added final version to my dot file under scripts since running this everyday (updated changes will likely be made there)

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
* Indented *
* Code blocks (really reading tabs spaces and \`\`\`)
* OG readme script is the original case statement created 
* Split it off into the new script to keep the original case statement and adding the logic, plus additional execeptions for expanded markdown formatting
* Also renamed the script to just review and added to .local bin to make it easier to run (reviewmd file or other useage)

## Look to add 

