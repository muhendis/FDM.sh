#!/bin/bash

clear

clear

#sudo apt-get install cowsay

welcome(){

		echo -e  "\n:::::::::::\n:::::::::::Welcome to File and Directory Management (FDM ) \n:::::::::::\n"  


		echo -e "\nHello " $(whoami) " !"

		echo -e "\nDate  -> "  $( date '+ %m / %d / %y %n  %H:%M:%S ')

		echo -e "\nYour current location -> "  $(pwd )

}


content_on_location (){
	
	echo -e "-------------------------------- RESULT ------------------------------\n"

	echo -e "Contents at your location : \n"
	
	for d in *; do
    		
    		#echo -en "\t"$i ". "$d

		echo -en "\t"$d  

		if [ -d "$d" ]; then
 			 
  			echo  " ( Directory ) "
		fi

		echo

		

    		
	done
	echo -e "----------------------------------------------------------------------\n"

}

change_location(){

	cd $new_location

	echo -e "-------------------------------- RESULT ------------------------------\n"

	echo -ne "\nYour current location : "
  
	pwd

	echo -e "----------------------------------------------------------------------\n" 
		
}




#############  functions of general_file_and_directory_operations_options #################

create_a_directory(){
	
	mkdir $directory_name

	echo -e "-------------------------------- RESULT ------------------------------\n"

	echo -e "\nCreated  : "  $directory_name " directory "

	echo -e "----------------------------------------------------------------------\n" 
		
	
}

create_a_standard_file(){
	
	touch $standard_file_name

	echo -e "-------------------------------- RESULT ------------------------------\n"

	echo -e "\nCreated  : "  $standard_file_name " standard file "

	echo -e "----------------------------------------------------------------------\n" 
		
}

vi_editor(){
	
	echo "Opening Vi Editor..."

	sleep 1

	vi $file_name
	
	echo "Showing the contents of the file..."

	sleep 1
	
	echo -e "--------------------------------contents ------------------------------\n"

	cat $file_name

	echo -e "----------------------------------------------------------------------\n" 	

}

move_file(){
	
	mv $file_name $new_location

	echo -e "-------------------------------- RESULT ------------------------------\n"

	echo -e "\n Moved  : "  $file_name " to" $new_location

	echo -e "----------------------------------------------------------------------\n" 	

}

copy_file(){
	
	cp $file_name $new_location

	echo -e "-------------------------------- RESULT ------------------------------\n"

	echo -e "\n Copied  : "  $file_name " to" $new_location

	echo -e "----------------------------------------------------------------------\n" 

}

delete_file(){

	rm -rf $file_name

	echo -e "-------------------------------- RESULT ------------------------------\n"

	echo -e "\n Deleted  : "  $file_name 

	echo -e "----------------------------------------------------------------------\n" 	
	

}

#################  functions of basic_data_file_operations_options ######################

gzip_file(){

	gzip $file_name

	echo -e "-------------------------------- RESULT ------------------------------\n"

	echo -e "\n Zipped   : "  $file_name 

	echo -e "----------------------------------------------------------------------\n" 	
	

}

gunzip_file(){

	gunzip $file_name

	echo -e "-------------------------------- RESULT ------------------------------\n"

	echo -e "\n Unzipped   : "  $file_name 

	echo -e "----------------------------------------------------------------------\n" 	
	

}
show_range(){

	echo -e "-------------------------------- RESULT ------------------------------\n"

	sed -n $start','$stop'p'  $file_name
	

	echo -e "----------------------------------------------------------------------\n" 	
	

}

without_NULL(){
	
	grep -v NULL $file_name  > 'without_NULL'+$file_name 

	echo -e "-------------------------------- RESULT ------------------------------\n"

	echo -e "\n file without NULL   : " 'without_NULL'+$file_name 

	echo -e "----------------------------------------------------------------------\n" 	
}

replace(){
	
	
	tr 'NULL' $element< $file_name > 'replace_'+$file_name 

	echo -e "-------------------------------- RESULT ------------------------------\n"

	echo -e "\n file   : " 'replace_'+$file_name 

	echo -e "----------------------------------------------------------------------\n" 	
}

