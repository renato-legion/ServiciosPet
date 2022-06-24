
Feature: ModificarMascota

  Background:
    * def requestsend = read('classpath:PetApp/Flujos/ModificarPet/RequestModificarPetTotal.json')

  @ModificarMascotaCompleta
  Scenario Outline: Modificar todos los atributos de la Mascota ya existente
    Given url host
    And path '/v2/pet'
    And request requestsend.ModifyTotal
    When method put
    Then print response
    Examples:
      | idPet | idCategoryPet | CategoryName                | NamePet    | PhotoUrlPet            | idTagPet | TagNamePet | status        |
      | 140   | 1             | Estrellas y erizos          | Camarada   | www.prueba.com         | 9        | BoniBoni   | Available     |
      | 141   | 12            | Caracoles, almejas y pulpos | Preciosa   | www.prueba1.net        | 99       | Sonrisas   | Not Available |
      | 142   | 123           | Rotíferos                   | PequePeque | www.prueba2.gob        | 999      | BelloBello | Not Available |
      | 143   | 1234          | Medusas y corales           | Luna       | www.prueba56345.com.pe | 9999     | Felicidad  | Not Available |
      | 144   | 12345         | Esponjas                    | Pecas      | www.prueba132.com.pe   | 99999    | Alegria    | Disponible    |
      | 145   | 123456        | Lombrices y gusanos marinos | Sonrisa    | www.123PRUEBA.com.pe   | 999999   | Zeus       | No Disponible |

  @ModificarMascotaIDyNombre
  Scenario Outline: Modificar Nombre e ID de Mascota ya existente
    * def tramaGet = call read('classpath:PetApp/Flujos/TraerPet/TraerPetCall.feature') { idPet: <idPet>}
    Given url host
    And path '/v2/pet'
    * set requestsend.ModifyNamePet.category.name = tramaGet.categorynameBack
    * set requestsend.ModifyNamePet.category.id = tramaGet.categoryidBack
    * set requestsend.ModifyNamePet.status = tramaGet.statusBack
    * set requestsend.ModifyNamePet.photoUrls = tramaGet.photoUrlsBack
    * set requestsend.ModifyNamePet.tags[0].id = tramaGet.tagsidBack
    * set requestsend.ModifyNamePet.tags[0].name = tramaGet.tagsnameBack
    And request requestsend.ModifyNamePet
    When method put
    Then print response
    Examples:
      | idPet | NamePet   |
      | 140   | Kira      |
      | 141   | SuperKira |
      | 142   | UltraKIRA |
      | 143   | LULU      |
      | 144   | ACEITUNA  |
      | 145   | RAIZa     |

  @ModificarMascotaCategoria
  Scenario Outline: Modificar Nombre e ID de Categoria de la Mascota ya existente
    * def tramaGet = call read('classpath:PetApp/Flujos/TraerPet/TraerPetCall.feature') { idPet: <idPet>}
    Given url host
    And path '/v2/pet'
    * set requestsend.ModifyCategory.name = tramaGet.nameBack
    * set requestsend.ModifyCategory.status = tramaGet.statusBack
    * set requestsend.ModifyCategory.photoUrls = tramaGet.photoUrlsBack
    * set requestsend.ModifyCategory.tags[0].id = tramaGet.tagsidBack
    * set requestsend.ModifyCategory.tags[0].name = tramaGet.tagsnameBack
    And print requestsend.ModifyCategory
    And request requestsend.ModifyCategory
    When method put
    Then print response
    Examples:
      | idPet | idCategoryPet | CategoryName          |
      | 140   | 9999          | Mamíferos             |
      | 141   | 9999          | Aves                  |
      | 142   | 9999          | Reptiles              |
      | 143   | 5124          | Ranas y sapos         |
      | 144   | 51249         | Insectos              |
      | 145   | 512497        | Cangrejos y camarones |

  @ModificarMascotaTag
  Scenario Outline: Modificar Tags de Mascota ya existente
    * def tramaGet = call read('classpath:PetApp/Flujos/TraerPet/TraerPetCall.feature') { idPet: <idPet>}
    Given url host
    And path '/v2/pet'
    * set requestsend.ModifyTagPet.name = tramaGet.nameBack
    * set requestsend.ModifyTagPet.category.name = tramaGet.categorynameBack
    * set requestsend.ModifyTagPet.category.id = tramaGet.categoryidBack
    * set requestsend.ModifyTagPet.status = tramaGet.statusBack
    * set requestsend.ModifyTagPet.photoUrls = tramaGet.photoUrlsBack

    And request requestsend.ModifyTagPet
    When method put
    Then print response
    Examples:
      | idPet | idTagPet | TagNamePet |
      | 140   | 5        | Perruno    |
      | 141   | 51       | Antartida  |
      | 142   | 512      | Zeus       |
      | 143   | 5124     | Coloso     |
      | 144   | 51249    | Ajax       |
      | 145   | 512497   | Arkantos   |

  @ModificarMascotaURL
  Scenario Outline: Modificar URL de Mascota ya existente
    * def tramaGet = call read('classpath:PetApp/Flujos/TraerPet/TraerPetCall.feature') { idPet: <idPet>}
    Given url host
    And path '/v2/pet'
    * set requestsend.ModifyURLPet.name = tramaGet.nameBack
    * set requestsend.ModifyURLPet.category.name = tramaGet.categorynameBack
    * set requestsend.ModifyURLPet.category.id = tramaGet.categoryidBack
    * set requestsend.ModifyURLPet.status = tramaGet.statusBack
    * set requestsend.ModifyURLPet.tags[0].id = tramaGet.tagsidBack
    * set requestsend.ModifyURLPet.tags[0].name = tramaGet.tagsnameBack

    And request requestsend.ModifyURLPet
    When method put
    Then print response
    Examples:
      | idPet | PhotoUrlPet                                                                                                         |
      | 140   | https://i0.wp.com/pysnnoticias.com/wp-content/uploads/2020/09/cachorros-golden-retriever.jpg?resize=740%2C555&ssl=1 |
      | 141   | https://cdn.redcanina.es/wp-content/uploads/2019/02/12102803/golden-retriever.jpg                                   |
      | 142   | https://blog.mascotaysalud.com/wp-content/uploads/2019/07/golden-retriever-mascota-y-salud.jpg                      |
      | 143   | https://i0.wp.com/pysnnoticias.com/wp-content/uploads/2020/09/cachorros-golden-retriever.jpg?resize=740%2C555&ssl=1 |
      | 144   | https://cdn.redcanina.es/wp-content/uploads/2019/02/12102803/golden-retriever.jpg                                   |
      | 145   | https://blog.mascotaysalud.com/wp-content/uploads/2019/07/golden-retriever-mascota-y-salud.jpg                      |

  @ModificarMascotaStatus
  Scenario Outline: Modificar Status de Mascota ya existente
    * def tramaGet = call read('classpath:PetApp/Flujos/TraerPet/TraerPetCall.feature') { idPet: <idPet>}
    Given url host
    And path '/v2/pet'
    * set requestsend.ModifyStatusPet.name = tramaGet.nameBack
    * set requestsend.ModifyStatusPet.category.name = tramaGet.categorynameBack
    * set requestsend.ModifyStatusPet.category.id = tramaGet.categoryidBack
    * set requestsend.ModifyStatusPet.photoUrls = tramaGet.photoUrlsBack
    * set requestsend.ModifyStatusPet.tags[0].id = tramaGet.tagsidBack
    * set requestsend.ModifyStatusPet.tags[0].name = tramaGet.tagsnameBack

    And request requestsend.ModifyStatusPet
    When method put
    Then print response
    Examples:
      | idPet | status          |
      | 140   | A Disposizione  |
      | 141   | Non Disponibile |
      | 142   | Verfügbar       |
      | 143   | Nicht verfügbar |
      | 144   | 利用可能            |
      | 145   | 利用不可            |


