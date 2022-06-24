
Feature: Agregar Pet
  Background:
    * def requestsend = read('classpath:PetApp/Flujos/AgregarPet/RequestAgregarPet.json')
    * def schemavalidator = read('classpath:PetApp/Flujos/AgregarPet/AgregarPetValidator.json')

  @AgregarMascotaTotal
  Scenario Outline: Agregar Mascota con Nombre y Categoria
    Given url host
    And path '/v2/pet'
    And request requestsend.AgregarTotal
    When method post
    Then status 200
    And print response
    And match response == schemavalidator
    Examples:
      | idPet | idCategoryPet | CategoryName      | NamePet    | PhotoUrlPet           | idTagPet | TagNamePet | status        |
      | 140   | 123456        | GoldenRetriever   | Camarada   | www.pru34123.com      | 9        | TINKA      | On fire       |
      | 141   | 12345         | LabradorRetriever | Preciosa   | www.pr3123ba1.net     | 99       | CPP        | OK            |
      | 142   | 1234          | Bulldog Frances   | PequePeque | www.prFSDAFeba2.gob   | 999      | F123       | En Proceso    |
      | 143   | 123           | Bulldog Ingles    | Luna       | www.face321123.com.pe | 9999     | VENCEDOR   | Available     |
      | 144   | 12            | Pitbull           | Pecas      | www.313esfsd.com.pe   | 99999    | Almudena   | En Validacion |
      | 145   | 1             | Dalmata           | Sonrisa    | www.medidapp.com.pe   | 999999   | PorCuale   | Procede       |


  @AgregarMascotaNombreyCategoria
  Scenario Outline: Agregar Mascota con Nombre y Categoria
    Given url host
    And path '/v2/pet'
    And request requestsend.AgregarNombreyCategoria
    When method post
    Then status 200
    And print response
    And match response == schemavalidator
    Examples:
      | idPet | idCategoryPet | CategoryName                | NamePet  |
      | 140   | 8             | Ranas y sapos               | Afrodita |
      | 141   | 88            | Peces                       | Hades    |
      | 142   | 777           | Mamíferos                   | Zeus     |
      | 143   | 6666          | Lombrices y gusanos marinos | Thor     |
      | 144   | 55555         | Esponjas                    | Odin     |
      | 145   | 454545        | Medusas y corales           | Dionisio |

  @AgregarMascotaNombre
  Scenario Outline: Agregar Mascota con SOLO Nombre
    Given url host
    And path '/v2/pet'
    And request requestsend.AgregarNombre
    When method post
    Then status 200
    And print response
    And match response == schemavalidator
    Examples:
      | idPet | NamePet   |
      | 140   | Sonrisita |
      | 141   | Preciosa  |
      | 142   | Felicidad |
      | 143   | Tigresa   |
      | 144   | BonoBono  |
      | 145   | Korn      |
