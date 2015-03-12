#!/bin/bash

#Trouver le UID du process apache2

pida=$(ps -ef | grep apache2 | cut -d ' ' -f 1 | uniq -d)
echo $pida

