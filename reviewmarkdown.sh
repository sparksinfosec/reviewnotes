#!/usr/bin/env bash

# Only other thing I think might be needed is to take the read search term $3 and not have to have it exact match 
# This might mean we have to modify awk statement or grep -i

# NOTE: Only support 3 levels of indents on ordered and unorder list currently
# Maybe look at better formatting 
# Now that line numbers are included the digits throw off the foramt abit
# Possible way to clear screen or keep at top?

magenta=$'\e[35m'
red=$'\e[31m'
green=$'\e[32m'
yellow=$'\e[33m'
cyan=$'\e[36m'
reset=$'\e[0m'


linecount=$(wc -l "$1" | awk '{print $1}')

if [[ "$2" == "list" && -f "$1" ]] #if second input of command is list plus the file exist (first input)
then # Then we will read in file and just print out all headers 
	exec 3<"$1"
	echo ""
	printf "${red}You are reviewing %s$reset\n" "${1}" # instead of echo -e 
	echo ""
	while IFS= read -r -u 3 line || [[ -n "$line" ]]; do
		case $line in
			\#*)
				read -rp "${green}Headers: $line${reset}"
			        ;;
              *);;
		esac
	done
elif [[ "$2" == "read" && -f "$1" ]] # if second input is read and file exist
then # Then read in file and use awk to print from 3 input (header name) to next header
	exec 3<"$1"
	echo ""
    printf "${red}You are reviewing %s$reset\n" "${1}" # instead of echo -e 
	echo ""
	awk '/^#.*/{f=0} /^#.*'"$3"'/{f=1} f' "$1" # awk begin and end check starts with the $3 with # in front to the next 

elif [ -f "$1" ] # lastly if no other input and the file exist 
then
# read the file line by line with enter 
       exec 3<"$1"
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

