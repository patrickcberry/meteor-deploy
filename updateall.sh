#!/bin/sh

if [ $# == 1 ]; then
	comment=$1
else
	comment="General update"
fi

git add . && git commit -a -m "$comment" && git push
