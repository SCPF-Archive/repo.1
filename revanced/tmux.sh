#!/bin/bash

clear
HOMEDIR="$PWD" ## /data/data/com.termux/files/home/dev/revanced

##########

# This restarts the script.

rerun_script ()
{
echo "Restarting Script"
for zdf in {3..1} ; do
  echo "$zdf"
  sleep 1
done
./$0
}

##########

# This downloads the ReVanced CLI, Integrations, and Patches.

prerequisites ()
{
clear
cd assets/temp
check_rv=$(ls cli/*.jar)
if [[ -z "$check_rv" ]] ; then
  chmod +x download.prerequisites.sh && ./download.prerequisites.sh && cd $HOMEDIR
  echo "ReVanced Prerequisites Updated/Installed"
elif [[ -n "$check_rv" ]] ; then
  echo "ReVanced Prerequisites Already Updated/Installed"
fi
cd $HOMEDIR
}

##########

# This patches the packages.

select_apk ()
{
clear
mkdir packages/$APKS/versions
cp assets/versions/latest/versions.json packages/$APKS/versions
cp assets/patches/*.patch packages/$APKS
cp assets/temp/cli/*.jar packages/$APKS/cli.jar
cp assets/temp/integrations/*.apk packages/$APKS/integrations.apk
cp assets/temp/patches/*.jar packages/$APKS/patches.jar
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
echo "
The script is under development.

In this script, you can patch the
supported Revanced applications without
even using the official ReVanced Manager.

If you already have Termux,
why do bother installing the
ReVanced Manager when you can
patch it in here?

All the patched packages are
moved in the ReVanced folder in
the internal storage.
"
}

##########

# This is a menu selection.

menu_select ()
{
select ZXYX in "Install Prerequisites" "Backdrops" "Citra Emulator" "Update Script" "Script Info" "Exit Script"
do
  case $ZXYX in
    "Install Prerequisites") prerequisites && rerun_script && break ;;
    "Backdrops") APKS="backdrops" && select_apk && unset APKS && sign_packages && move_packages && rerun_script ;;
    "Citra Emulator") APKS="citra.emulator" && select_apk && unset APKS && sign_packages && move_packages && rerun_script ;;
    "Update Script") update_script && rerun_script && break ;;
    "Script Info") script_info ;;
    "Exit Script") clear && break ;;
    *) echo "Command not valid." ;;
  esac
done
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
}

##########

# This is the main function.

wlcmsg && menu_select

##########
