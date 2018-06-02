#!/bin/bash

echo "Deleting old files..."
rm -r /var/www/html/PiXploitHost/*

echo "Moving exploit files..."
mv ./xvortex-ftp-455/exploit/*.* ./PiXploitHost/ps4/exploits/455/xvortex-ftp/
mv ./xvortex-hen-455/exploit/*.* ./PiXploitHost/ps4/exploits/455/xvortex-hen/
mv ./xvortex-hen-455-v1/exploit/*.* ./PiXploitHost/ps4/exploits/455/xvortex-hen-v1/
mv ./specter-455/*.* ./PiXploitHost/ps4/exploits/455/specter/

mv ./xvortex-dumper-505/exploit/*.* ./PiXploitHost/ps4/exploits/505/xvortex-dumper/
mv ./xvortex-ftp-505/exploit/*.* ./PiXploitHost/ps4/exploits/505/xvortex-ftp/
mv ./xvortex-hen-505/exploit/*.* ./PiXploitHost/ps4/exploits/505/xvortex-hen/
mv ./mira-hen/*.* ./PiXploitHost/ps4/exploits/505/mira-hen/


echo "Cleaning up..."
rm -rf ./xvortex-ftp-455/
rm -rf ./xvortex-hen-455/
rm -rf ./xvortex-hen-455-v1/
rm -rf ./specter-455/

rm -rf ./xvortex-dumper-505/
rm -rf ./xvortex-ftp-505/
rm -rf ./xvortex-hen-505/
rm -rf ./mira-hen/


echo "Self deleting..."
rm moveFiles.sh

echo "Moving files to web server document root..."
mv ./* /var/www/html/

echo "Done!"