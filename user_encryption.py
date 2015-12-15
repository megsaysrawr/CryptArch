"""
Encryption
How to Use:
			1) Open the terminal, right click, paste "cd C:\Users\mmccauley\Documents\GitHub\CryptArch"
			2) Type "python user_encryption.py". Follow the instructions.
			3) Copy your hex message and key result.
				(The secret to copying in the terminal is right click, select all, click anywhere,
				highlight what you want to copy, right click on the title window, edit, copy.)
			4) Enter your hex message and key into demo_day_encryptor.t.v on lines 50 and 52, respectively
			5) Open ModelSim, paste "cd C:/Users/mmccauley/Documents/GitHub/CryptArch" into the Transcript.
				(Note: The slashes go the other way for ModelSim.)
			6) Run "do demo_day_encryptor.do"
			7) Be amazed at your encrypted output!
"""

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