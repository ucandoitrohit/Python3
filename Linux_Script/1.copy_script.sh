
#!/bin/bash
USER=`whoami`

loc=`pwd`
ip="X.X.X.X"
dic="/home/rohit/"
#cmd=`ls | grep $file3`
clear
echo ""
read -p "Kindly confirm are you using Key Authentication(Public/Private) to copy (Yes/No):-" key
echo ""
case $key in

        Y|y|Ye|Yes|ye|yes|YES)
        echo "You choosed the Key Authenticaltion to copy the file..."
	echo ""
        read -p "Provide the Public or Private Key file name :- " key
        echo "" 
        if [ -f $loc/$key ] ; then
                echo "'$key' key file exists at this location $loc proceed further"
		echo ""
                        read -p "Copying from JBOX to Localhost / Locahost to JBOX (J2L/L2J):-" jbox
			echo ""
                        case $jbox in
                                J2L|j2l|j|J)
                                echo "You chossed the JBOX to localhost.... "
				echo ""				
        			read -p "Enter Username:- " user3
				echo ""
				echo ""
				read -p "Enter the file name to be copied:-" file3
				echo ""
				read -p "Enter the path of the file on JBOX where file is present  e.g(/home/$user3/):-" path5
				echo ""
                                scp -C -i $key $user3@$ip:$path5$file3 $loc
					if [ $? == 0 ]; then
						echo ""
						echo "'$file3' File has been copied at localhost '$loc'"
#						echo $cmd
					else
						echo ""
						echo "Something is wrong"
					fi
					
                                ;;
                                L2J|l2j|l|L)
                                echo "You choosed the localhost to JBOX"
				echo ""
				read -p "Enter Username:- " user4
				echo ""
				read -p "Enter the file or directory name to be copied from localhost to JBOX :-" file4
					if [[ -f $loc/$file4 ]]; then
						echo ""
						echo "'$file4' file found at location at $loc"
						echo ""
						read -p "Enter the path of JBOX to be copied e.g(/home/$user4/):-" path4
						echo ""
						scp -i $key $file4 $user4@$ip:$path4
							if [ $? == 0 ]; then
								echo ""
								echo "'$file4' File has been copied on JBOX Server at '$path4' location"
								echo ""
							else
								echo ""
								echo "Something is wrong"
							fi
						 	echo ""	
					else
						echo ""
						echo "'$file4' not found at location $loc/"
						echo ""
						echo "Please Provide the correct name of File or Directory...."
					echo ""
					fi
                                ;;
                                *)
                                echo "Your choice doesn't match with J2L/j2l/L2J/l2j) "
                                echo ""
				exit 1
                                ;;
                                esac
else
                echo "'$key' key file dosn't exists at this location $loc";
		echo ""
		echo "Please provide correct location...."
		echo ""
        fi
        ;;
        N|n|No|no|NO)
	echo ""
	echo "You choosed the Password authentication to be copied..."
	echo ""
        read -p "Please confirm Copy from Local to Remote or Remote to Local(L2R/R2L):-" work
	echo ""
        #echo $(idate) $USER = $work >> pur.txt
        case $work in
                Local|LOCAL|local|l|L|l2r|L2R)
                echo "You choose the Local to Remote copying...."
		echo ""
                read -p "Enter the file name you want to copy from local to remote:-" file1
                if [ -f `pwd`/$file1 ]; then
                        echo ""
			echo "'$file1' file exists at this location "`pwd`".";
			echo ""
                        read -p "Enter the Remote Host IP Address or/q to quit:-" host
                        if [ $host == q ]; then
				echo ""
                                echo "You Press q for the quit"
				echo ""
                                exit 1
                        else
				echo ""
                                read -p "Enter Remote Host Username:-" user
				echo ""
                                #read -sp "Enter Remote host Password:-" pass
				#echo ""
                                read -p "Enter the path to be copied on remote .e.g( /home/$user/) " path1
				echo ""

                                if ssh $user@$host [ -d $path1 ]; then
                                	echo ""
				        echo "Directory ($path1) Found On $host:"
					echo ""
					echo "Provide the SSH password to copy from local to remote ($host) at $path1 location"
					echo ""
				scp $file1 $user@$host:$path1
                                echo ""
				echo "$file1 File has been Copied on $host Machine:"
                                echo ""
				
                                else
                                        echo "Directory ($path1) Not Found On $host:";
					echo ""
                                        echo " Please correct the path "
					echo ""
                                        exit
                                fi
                        fi
                else
                        echo "'$file1' file does not exists at this location "`pwd`".";
			echo ""
                fi
                ;;
                Remote|REMOTE|remote|r|R|r2l|R2L)
                echo "You choose the Remote to Local copying...."
		echo ""
		read -p "Enter the file name you want to copy from Remote to Local:-" file2
		
		echo ""
                read -p "Enter the path of the file to copy from Remote to Local e.g(/home/rohit/):-" path2
		echo ""
		read -p "Enter the Remote Host IP Address or/q to quit:-" host2
		echo ""
                if [ $host2 == q ]; then
                        echo "You Press q for quit"
			echo ""
                        exit 1
                else
                        read -p "Enter Remote Host Username:-" user2
                        echo ""
#			 read -sp "Enter Remote Host Password:-" pass2
#                        if sshpass -p $pass2 ssh $user2@$host2 [ -f $path2/$file2 ]; then
			 if ssh $user2@$host2 [ -f $path2/$file2 ]; then
			echo ""
                        echo "$file2 File Found on $host2 server at location $path2$file2 "
			echo ""
			echo "Provide the SSH password to copy from remote ($host2) server to local (`pwd`) location"
			echo ""
                        scp $user2@$host2:$path2/$file2 `pwd`
			echo ""
		
			echo "$file2 File has been Copied on local Machine `pwd` :"
			echo ""

                else
			echo ""
                        echo "File Not Found at path $path2$file2 "
			echo ""
                        fi
                fi
                ;;
                *)
        echo "Your choice doesn't match with (L2R/R2L/l2r/r2l) "
	echo ""
        exit 1
        ;;
        esac
;;
*)
echo "Your choice doesn't match with (Yes/No/Y/y/n/yes/no) "
echo ""
exit 1
;;
esac
