# de 5 a 8 caracteres
# encontrar una contrasena dentro de un string grande

passwordToFind = open(file='password.txt', mode='r').read()
fileStringWSpaces = open(file='textFile.txt', mode='r').read()

def main():
    generalCounter = 0
    isFound = False

    fileString = fileStringWSpaces.strip()
    fileStringLenght = fileString.__len__()

    for fileLetter in fileString:
        if (isFound == False) and generalCounter <= fileStringLenght-8:

            # testingPass = fileString[generalCounter]+fileString[generalCounter+1]+fileString[generalCounter+2]+fileString[generalCounter+3]+fileString[generalCounter+4]
            testingPass = fileString[generalCounter : generalCounter + 5]

            for increment in range(4):
                print(testingPass, testingPass.__len__())

                if(testingPass == passwordToFind):
                    print('contrasena encontrada', testingPass)
                    isFound = True
                    break
                else:
                    testingPass = testingPass+fileString[generalCounter+5+increment]

        generalCounter+=1
    generalCounter = 0

if __name__ == '__main__':
    main()