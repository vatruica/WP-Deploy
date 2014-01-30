#!/bin/bash

# download list - core wp + plugins
DWD_WP="http://wordpress.org/latest.zip"
DWD_BWPUP="http://downloads.wordpress.org/plugin/backwpup.3.1.1.zip"
DWD_BBQ="http://downloads.wordpress.org/plugin/block-bad-queries.zip"
DWD_SEO="http://downloads.wordpress.org/plugin/wordpress-seo.1.4.24.zip"
DWD_GA="http://downloads.wordpress.org/plugin/google-analytics-for-wordpress.4.3.4.zip"
DWD_SMG="http://downloads.wordpress.org/plugin/google-sitemap-generator.3.3.1.zip"

# extra links
WP_SECRETSALT="https://api.wordpress.org/secret-key/1.1/salt/"

# files
WPZIP="latest.zip"

# array of files to delete
FILES2DEL=( license.txt readme.html )

#echo ${FILES2DEL[@]}


############################################################

# download wordpress
#wget $DWD_WP

# extract and modify accordingly
#unzip $WPZIP && rm -rf $WPZIP
cd wordpress 

# delete files
rm -rf ${FILES2DEL[@]}

#download secret keys + salt
#wget $WP_SECRETSALT -O salt