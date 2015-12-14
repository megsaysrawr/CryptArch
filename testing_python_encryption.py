# testing_python_encryption.py

from Crypto.Cipher import AES
#need to import AES and create a new AES object
#AES.MODE_ECB is using electronic code book method of encryption,
#where each block is simply encrypted using the key independent of the other blocks
obj = AES.new('comparchcomparchcomparch', AES.MODE_ECB)
message = "comparch is fun!"
ciphertext = obj.encrypt(message)
ciphertext
answer = open('answer.txt', 'w')
answer.write(ciphertext)
answer.close()
obj2 = AES.new('comparchcomparchcomparch', AES.MODE_ECB)
print obj2.decrypt(ciphertext)
