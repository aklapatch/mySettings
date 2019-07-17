#!/bin/bash
echo "copying ~/$1 to $1"
install -D -T  ~/$1 $1
