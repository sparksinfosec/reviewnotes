#!/usr/bin/env bash

# Only other thing I think might be needed is to take the read search term $3 and not have to have it exact match 
# Need to not be case sensitive 
# This might mean we have to modify awk statement or grep -i
#
# TO DO ----
# Add a help with proper format 
# * Maybe look at seeing if you can start the script with a line number passed to it 
# EXAMPLE: reviewmd 300 file (start the review at that specific line number)
# Also look to see what would be needed to clear the screen and start with next line return

# NOTE: Only support 3 levels of indents on ordered and unorder list currently
    # 1
        # 2 
            # 3 
# Maybe look at better formatting 
# Now that line numbers are included the digits throw off the foramt abit
# Possible way to clear screen or keep at top?

magenta=$'\e[35m'
red=$'\e[31m'
green=$'\e[32m'
yellow=$'\e[33m'
cyan=$'\e[36m'
reset=$'\e[0m'



if [[ "$1" == "list" && -f "$2" ]] #if second input of command is list plus the file exist (first input)
then # Then we will read in file and just print out all headers 
	exec 3<"$2"
	echo ""

	printf "${red}You are reviewing %s$reset\n" "${2}" # instead of echo -e 
	echo ""
	while IFS= read -r -u 3 line || [[ -n "$line" ]]; do
		case $line in
			\#*)
				read -rp "${green}Headers: $line${reset}"
			        ;;
              *);;
		esac
	done
elif [[ "$1" == "read" && -f "$3" ]] # if second input is read and file exist format reviewmd read match file
then # Then read in file and use awk to print from 3 input (header name) to next header
	exec 3<"$3"
	echo ""
    printf "${red}You are reviewing %s$reset\n" "${2}" # instead of echo -e 
	echo ""
	awk '/^#.*/{f=0} /^#.*'"$2"'/{f=1} f' "$3" # awk begin and end check starts with the $3 with # in front to the next 

elif [ -f "$1" ] # lastly if no other input and the file exist 
then
# read the file line by line with enter 
       exec 3<"$1"

       linecount=$(wc -l "$1" | awk '{print $1}')
       echo ""
       printf "${red}You are reviewing %s$reset\n" "${1}" # instead of echo -e 
       printf "${red}$linecount total lines\n ${reset}"
       echo ""
       count=0
       while IFS= read -r -u 3 line || [[ -n "$line" ]]; do
                case $line in
		       \#*)
		               read -rp "${count}${green} > $line ${reset} "
                       ((count++))
			       ;;
		       \**)
			       read -rp "${count}${cyan} >> $line${reset} "
                   ((count++))
			       ;;
		       "    *"*) # One indent *
			       read -rp "${count}${cyan} >>> $line${reset} "
                   ((count++))
			       ;;
               "        *"*) #two level indent *
                   read -rp "${count}${cyan} >>>> $line${reset} "
                   ((count++))
                   ;;
               "            *"*) # * Third level indent this is the max (not sure if supported everywhere)
                   read -rp "${count}${cyan} >>>>> $line${reset} "
                   ((count++))
                   ;;
               "            1"*)
                   read -rp "${count}${yellow} >>>># $line${reset} "
                   ((count++))
                   ;;
		       1*)
			       read -rp "${count}${yellow} ># $line${reset} "
                   ((count++))
			       ;;
		       "    1"*)
			       read -rp "${count}${yellow} >># $line${reset} "
                   ((count++))
			       ;;
               "        1"*)
                   read -rp "${count}${yellow} >>># $line${reset} "
                   ((count++))
                   ;;
		       -*)
			       read -rp "${count} --- "
                   ((count++))
			       ;;
		       '    ```'*)
			       read -rp "${count}${magenta} Code Block${reset} "
                   ((count++))
			       ;;
		       '    '**) #adding to read the code block must be at least 4 spaces (prints anything indented/4 spaces)
			       read -rp "${count}${green} Code> $line${reset} "
                   ((count++))
			       ;;
		       ''*) #This pattern always overrides a later one on line 73
			       read -rp "${count} ~~~ $line" #putting the line just in case something other than blank like is here
                   ((count++))
			       ;;
		       *) #Essentially this should next execute 
			       read -rp "${count} *Error Case*: $line"
                   ((count++))
			       ;;
	        esac
       done 
else # else the file does not exist and other inputs are not included 
	echo "File does not exist - exit"
 fi

