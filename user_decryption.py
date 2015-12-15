"""
Decryption
How to Use:
			1) Get the encrypted hex output from ModelSim and paste it into the hex_output below.
			2) Get the hex key from user_encryption.py or ModelSim and paste it into hex_key below.
			3) Save (ctrl + S) and build (ctrl + B). Your key should come out in plain text. Your decoded message is not utf-8.
			4) Be amazed at your decrypted output!
"""

from binascii import unhexlify

#paste your hex output here
hex_output = u"049feb26d0cba0441b4a6112bb067a13"
#paste your hex key here
hex_key = u"737570657220736563726574206b6579"

unhex_output = unhexlify(hex_output)
unhex_key = unhexlify(hex_key)

print "Text Key: " + unhex_key
print "Text Output: " + unhex_output