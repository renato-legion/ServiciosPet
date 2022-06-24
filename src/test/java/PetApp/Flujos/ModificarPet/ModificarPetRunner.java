package PetApp.Flujos.ModificarPet;

import com.intuit.karate.junit5.Karate;

public class ModificarPetRunner {
    @Karate.Test
    Karate testModificarPet(){
        return Karate.run("UnitModificarPet").tags("@ModificarMascotaIDyNombre").karateEnv("uat").relativeTo(getClass());
    }
}
