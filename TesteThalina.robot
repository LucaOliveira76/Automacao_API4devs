*** Settings ***
Library         RequestsLibrary
Library         Collections
Suite Setup     Conectar API

# *** Test Cases ***
# 1° - Validar o campo Status Code (Resultado esperado deve ser 200)
# 2° - Validar se o campo Idade consta do ResponseBody (Resultado esperado deve ser Sucesso)
# 3° - Validar se o valor do campo sexo do ResponseBody é igual a Masculino (Resultado esperado deve ser Sucesso)
# 4° - Armazenar o campo CPF do ResponseBody em uma variável nomeada CPF.
# 5° - Limar a variável CPF.


*** Variables ***
${URL}      https://www.4devs.com.br/ferramentas_online.php
&{body}     acao=gerar_pessoa   pontuacao=N     sexo=H



*** Test Cases ***
Validação na API   
    Dado que é feito o POST request
    Então o status code deverá ser "200"
    E o campo idade consta no ResponseBody
    E o campo sexo deve ser "masculino"

Armazenar cpf do responseBody em variável e limpá-la
    Armazenar cpf em variável
    Limpar variável

*** Keywords ***
Conectar API
    Create Session      API    ${URL}


Dado que é feito o POST request
    ${response}     POST    ${URL}      data=${body}
    Set suite variable     ${response}

Então o status code deverá ser "${status_code}"
    Should be equal as strings  ${response.status_code}     ${status_code}

E o campo idade consta no ResponseBody
    Dictionary should contain key      ${response.json()}      idade

E o campo sexo deve ser "masculino"
    Dictionary should contain item      ${response.json()}      sexo    Masculino

Armazenar cpf em variável
    # Log to console  ${response.json()}[cpf]
    ${cpf}=     Set variable     ${response.json()}[cpf]
    Set test variable   ${cpf}

Limpar variável
    Log to console      ${cpf}
    ${cpf}=     Set variable    ${EMPTY}
    Log to console      ${cpf}

