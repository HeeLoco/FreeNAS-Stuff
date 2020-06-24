import requests
import json
import base64

recovery_key = open('/mnt/ramfs/myKey.key','rb')
recovery_key_binary  = recovery_key.read()
recovery_key_string  = (base64.b64encode(recovery_key_binary)).decode('ascii')

print (recovery_key_string)

req = requests.post(
        'http://localhost/api/v1.0/storage/volume/Pool/unlock/',
        auth=('root', 'PASSWORD'),
        headers={'Content-Type': 'application/json'},
        verify=False,
        data=json.dumps({'recovery_key' : recovery_key_string}),
)
print (req.text)
