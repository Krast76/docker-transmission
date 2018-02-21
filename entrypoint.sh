#!/bin/sh
if [ $1 = "bash" ]; then
	if [ -e /bin/bash ]; then
		/bin/bash
	else
		/bin/sh
	fi
fi
