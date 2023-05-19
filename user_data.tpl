#!/bin/bash

sudo yum update -y
sudo yum install python3 -y 
sudo yum install python3-pip -y

sudo echo "print('Hello World')" > hello.py
sudo python3 main.py
