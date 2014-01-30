#!/bin/bash

# list of everythign needed
# download everything needed - 
# extract where needed - 
# change wp files -
	#remove files - fileslist
	#add files - fileslist
	#modify files - fileslist
# upload to server

##################
#
# 1 - DECLARING VARS AND MAKING LIST WITH EVERYTHING NEEDED
#
###################

# download list - core wp + plugins
DWD_WP="http://wordpress.org/latest.zip"
DWD_BWPUP="http://downloads.wordpress.org/plugin/backwpup.3.1.1.zip"
DWD_BBQ="http://downloads.wordpress.org/plugin/block-bad-queries.zip"
DWD_SEO="http://downloads.wordpress.org/plugin/wordpress-seo.1.4.24.zip"
DWD_GA="http://downloads.wordpress.org/plugin/google-analytics-for-wordpress.4.3.4.zip"
DWD_SMG="http://downloads.wordpress.org/plugin/google-sitemap-generator.3.3.1.zip"
# download plugin list array
DWD_ARR=( $DWD_BWPUP $DWD_BBQ $DWD_SEO $DWD_GA $DWD_SMG )

# extra links
WP_SECRETSALT="https://api.wordpress.org/secret-key/1.1/salt/"

# files
WPZIP="latest.zip"

# array of files to delete
FILES2DEL=( license.txt readme.html wp-config-sample.php )

#echo ${FILES2DEL[@]}

############################################################

##################
#
# 2 - DOWNLOADING AND EXTRACTING
#
###################

# download wordpress
wget $DWD_WP
# extract and modify accordingly
unzip $WPZIP && rm -rf $WPZIP
# download plugins
wget -P tmp/ ${DWD_ARR[@]}
# unzip them in plugins directory 
unzip tmp/\*.zip -d wordpress/wp-content/plugins/
rm -rf tmp/*

##################
#
# 3 - MODIFYING FILES
#
###################

# adding files
cp add2wp/* wordpress/

# delete files
rm -rf wordpress/${FILES2DEL[@]}

#download secret keys + salt
#wget $WP_SECRETSALT -O salt

#SECRETSALT=$(cat salt)
#sed -i -e 's/thisisthesecretkeylocation/$SECRETSALT/g' add2wp/wp-config.php

#SECRETSALT=$(wget $WP_SECRETSALT -q -O -)
#sed -i -e "s/thisisthesecretkeylocation/$SECRETSALT/g" add2wp/wp-config.php
