## BAUFEST - PETAPP SERVICES - KARATE

### Archetype
````text 
gir-automation-web/
├── src/
├── test/
├── PetApp/
│   ├── Data
│   │ 
│   ├── Flujos/
│        ├──AgregarPet
│        ├──ModificarPet
│        ├──TraerPet 
├── README.md
````

### Compile code Maven
Each API has its own @runner, additionally, a module.feature and a "Unit+modulo.feature" have been created with the following structure:
````
Agregar.Feature
Agregar.runner
UnitAgregar.Feature
````
The "Unit+.feature" are used to carry out the validations, while the .features are without validations, due to the importance of the execution time of each test.

###Author: Renato Francisco Paco Huerta
###Linkedin: https://www.linkedin.com/in/renatopaco98/