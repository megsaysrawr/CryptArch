from binascii import hexlify

message = ""
key = ""
while len(message) != 16:
	message = raw_input("Please enter your message as exactly 16 characters: ")
while len(key) != 16:
	key = raw_input("Please enter your key as exactly 16 characters: ")

hex_message = hexlify(message)
hex_key = hexlify(key)

print "Great! Take this output and paste it into the demo_day_encryptor.t.v file."
print "Hex Message: " + hex_message
print "Hex Key: " + hex_key