filter(){
	grep $element $file_name > 'filtered_'+$file_name 

	echo -e "-------------------------------- RESULT ------------------------------\n"

	echo -e "\n Filtered   : " 'filtered_'+$file_name 

	echo -e "----------------------------------------------------------------------\n" 	
}

Concatenate(){

	read -p "How many files will be merged" n
 	read -p "Enter the file name:" name1
	read -p "Enter the file name:" name2
	cat $name1 $name2 > "concatenate.txt"
	i=3
	while [ $i -eq $n ]
	do
  		read -p "Enter the file name:" name3
		cat  "concatenate.txt" $name3 > "concatenate.txt"
	
   	i=$((i+1))
	done

	echo -e "-------------------------------- RESULT ------------------------------\n"

	echo -e "\n Output   : "  "concatenate.txt"

	echo -e "----------------------------------------------------------------------\n" 


} 

Split(){
 	split --lines=$n $file_name  split_

	echo -e "-------------------------------- RESULT ------------------------------\n"

	echo -e "\n Splitted   : " $file_name 

	echo -e "----------------------------------------------------------------------\n" 	
}

#################################   options   ##############################################

operation_options(){

	echo -e "What would you like to do?\n"| cowsay

	echo -e "\t 0: General file and directory operations"
	
	echo -e "\t 1: Basic data file operations for jr data scientist"

	echo -e "\t 2: Exit\n" 

	read -p "Which would you like to choose? : " selected 
}


general_file_and_directory_operations_options(){

	echo -e "What would you like to do?\n"| cowsay


	echo -e "\t 0: Change location" 

	echo -e "\t 1: View content on location" 

	echo -e "\t 2: Create a directory" 

	echo -e "\t 3: Create a standard file" 

	echo -e "\t 4: Edit the contents of an existing file with vi editor" 

	echo -e "\t 5: Move an existing file or directory" 

	echo -e "\t 6: Copy an existing file or directory" 

	echo -e "\t 7: Delete an existing file or directory" 

	echo -e "\t 8: Go to homepage" 

	echo -e "\t 9: Exit\n" 

	read -p "Which would you like to choose? : " selected 
}

basic_data_file_operations_options(){

	echo -e "What would you like to do?\n"| cowsay

	echo -e "\t 0: Change location" 

	echo -e "\t 1: View content on location" 
	
	echo -e "\t 2: Compress (to .gz)" 

	echo -e "\t 3: Uncompress ( from .gz )" 

	echo -e "\t 4: Show a range " 

	echo -e "\t 5: Save as txt without NULL" 

	echo -e "\t 6: Replace <NULL> with <....> and save as .txt" 

	echo -e "\t 7: filter by desired character in text file and save as .txt" 

	echo -e "\t 8: Concatenate files and save as .txt" 

	echo -e "\t 9: Split file by row (after each n lines) as .txt" 

	echo -e "\t 10: Go to homepage" 

	echo -e "\t 11: Exit\n" 

	read -p "Which would you like to choose? : " selected 


}

############################  options_cases   ####################################


 
 

