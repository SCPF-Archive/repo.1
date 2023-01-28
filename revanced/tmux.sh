#!/bin/bash

clear
HOMEDIR="$PWD" ## /data/data/com.termux/files/home/dev/revanced

##########

# This downloads the ReVanced CLI, Integrations, and Patches.

prerequisites ()
{
clear
cd assets/temp && chmod +x download.prerequisites.sh && ./download.prerequisites.sh && cd $HOMEDIR
chmod +x copy.latest.files.sh && ./copy.latest.files.sh && cd $HOMEDIR
echo "ReVanced Prerequisites Updated/Installed"
echo "Going back to the menu..."
sleep 3
}

##########

copy_latest_files ()
{
cd assets/temp && rm -rf cli integrations patches && cd $HOMEDIR
}

##########

# This patches the packages.

select_apk ()
{
clear
mkdir packages/$APKS/versions
cp assets/versions/latest/versions.json revanced/packages/$APKS/versions
cp assets/temp/cli/*.jar revanced/packages/$ZXYX
cp assets/temp/integrations/*.apk revanced/packages/$APKS
cp assets/temp/patches/*.jar revanced/packages/$APKS
cd packages/$APKS
chmod +x download.sh && ./download.sh && chmod +x compile.sh && ./compile.sh experimental
rm -rf *.jar *.apk *.patch versions
cd $HOMEDIR
}

##########

# This signs the the packages.

sign_packages ()
{
clear
chmod +x sign.sh
./sign.sh
rm -rf packages/$APKS/output
clear
ls release/*.apk
cd $HOMEDIR
}

##########

# This moves the packages to internal storage.

move_packages ()
{
echo "Moving the packages..."
cd /
mkdir /storage/emulated/0/ReVanced
mv $HOMEDIR/release/*.apk /storage/emulated/0/ReVanced
cd $HOMEDIR
}

##########

# This updates the repo.

update_script ()
{
clear
git reset --hard
git pull
chmod +x tmux.sh
clear
}

##########

# This shows the script info.

script_info ()
{
echo " The script is under development.

In this script, you can patch the supported Revanced applications without even using the official ReVanced Manager.
If you already have Termux, why do bother installing the ReVanced Manager when you can patch it in here?
"
}

##########

# This is a welcome message.

wlcmsg ()
{
clear
echo "
                                                  
                 .,...........',.                 
                .:'            ,;                 
              .';'              ,;..              
           .','..      ....      .',,'.           
         .,,.       .';kXKd,'.       ';,.         
       .,;.     'cdOOkkXWWKkkOkd:.     .;,        
      .:'    .;kKkl;.. oNXc ..;oO0x,     ,:.      
     .:.    ,kKd,      oNXc      ;kKx.    ':.     
    .:'    :K0;      .c0WNO:.      :K0,    ,;.    
    ;;    ;K0'        cXMMK;        ;K0'    ;,    
   .:.   .xNc          :kx;          oNo    ';    
   .:.   .O0'                        ;Xk.   .:.   
   ':.   .O0,     ......  .....      ;Xk.   .:.   
  ':.    .dNl    .d0KKd.  'xK00o.    oNl     ':.  
.;,.      '0K;..cx0XNx.    'ONKOd:..:Xk.      .,;.
'c.        :XXOOd:..,.      .,.'cxO0XK,        .c.
 .:.      .lkOX0:.              .cKXOkc       ':. 
  .:'      .. 'd00dc,... ....,cx0Oo' ..      ,:.  
   .;;.         .;lxkkkkkkkkkkxl,.          ;;.   
     ,:...''.        ..''''..        ......:,     
      .,'...''''..              ..'''''.'',.      
              ..'''''''....'''''''..              
                     .........                    
                                                 
"
sleep 3
}

##########

# This is the main function.

wlcmsg

select ZXYX in "Install Prerequisites" "Backdrops" "Citra Emulator" "Sign Packages" "Move Packages" "Update Script" "Script Info" "Exit Script"
do
  case $ZXYX in
    "Install Prerequisites") prerequisites ;;
    "Backdrops") APKS="backdrops" && select_apk && unset APKS && break ;;
    "Citra Emulator") APKS="citra.emulator" && select_apk && unset APKS && break ;;
    "Sign Packages") sign_packages && break ;;
    "Move Packages") move_packages && break ;;
    "Update Script") update_script && break ;;
    "Script Info") script_info ;;
    "Exit Script") clear && break ;;
    *) echo "Command not valid." ;;
  esac
done
