#!/bin/bash
which martinize2 &> /dev/null
if [[ $? -ne 0 ]]
then
	echo "Need root permissions to install martinize"
	sudo pip install git+https://github.com/marrink-lab/vermouth-martinize.git#vermouth
else
	echo -e "Martinize already installed\n"
fi
