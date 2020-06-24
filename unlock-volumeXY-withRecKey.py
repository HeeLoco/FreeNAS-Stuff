import requests
import json

req = requests.post(
        'http://localhost/api/v1.0/storage/volume/Pool/unlock/',
        auth=('root', 'PASSWORD'),
        headers={'Content-Type': 'application/json'},
        verify=False,

        data=json.dumps({
                'recovery_key': 'RECOVERYKEY'
        }),
)
print (req.text)
