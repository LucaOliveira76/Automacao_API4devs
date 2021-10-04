*** Settings ***
Suite Setup     Conectar API
Resource        ../Keywords/KeywordsTeste.robot
Resource        ../Keywords/BDDpt-br.robot

# *** Test Cases ***
# 1° - Validar o campo Status Code (Resultado esperado deve ser 200)
# 2° - Validar se o campo Idade consta do ResponseBody (Resultado esperado deve ser Sucesso)
# 3° - Validar se o valor do campo sexo do ResponseBody é igual a Masculino (Resultado esperado deve ser Sucesso)
# 4° - Armazenar o campo CPF do ResponseBody em uma variável nomeada CPF.
# 5° - Limar a variável CPF.


*** Test Cases ***
Validação na API   
    Dado que é feito o POST request
    Então o status code deverá ser "200"
    E o campo idade consta no ResponseBody
    E o campo sexo deve ser "masculino"

Armazenar cpf do responseBody em variável e limpá-la
    Armazenar cpf em variável
    Limpar variável


