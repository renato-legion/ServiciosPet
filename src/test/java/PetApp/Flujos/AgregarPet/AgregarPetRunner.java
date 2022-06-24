package PetApp.Flujos.AgregarPet;

import com.intuit.karate.junit5.Karate;

public class AgregarPetRunner {
    @Karate.Test
    Karate testAgregarPet(){
        return Karate.run("AgregarPet").tags("@AgregarMascotaTotal").karateEnv("uat").relativeTo(getClass());
    }
}
