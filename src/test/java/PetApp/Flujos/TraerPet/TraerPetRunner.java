package PetApp.Flujos.TraerPet;

import com.intuit.karate.junit5.Karate;

public class TraerPetRunner {
    @Karate.Test
    Karate testGetPet(){
        return Karate.run("UnitTraerPet").tags("@GetPetBaufest2").karateEnv("uat").relativeTo(getClass());
    }
}
