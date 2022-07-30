// ignore_for_file: non_constant_identifier_names
void main(){
///Перший спосіб

  Coach coach = SecondTeam();
  Competitions competitions = coach.TeamCreate();
  competitions.TeamComposition();

  print("-"*20);

///Другий спосіб

  Coach vvod(String change) {
    if(change.contains("EuroCup")){
      return FirstTeam();
    }
    if(change.compareTo("PremierLeague")==0){
      return SecondTeam();
    }
    else{
      throw ArgumentError("Комнада не бере участь в цих змаганнях");
    }
  }
  
  Coach coach1 = vvod("EuroCup");
  Competitions competitions1 = coach1.TeamCreate();
  competitions1.TeamComposition();
}
 
abstract class Competitions{
  void TeamComposition();
}

class EuroCup implements Competitions{
  @override
  void TeamComposition() {
    print('Обираємно найсильнішиих гравців!');
  }
 
}

class PremierLeague implements Competitions{
  @override
  void TeamComposition() {
    print('Обираємно якісних гравців!');
  }
}



abstract class Coach{  //Factory
  Competitions TeamCreate();
}

class FirstTeam extends Coach {
  @override
  Competitions TeamCreate() {
    return EuroCup();
  }
}

class SecondTeam extends Coach {
  @override
  Competitions TeamCreate() {
    return PremierLeague();
  }
 
}