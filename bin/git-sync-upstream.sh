#!/bin/bash 
cd $1;

rm list.text;
for i in `ls -lrt -d -1 $PWD/*`; 
	do
	  	echo $i  ; 
	  	cd $i;
		git fetch upstream ;
		git merge upstream/master;
 		git checkout master;
 		git push origin master;
		echo $i \n
		echo "=================";
		cd ../;
done 
# git remote add upstream {upstream-repo.git}