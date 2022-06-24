
Feature: GetPet
  Background:
    * def data_getPet = read('classpath:PetApp/Data/getTraerPetData.csv')

  @GetPetBaufest1
  Scenario Outline: TraerMascota con Examples explícito
    Given url host
    And path '/v2/pet/' + idPet
    When method get
    Then print response
  Examples:
    | idPet |
    | 140   |
    | 141   |
    | 142   |
    | 143   |
    | 144   |
    | 145   |

  @GetPetBaufest2
  Scenario Outline: TraerMascota con data CSV
    Given url host
    And path '/v2/pet/' + <idPet>
    When method get
    Then print response
    Examples:
    |data_getPet|
