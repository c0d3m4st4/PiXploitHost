#!/bin/bash

echo "Deleting old files..."
rm -r /var/www/html/*

echo "Moving exploit files..."
mv ./xvortex-dumper-455/exploit/*.* ./xploitHost/ps4/exploits/455/xvortex-dumper/
mv ./xvortex-ftp-455/exploit/*.* ./xploitHost/ps4/exploits/455/xvortex-ftp/
mv ./xvortex-hen-455/exploit/*.* ./xploitHost/ps4/exploits/455/xvortex-hen/
mv ./specter-455/*.* ./xploitHost/ps4/exploits/455/specter/


echo "Cleaning up..."
rm -rf ./xvortex-dumper-455/
rm -rf ./xvortex-ftp-455/
rm -rf ./xvortex-hen-455/
rm -rf ./specter-455/

echo "Self deleting..."
rm moveFiles.sh

echo "Moving files to web server document root..."
mv ./* /var/www/html/

echo "Done!"