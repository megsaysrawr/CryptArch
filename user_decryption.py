"""
Decryption
How to Use:
			1) Copy your encrypted hex output and hex key from ModelSim.
					(*Note: Make sure your hex key is the same key that you used to encrypt your message.)
			2) Enter your hex message (ciphertext) and hex key (key) into demo_day_decryptor.t.v
			   on lines 50 and 52, respectively. Save the file.
			3) Run "do demo_day_decryptor.do" in ModelSim.
			4) Copy your decrypted hex message and hex key result from the Transcript
			   and paste them below in hex_output and hex_key respectively.
			5) Save (ctrl + S) and build (ctrl + B). Your key and decoded message should come out in plain text!
			   		(*Note: If your decoded message says "[Decode error- ouput not utf-8]" it means that
			   		  Python can't match one of the hex values to a character. It's not your fault,
			   		  so please try a different message!)

"""

from binascii import unhexlify

#paste your hex output here
hex_output = '69206c6f766520636f6d706172636821'
#paste your hex key here
hex_key = '6d65677361797372617772746f796f75'

unhex_output = unhexlify(hex_output)
unhex_key = unhexlify(hex_key)

print "Text Key: " + unhex_key
print 'Text Output: ' + unhex_output