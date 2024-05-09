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
* Indented *
* Code blocks (really reading tabs spaces and \`\`\`)

## Look to add 

* Look to add support for three level list (both unordered and ordered?)
    * Because it looks like it does work
        * And could be useful in the future 
* Make sure this does interfere with the tabs and spaces set for code blocks already established 
* Might be best if you use the literal with * to look at three level list 
