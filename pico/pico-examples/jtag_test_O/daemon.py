
##daemon for jtag user side.
import usb.core
import usb.util

dev = None

# all the define types
XRAYJTAG_BUFFER_SIZE     		=    	64
XRAYJTAG_VID 					=      	0x1209
XRAYJTAG_PID 					=      	0xC0CA
XRAYJTAG_TIMEOUT   				=  		1000
XRAYJTAG_bEndpointAddress_OUT	= 		0x1 
XRAYJTAG_bEndpointAddress_IN	= 		0x82


# structure 
XRAYJTAGCmd = {
	"CMD_STOP"      :     '0',
	"CMD_INFO"      :     '1',
	"CMD_FREQ"      :     '2',
	"CMD_XFER"      :     '3',
	"CMD_IDCODE"    :     '4',
	"CMD_GETSIG"    :     '5',
	"CMD_CLK"       :     '6',
	"CMD_RESET"     :     '7'
}


def XRAYJTAG_INIT():
	global dev
	print("Finding XRAYJTAG...")
	dev = usb.core.find(idVendor=XRAYJTAG_VID, idProduct=XRAYJTAG_PID)  # find our device
	if dev is None:
		raise ValueError('Device not found')
	else:
		print("Device Handle Found")

	# set the active configuration. With no arguments, the first
	# configuration will be the active one

	dev.set_configuration()
	print("geting active config...")
	# get an endpoint instance
	cfg = dev.get_active_configuration()
	intf = cfg[(0,0)]
	print("active config found")

	print("Seting Endpoint...")
	ep = usb.util.find_descriptor(
		intf,
		# match the first OUT endpoint
		custom_match = \
		lambda e: \
			usb.util.endpoint_direction(e.bEndpointAddress) == \
			usb.util.ENDPOINT_OUT)
	assert ep is not None
	print("Ready to send")
	return 0


def printWarn(data):
    print('\033[33m'+data+'\033[0m')

def printError(data):
    print('\033[31m'+data+'\033[0m')

def getversion():
	global dev
	ret_status = dev.write(XRAYJTAG_bEndpointAddress_OUT, XRAYJTAGCmd["CMD_INFO"], XRAYJTAG_TIMEOUT) 
	if ret_status == 0:
		print("Treansfer Failed")
	else:
		print("Waiting for data to receive")

	data_rev_list = dev.read(XRAYJTAG_bEndpointAddress_IN, XRAYJTAG_BUFFER_SIZE, XRAYJTAG_TIMEOUT)
	res = ""
	for val in data_rev_list:
		res = res + chr(val)
	print ("Sended CMD_INFO:\t:\t", XRAYJTAGCmd["CMD_INFO"])
	print ("The Version is\t:\t", str(res))

def JtagXfer():
	global dev
	ret_status = dev.write(XRAYJTAG_bEndpointAddress_OUT, XRAYJTAGCmd["CMD_XFER"], XRAYJTAG_TIMEOUT) 
	if ret_status == 0:
		print("Treansfer Failed")
	else:
		print("Waiting for data to receive")

	data_rev_list = dev.read(XRAYJTAG_bEndpointAddress_IN, XRAYJTAG_BUFFER_SIZE, XRAYJTAG_TIMEOUT)
	res = ""
	for val in data_rev_list:
		res = res + chr(val)
	print ("Sended CMD_XFER:\t:\t", XRAYJTAGCmd["CMD_XFER"])
	print ("The revert statement is\t:\t", str(res))

def idcodeScan():
	global dev
	ret_status = dev.write(XRAYJTAG_bEndpointAddress_OUT, XRAYJTAGCmd["CMD_IDCODE"], XRAYJTAG_TIMEOUT) 
	if ret_status == 0:
		print("Treansfer Failed")
	else:
		print("Waiting for data to receive")

	data_rev_list = dev.read(XRAYJTAG_bEndpointAddress_IN, XRAYJTAG_BUFFER_SIZE, XRAYJTAG_TIMEOUT)
	# res = ""
	# for val in data_rev_list:
	# 	res = res + chr(val)
	print ("Sended CMD_IDCODE:\t:\t", XRAYJTAGCmd["CMD_IDCODE"])
	print ("The revert statement is\t:\t", data_rev_list)


def jtag_reset():
	global dev
	ret_status = dev.write(XRAYJTAG_bEndpointAddress_OUT, XRAYJTAGCmd["CMD_RESET"], XRAYJTAG_TIMEOUT) 
	if ret_status == 0:
		print("Transfer Failed")
	else:
		print("Waiting for data to receive")

	data_rev_list = dev.read(XRAYJTAG_bEndpointAddress_IN, XRAYJTAG_BUFFER_SIZE, XRAYJTAG_TIMEOUT)
	res = ""
	for val in data_rev_list:
		res = res + chr(val)
	print ("Sended CMD_IDCODE:\t:\t", XRAYJTAGCmd["CMD_RESET"])
	print ("The revert statement is\t:\t", str(res))

def set_clk_freq():
	global dev
	ret_status = dev.write(XRAYJTAG_bEndpointAddress_OUT, XRAYJTAGCmd["CMD_FREQ"], XRAYJTAG_TIMEOUT) 
	if ret_status == 0:
		print("Transfer Failed")
	else:
		print("Waiting for data to receive")

	data_rev_list = dev.read(XRAYJTAG_bEndpointAddress_IN, XRAYJTAG_BUFFER_SIZE, XRAYJTAG_TIMEOUT)
	res = ""
	for val in data_rev_list:
		res = res + chr(val)
	print ("Sended CMD_IDCODE:\t:\t", XRAYJTAGCmd["CMD_RESET"])
	print ("The revert statement is\t:\t", str(res))

def main():
	user_preference = 0
	if(XRAYJTAG_INIT()!=0):
		printError("USB Initialization Falied\n")
	else:
		printWarn("Daemon is listening now!\n")
	while(True):
		print("1. CMD_INFO\n2. CMD_XFER\n3. CMD_IDCODE_SCAN\n4.Reset \n")
		user_preference = int(input(">>"))
		if user_preference == 1:
			getversion()
		elif user_preference == 2:
			JtagXfer()
		elif user_preference == 3:
			idcodeScan()
		elif user_preference == 4:
			jtag_reset()
		else:
			print("incorrect preference\n")
	
main()





