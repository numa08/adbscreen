import os
import sys

from com.android.monkeyrunner import MonkeyRunner, MonkeyDevice

serial = sys.argv[1]
output_file = sys.argv[2]

#print serial
#print output_file

if serial == None or serial == "0" :
	device = MonkeyRunner.waitForConnection(3000)
	#print "none"
else:
	device = MonkeyRunner.waitForConnection(3000, serial)

result = device.takeSnapshot()

if output_file == None or output_file == "0":
	#print "non file"
	output_file = "result.png"

#print output_file
result.writeToFile(output_file,'png')
