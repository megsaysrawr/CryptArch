# testing_binascii.py
import binascii

alphabet = ['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z']
hexbet = []

for letter in alphabet:
	hexbet.append(binascii.hexlify(letter))

print hexbet

#Encode
meg_hex = binascii.hexlify('meg')
print 'meg in hex is ' + meg_hex

#Decode
decode = binascii.unhexlify(meg_hex)
print meg_hex + (' in words is ') + decode

