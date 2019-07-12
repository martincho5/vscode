import requests

#request = requests.get('https://uadedesa.kanbantool.com/api/v3/users/current.json?access_token=M2U263DDN63Y')
#print(request.text)

#tableros_json = request.json()
#print(tableros_json)
#for p in tableros_json['boards']:
#    print(p['name'],p['id'])
#341513
#/boards/:board_id/preload.json
tecnologia = requests.get('https://uadedesa.kanbantool.com/api/v3//boards/341513/preload.json?access_token=M2U263DDN63Y')
#print(tecnologia.text)
tecnologia_json = tecnologia.json()
#print(tecnologia_json)
#for tec in tecnologia_json['swimlanes']:
#   print(tec['name'])
for tec in tecnologia_json['workflow_stages']:
   print(tec['name'],tec['id'])

tecnologiatasks = requests.get('https://uadedesa.kanbantool.com/api/v3/boards/341513.json?access_token=M2U263DDN63Y')
#print(tecnologia.text)
tecnologiatarea_json = tecnologiatasks.json()
#print(tecnologiatarea_json)
tareas = 'https://uadedesa.kanbantool.com/api/v3/task/'
idTarea = '24863408'
tarea2 = '.json?access_token=M2U263DDN63Y'
reqpost = tareas + idTarea + tarea2
print(reqpost)
fcompletados = open("completadas.txt","w")
fpendientes = open("pendientes.txt","w")
#archivartarea = requests.post('https://uadedesa.kanbantool.com/api/v3/task/24863408.json?access_token=M2U263DDN63Y')
for tec in tecnologiatarea_json['tasks']:
   if tec['workflow_stage_id'] == 2584763:
      #Trae las tareas que están en estado Completadas
      print("Completadas")
      print(tec['name'],tec['id'],tec['workflow_stage_id'])
      fcompletados.write(tec['name']+"\n")
   elif tec['workflow_stage_id'] == 2584765:
      #Trae las tareas que están en estado Esperando
      print("Esperando")
      print(tec['name'],tec['id'],tec['workflow_stage_id'])
      fpendientes.write(tec['name']+"\n")
   elif tec['workflow_stage_id'] == 2584767:
      #Trae las tareas que están en estado Trabajando
      print("Esperando")
      print(tec['name'],tec['id'],tec['workflow_stage_id'])
      fpendientes.write(tec['name']+"\n")
fcompletados.close()
fpendientes.close()

#request = requests.get('http://api.open-notify.org')
#print(request.text)
#print(request.status_code)
#people = requests.get('http://api.open-notify.org/astros.json')
#print(people.text)
#people_json  = people.json()
#print(people_json)
#To print the number of people in space
#print("Number of people in space:",people_json['number'])
#To print the names of people in space using a for loop
#for p in people_json['people']:
#    print(p['name'])
