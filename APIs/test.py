import json
f = open('APIs/links.json')
data = json.load(f)
print(data['Sprite coca cola'])