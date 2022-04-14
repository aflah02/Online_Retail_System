import json
f = open('APIs/categorylinks.json')
data = json.load(f)
print(data['Electronics'])