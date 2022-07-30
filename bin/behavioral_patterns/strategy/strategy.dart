void main(List<String> args) {
  CoachContext coach = CoachContext();
  
  List<int> numbers = [11,23,5,7,9,56,21,44,3,8,45];
  coach.setStrategy(PressingTactic());
  coach.doSomething(numbers);

  print("="*98);

  List<int> numbers1 = [1,34,99,2,9,76,91,64,3,10,75];
  coach.setStrategy(AtackingTactic());
  coach.doSomething(numbers1);

  print("="*98);

  List<int> numbers2 = [5,64,9,26,97,45,3,34,83,15,8];
  coach.setStrategy(DefendingTactic());
  coach.doSomething(numbers2);
}

class CoachContext{
  FootballStrtegy? strtegy;

  void setStrategy(FootballStrtegy str){
    strtegy = str;
  }
  void doSomething(List<int> numb){
    strtegy?.execute();
    strtegy?.sorrt(numb);
  }
}

abstract class FootballStrtegy{
  void execute();
  void sorrt(List<int> mas);
}

class PressingTactic implements FootballStrtegy{
  @override
  void execute() {
    print("Вмикаємо активний прессинг, " 
    "атакуємо суперників з м'ячем та перекриваємо лінії можливих передач...");
  }
  @override
  void sorrt(List<int> mas) {
    int k=1;
    bool flag;
    print("Відсортуємо номери гравців\n"
    "Сортування обімном(Метод бульбашки):");
    print("До сортування: $mas");
    do{
      flag=false;
      for(int i=0;i<mas.length-k;i++){
        if(mas[i]>mas[i+1]){
          int buf = mas[i];
          mas[i]=mas[i+1];
          mas[i+1]=buf;
          flag=true;
        }
      }
      k++;
    }
    while(flag==true);
    print("Після сортування: $mas");
  }
}

class AtackingTactic implements FootballStrtegy{
  @override
  void execute() {
    print("Переходимо на атакувальну тактиу. "
    "Підіймаємо лінію оборони ближче до воріт суперника...");
  }
  @override
  void sorrt(List<int> mas) {
    int min;
    print("Відсортуємо номери гравців\n"
    "Сортування методом вибору:");
    print("До сортування: $mas");
    for(int j=0;j<mas.length;j++){
      min = j;
      for(int i=0;i<mas.length;i++){
        if(mas[min]>mas[i]){
          min=i;
          int buf = mas[j];
          mas[j]=mas[min];
          mas[min]=buf;
        }
      }
    }
    print("Після сортування: ${mas.reversed.toList()}");
  }
}

class DefendingTactic implements FootballStrtegy{
  @override
  void execute() {
    print("Переходимо на захисну тактиу. "
    "Опускаємо лінію оборони ближче до власних воріт...");
  }
  @override
  void sorrt(List<int> mas) {
    print("Відсортуємо номери гравців\n"
    "Сортування вставками:");
    print("До сортування: $mas");
    for (int i = 0; i < mas.length; i++){
      for (int i = 1; i < mas.length; i++){
        for (int j = i; j > 0 && mas[j - 1] > mas[j]; j--){//! поки j>0 і елемент j-1 > j, массив int
            int tmp = mas[j - 1];
            mas[j - 1] = mas[j];
            mas[j] = tmp;	
        }
	    }
    }
    print("Після сортування: $mas");
  }
}