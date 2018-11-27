#!/bin/sh

#  XCFakeCode.sh
#  RouterDemo
#
#  Created by Alexcai on 2018/11/23.
#  Copyright © 2018 dongjiu. All rights reserved.
echo "hello Fake Code"
#
#find $SRCROOT -name *.h
#
#echo ===================
#cat $SRCROOT/RouterDemo/Router/XCAppEnterViewController.h

grep -n  "NSLog" $SRCROOT/RouterDemo/Router/XCAppEnterViewController.m


exit 0
#set




