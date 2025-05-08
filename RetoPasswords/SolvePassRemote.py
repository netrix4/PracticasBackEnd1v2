# de 5 a 8 caracteres
# encontrar una contrasena dentro de un string grande

import http.client
import json

# passwordToFind = "jammy-backports"
# passwordToFind = open(file='password.txt', mode='r').read()

# fileStringWSpaces = open(file='textFile.txt', mode='r').read()
fileStringWSpaces = open(file='10-million-password-list-top-1000000.txt', mode='r').read()

def main():
    # fileStringWSpaces = open(file='passwords.txt', mode='r').read()

    generalCounter = 0
    isFound = False

    fileString = fileStringWSpaces

    for fileLetter in fileString:
        print(generalCounter)
        if (isFound == False):

            testingPass = fileString[generalCounter]+fileString[generalCounter+1]+fileString[generalCounter+2]+fileString[generalCounter+3]+fileString[generalCounter+4]
            
            response = is_this_the_pass(testingPass)
            for increment in range(4):
                # print(testingPass, response)
                # if(testingPass == passwordToFind):
                if(response["acerto"] == True):
                    print('contrasena encontrada', testingPass)
                    isFound = True

                # testingPass = testingPass+fileString[testingPass.__len__()+1]
                testingPass = testingPass+fileString[testingPass.__len__()+increment]

            # testingPass = fileString[generalCounter]+fileString[generalCounter+1]+fileString[generalCounter+2]+fileString[generalCounter+3]+fileString[generalCounter+4]
            print(testingPass)


        generalCounter+=1
    # if(isFound==False):
    #     print("Contrasena no encontrada")


def is_this_the_pass(pass_to_try:str):
    conn = http.client.HTTPConnection("192.168.0.243", 5000)
    payload = ''
    headers = {}
    conn.request("GET", f"/login?password=%22{pass_to_try}%22", payload, headers)
    res = conn.getresponse()
    data = res.read()
    real_data = json.loads(data.decode("utf-8"))

    return real_data

def get_file_string_with_spaces():
    print('getfilestringwithspaces')

'192.168.0.243:5000/login?password="pako"'


if __name__ == '_main_':
    main()
