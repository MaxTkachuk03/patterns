void main(List<String> args) {
  SocialInfrastructureComponent hospital = HospotalComponent();
  SocialInfrastructureComponent hospital1 = HospotalComponent();
  SocialInfrastructureComponent hospital2 = HospotalComponent();

  SocialInfrastructureComponent police = PoliceStationComponent();
  SocialInfrastructureComponent police1 = PoliceStationComponent();
  SocialInfrastructureComponent police2 = PoliceStationComponent();
 
  InfrastructureComposit composit = InfrastructureComposit();
  InfrastructureComposit composit1 = InfrastructureComposit();
  InfrastructureComposit composit2 = InfrastructureComposit();

  composit1.addComponent(hospital);
  composit1.addComponent(hospital1);
  composit1.addComponent(hospital2);

  composit2.addComponent(police);
  composit2.addComponent(hospital1);
  composit2.addComponent(police1);
  composit2.addComponent(police2);

  composit.addComponent(composit1);
  composit.addComponent(composit2);

  composit.createBuilding();

  print("-"*30);
  composit1.removeComponent(hospital2);
  composit2.removeComponent(hospital1);
  composit2.removeComponent(police2);

  composit.createBuilding();

  print("-"*30);
  composit.removeComponent(composit1);
  
  composit.createBuilding();

}

abstract class SocialInfrastructureComponent{
  void createBuilding();
}

class HospotalComponent implements SocialInfrastructureComponent{
  @override
  void createBuilding() {
    print("Будуємо лікарню...");
  }
}

class PoliceStationComponent implements SocialInfrastructureComponent{
  @override
  void createBuilding() {
    print("Будуємо поліцейський відділок...");
  }
}

class InfrastructureComposit implements SocialInfrastructureComponent{
  List<SocialInfrastructureComponent> components = [];

  void addComponent(SocialInfrastructureComponent component){
    components.add(component);
  }

  void removeComponent(SocialInfrastructureComponent component){
    components.remove(component);
  }
  @override
  void createBuilding() {
    // ignore: avoid_function_literals_in_foreach_calls
    components.forEach((element) { 
      element.createBuilding();
    });
  }
}