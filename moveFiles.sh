#!/bin/bash

echo "Moving files..."
mv ./idc/*.* ./ps4/exploits/idc/
mv ./lightningmods/Webpage\ Exploit/*.* ./ps4/exploits/lightningmods/
mv ./specter/*.* ./ps4/exploits/specter/
mv ./xvortex-dumper/exploit/*.* ./ps4/exploits/xvortex-dumper/
mv ./xvortex-ftp/exploit/*.* ./ps4/exploits/xvortex-ftp/
mv ./xvortex-hen/exploit/*.* ./ps4/exploits/xvortex-hen/

echo "Cleaning up..."
rm -rf ./idc/
rm -rf ./lightningmods/
rm -rf ./specter/
rm -rf ./xvortex-dumper/
rm -rf ./xvortex-ftp/
rm -rf ./xvortex-hen/

echo "Self deleting..."
rm moveFiles.sh

echo "Moving files to web server document root..."
mv ./* /var/www/html/

echo "Done!"