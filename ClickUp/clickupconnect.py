import requests

tecnologia = requests.get('https://api.clickup.com/api/v2/user', headers={'Authorization': '######'})
print(tecnologia.text)


tecnologia2 = requests.get('https://api.clickup.com/api/v2/team', headers={'Authorization': '######'})
print(tecnologia2.text)

tecnologia3 = requests.get('https://api.clickup.com/api/v2/team/3001554/space?archived=false', headers={'Authorization': '######'})
print(tecnologia3.text)

tecnologia4 = requests.get('https://api.clickup.com/api/v2/space/3011253/folder?archived=false', headers={'Authorization': '#####'})
print(tecnologia4.text)

#https://api.clickup.com/api/v2/folder/folder_id/list?archived=false

#https://api.clickup.com/api/v2/list/list_id/task?archived=false
