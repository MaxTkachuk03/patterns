void main(List<String> args) {
  OurGame game = OurGame();
  SaveField saveField = SaveField();

  game.setInGame("рівень 10", 30);
  print(game);

  print("\nЧас зберегтись!");

  saveField.setSave(game.save());
  
  print("\nГраємо далі...\n");

  game.setInGame("рівень 17", 56);
  print(game);

  print("\nЧас зберегтись!");

  saveField.setSave(game.save());

  print("\nГраємо далі...\n");

  game.setInGame("рівень 25", 126);
  print(game);

  print("\nГра не скалалась. Завантажуємо збережені дані...\n");
  game.load(saveField.getSave());
  print("$game\n");

  print("Всі зеберження:\n");
  print("-"*45);
  saveField.allSaved();
  print("-"*45);
}

class OurGame{
  late String _level;
  late int _time; 

  void setInGame(String lvl, int tm){
    _level = lvl;
    _time = tm;
  }

  Snapshot save(){
    return Snapshot.setMemento(_level, _time);
    //return Snapshot(_level, _time);
  }

  void load(Snapshot snapshot){
    _level = snapshot.getLevel();
    _time = snapshot.getTime();
  }

  @override
  String toString() {
    return "На $_level витрачено $_time хв.";
  }
}

//! Memento, Save
class Snapshot{
  late final String _level;
  late final int _time;

  Snapshot.setMemento(String level, int time){
    _level = level;
    _time = time;
  }
  //Snapshot(this._level, this._time);

  String getLevel(){ 
    return _level;
  }

  int getTime(){
    return _time;
  }
}

//? Caretaker
class SaveField{
  List<Snapshot> save = [];

  Snapshot getSave(){
    return save.last;
  }

  void setSave(Snapshot snapshot){
    save.add(snapshot);
  }

  void allSaved(){
    if(save.isNotEmpty){
      for(Snapshot s in save){
        print("Збережено ${s._level}, на який витрачено ${s._time} хв.");
      }
    }
  }
}