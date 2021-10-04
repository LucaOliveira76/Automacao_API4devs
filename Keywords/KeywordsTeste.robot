*** Settings ***
Library         RequestsLibrary
Library         Collections
Resource        ../Resources/Variables.robot

*** Keywords ***
Conectar API
    Create Session      API    ${URL}


que é feito o POST request
    ${response}     POST    ${URL}      data=${body}
    Set suite variable     ${response}

o status code deverá ser "${status_code}"
    Should be equal as strings  ${response.status_code}     ${status_code}

o campo idade consta no ResponseBody
    Dictionary should contain key      ${response.json()}      idade

o campo sexo deve ser "masculino"
    Dictionary should contain item      ${response.json()}      sexo    Masculino

Armazenar cpf em variável
    # Log to console  ${response.json()}[cpf]
    ${cpf}=     Set variable     ${response.json()}[cpf]
    Set test variable   ${cpf}

Limpar variável
    Log to console      ${cpf}
    ${cpf}=     Set variable    ${EMPTY}
    Log to console      ${cpf}