#!/bin/sh

sensors | grep Core | awk '{print substr($3, 2, length($3)-3)}' | tr "\\n" " " | sed 's/ /°C  /g' | sed 's/  $//'
