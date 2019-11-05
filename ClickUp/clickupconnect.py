import requests

tecnologia = requests.get('https://api.clickup.com/api/v2/user', headers={'Authorization': 'pk_3006467_Q7XNHPB1A10NAQ6H4564VP6UGSLCW0EL'})
print(tecnologia.text)


tecnologia2 = requests.get('https://api.clickup.com/api/v2/team', headers={'Authorization': 'pk_3006467_Q7XNHPB1A10NAQ6H4564VP6UGSLCW0EL'})
print(tecnologia2.text)

tecnologia3 = requests.get('https://api.clickup.com/api/v2/team/3001554/space?archived=false', headers={'Authorization': 'pk_3006467_Q7XNHPB1A10NAQ6H4564VP6UGSLCW0EL'})
print(tecnologia3.text)

tecnologia4 = requests.get('https://api.clickup.com/api/v2/space/3011253/folder?archived=false', headers={'Authorization': 'pk_3006467_Q7XNHPB1A10NAQ6H4564VP6UGSLCW0EL'})
print(tecnologia4.text)

#https://api.clickup.com/api/v2/folder/folder_id/list?archived=false

#https://api.clickup.com/api/v2/list/list_id/task?archived=false