general_file_and_directory_operations_options_case (){ 
	case $selected in 
		

		0)	
			clear

			content_on_location

			read -p " New location(example :/home/user_name/Desktop/) : "  new_location

			change_location
			


			general_file_and_directory_operations_options

			clear

			general_file_and_directory_operations_options_case

			
 
		;;
		1)
			clear

			content_on_location
			


			general_file_and_directory_operations_options

			clear

			general_file_and_directory_operations_options_case
					
		;;
		2)
			clear

			read -p "Directory name : "  directory_name

			create_a_directory

			content_on_location

			

			general_file_and_directory_operations_options

			clear

			general_file_and_directory_operations_options_case




		;;	
		3)
			clear

			read -p "Standard file name : "  standard_file_name

			create_a_standard_file

			content_on_location

			

			general_file_and_directory_operations_options

			clear

			general_file_and_directory_operations_options_case



		;;
		4)
			clear

			read -p "File name : "  file_name

			vi_editor

		

			general_file_and_directory_operations_options

			clear

			general_file_and_directory_operations_options_case




		;;
		5)

			clear

			content_on_location

			read -p "File name(from) : "  file_name 

			read -p "Address (to): "  new_location

			clear

			move_file

			content_on_location




			general_file_and_directory_operations_options

			clear

			general_file_and_directory_operations_options_case


		;;
		6)

			clear

			content_on_location

			read -p "File name(from) : "  file_name 

			read -p "Address (to): "  new_location

			clear

			copy_file

			content_on_location



			general_file_and_directory_operations_options

			clear

			general_file_and_directory_operations_options_case


		;;
		7)
			clear

			content_on_location

			read -p "File name : " file_name 

			clear

			delete_file

			content_on_location



			general_file_and_directory_operations_options

			clear

			general_file_and_directory_operations_options_case


		;;
		8)
			clear
			clear
			welcome 
			operation_options
			clear
			operation_case
		;;
		9)
			
			clear			
			echo -e "Good bye ...\n"| cowsay
			sleep 1
			exit
		;;
	esac
}



basic_data_file_operations_options_case (){
	case $selected in 
		

		0)	
			clear

			content_on_location

			read -p " New location(example :/home/user_name/Desktop/) : "  new_location

			change_location
			


			basic_data_file_operations_options

			clear

			basic_data_file_operations_options_case

			
 
		;;
		1)
			clear

			content_on_location
			


			basic_data_file_operations_options

			clear

			basic_data_file_operations_options_case
					
		;;
		2)
			clear
			
			content_on_location

			read -p "file name : "  file_name

			gzip_file

			content_on_location

			

			basic_data_file_operations_options

			clear

			basic_data_file_operations_options_case




		;;	
		3)
			clear

			content_on_location

			read -p "file name : "  file_name

			gunzip_file

			content_on_location

			

			basic_data_file_operations_options

			clear

			basic_data_file_operations_options_case



		;;
		4)
			clear

			content_on_location

			read -p "File name : "  file_name

			read -p "Start : "  start

			read -p "Stop : "  stop

			show_range

		

			basic_data_file_operations_options

			clear

			basic_data_file_operations_options_case




		;;
		5)

			clear

			content_on_location

			read -p "File name: "  file_name 

			without_NULL

			content_on_location




			basic_data_file_operations_options

			clear

			basic_data_file_operations_options_case


		;;
		6)

			clear

			content_on_location

			read -p "File name(from) : "  file_name 

			read -p "Element: "  element

			replace

			content_on_location




			basic_data_file_operations_options

			clear

			basic_data_file_operations_options_case


		;;
		7)
			clear

			content_on_location

			read -p "File name(from) : "  file_name 

			read -p "Element: "  element

			filter

			content_on_location



			basic_data_file_operations_options

			clear

			basic_data_file_operations_options_case
		;;
		8)
			clear

			content_on_location

			Concatenate

			content_on_location



			basic_data_file_operations_options

			clear

			basic_data_file_operations_options_case

		;;
		9)
			clear

			content_on_location

			read -p "File name(from) : "  file_name 

			read -p "Separate file by number of lines , n = : "  n

			Split

			content_on_location



			basic_data_file_operations_options

			clear

			basic_data_file_operations_options_case

		;;
		10)
			clear
			clear
			welcome 
			operation_options
			clear
			operation_case
		;;
		11)
			
			echo -e "Good bye ...\n"| cowsay
			sleep 1
			exit
		;;
	esac
}
 
################################  main case  ###################################



operation_case (){
	case $selected in 
		
				
		
		0)

			clear
			clear
			welcome
			general_file_and_directory_operations_options
			general_file_and_directory_operations_options_case

			clear



		;;
		1)

			clear
			clear
			welcome
			basic_data_file_operations_options
			basic_data_file_operations_options_case

			clear

			



		;;
		2)
			clear
			clear
			echo -e "Good bye ...\n"| cowsay
			sleep 1
			exit
		;;
	esac
}


###################################### Main ##############################################
 
welcome 
operation_options
clear
operation_case

