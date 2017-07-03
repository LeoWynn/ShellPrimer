#!/bin/sh

#----------------------------------------------------------
#Created a shell template at current path.
#----------------------------------------------------------


file_name="./""${1}"".sh"
now_date="$(date +%Y-%m-%d)"
#echo "${now_date}"

if [ -z "$1" ]
then
    echo "need a parameter: the name of you need created"
    echo "$0"" <file_name>"
else
    echo "#!/bin/sh" > "${file_name}"
    echo "\n" >> "${file_name}"
    echo "#----------------------------------------------------------" >> "${file_name}"
    echo "#""${1}"".sh" >> "${file_name}"
    echo "#Created by Leo Wen on ""${now_date}" >> "${file_name}"
    echo "#----------------------------------------------------------" >> "${file_name}"

    chmod 755 "${file_name}"
    open "${file_name}"
fi
