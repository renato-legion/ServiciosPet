
Feature: Get Pet
  Background:
#    * url 'https://petstore.swagger.io'
#    * headers Accept = 'application/json'
    * def data_getPet = read('classpath:PetApp/Data/getTraerPetData.csv')
    * def schemavalidator = read('classpath:PetApp/Flujos/TraerPet/TraerPetValidator.json')

  @GetPetBaufest1
  Scenario Outline: TraerMascota
    Given url host
    And path '/v2/pet/' + idPet
    And retry until responseStatus == 200
    When method get
    Then status 200
    And print response
    And match response == schemavalidator
    Examples:
      | idPet |
      | 140   |
      | 141   |
      | 142   |
      | 143   |
      | 144   |
      | 145   |

  @GetPetBaufest2
  Scenario Outline: TraerMascota
    Given url host
    And path '/v2/pet/' + <idPet>
    When method get
    Then status 200
    And print response
    And match response == schemavalidator
    Examples:
    |data_getPet|

