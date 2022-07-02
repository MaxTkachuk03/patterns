void main(List<String> args) {
  Costumer costumer = Costumer(); 
  WaiterCommand meetCommand = MeetCommand(costumer);
  WaiterCommand vegeteblesCommand = VegeteblesCommand(costumer);
  WaiterCommand pizzaCommand = PizzaCommand(costumer);
  Cooker cooker = Cooker(meetCommand, pizzaCommand, vegeteblesCommand);
  
  cooker.getMeet();
  cooker.getPizza();
  cooker.getVegetables();
}

//$ Command
abstract class WaiterCommand{
  Costumer costumer;

  WaiterCommand(this.costumer);

  void execute();
}

//$ Invoker
class Costumer{
  void meet(){
    print("Замовляють шашлик!");
  }
  void pizza(){
    print("Замовляють піцу!");
  }
  void vegetebles(){
    print("Замовляють вегетеріанське блюдо!");
  }
}

class MeetCommand extends WaiterCommand{
  MeetCommand(super.costumer);

  @override
  void execute() {
    costumer.meet();
  }
}

class PizzaCommand extends WaiterCommand{
  PizzaCommand(super.costumer);

  @override
  void execute() {
    costumer.pizza();
  }
}

class VegeteblesCommand extends WaiterCommand{
  VegeteblesCommand(super.costumer);

  @override
  void execute() {
    costumer.vegetebles();
  }
}

//@ Receiver
class Cooker{
    WaiterCommand meetCommand;
    WaiterCommand vegeteblesCommand;
    WaiterCommand pizzaCommand;

    Cooker(this.meetCommand,this.pizzaCommand, this.vegeteblesCommand);

    void getVegetables(){
      vegeteblesCommand.execute();
    }

    void getMeet(){
      meetCommand.execute();
    }

    void getPizza(){
      pizzaCommand.execute();
    }
}
