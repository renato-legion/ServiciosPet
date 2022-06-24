
Feature: GetPetdddd

Background:
  * def json123 = __arg
  * def idPet = json123.idPet


  Scenario: TraerMascota con Call
    Given url host
    And path '/v2/pet/' + idPet
    When method get
    Then print response
    And def photoUrlsBack = response.photoUrls
    And def nameBack = response.name
    And def idBack = response.id
    And def categorynameBack = response.category.name
    And def categoryidBack = response.category.id
    And def tagsnameBack = response.tags[0].name
    And def tagsidBack = response.tags[0].id
    And def statusBack = response.status
    And print idBack
    And print nameBack
    And print statusBack
    And print categoryidBack
    And print categorynameBack
    And print tagsnameBack
    And print tagsidBack
    And print photoUrlsBack






