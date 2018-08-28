# major install script

if [ `uname`='linux' ]

then 

   echo -e "---------------------------------this is a linux system--------------------------------------"

else "plesae install in a linux system"

fi 

if [ 'echo $0'='-bash' ]

then 

   echo -e "---------------------------------ok, this is a linux bash shell------------------------------"

fi

gcc --version >/dev/null 
g++ --version >/dev/null

if [ `echo $?` -eq 0 ]

then 

   echo  -e "---------------------------------has insatlled gcc{include g++}------------------------------" 

fi 

clear

echo -en "please configure intel has access[yes,no]:" && read cin 

 

case ${cin} in

 yes)
    echo "ok, will be install gcc6.2"
     . $(pwd)/install.sh;;

 no)
    echo -en "are you before last or exit[last,before]" && read choice 
 
    if [ $choice="before" ] 
    
    then 
         echo "is ok" 
    fi ;;       
  *)

   echo "please input yes or no ";;
   
 esac 
