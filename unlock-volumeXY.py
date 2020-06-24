import requests
import json

myFile = open('/mnt/ramfs/myKey.key','r')
myPass  = myFile.read()

#print (myPass)

req = requests.post(
        'http://localhost/api/v1.0/storage/volume/Pool/unlock/',
        auth=('root', 'PASSWORD'),
        headers={'Content-Type': 'application/json'},
        verify=False,
        data=json.dumps({
                'passphrase' : myPass
        }),
)
print (req.text)
