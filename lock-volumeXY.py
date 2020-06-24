import requests
import json

req = requests.post(
        'http://localhost/api/v1.0/storage/volume/PoolXY/lock/',
        auth=('root', 'PASSWORD'),
        headers={'Content-Type': 'application/json'},
        verify=False,

        data=json.dumps({
                'passphrase': 'PASSPHRASE'
        }),
)
print (req.text)
