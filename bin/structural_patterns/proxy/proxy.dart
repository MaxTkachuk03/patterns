// ignore_for_file: prefer_conditional_assignment

void main(List<String> args) {
  Movie movie = RealMovie("Fast and Furious 7");
  movie.play();

  print("-"*40);

  // ignore: unused_local_variable
  Movie movie1 = RealMovie("Spider-Man: Far from Home");
  //movie1.play();

  print("-"*40);

  // ignore: unused_local_variable
  Movie movie2 = ProxyMovie("The Matrix Revolutions");
  //movie2.play();

  print("-"*40);

  Movie movie3 = ProxyMovie("Capitan America: Civil War");
  movie3.play();

  print("-"*40);
  
}

abstract class Movie{
  void play();
}

class RealMovie implements Movie{
  late String name;

  RealMovie(this.name){
    load();
  }

  void load(){
    print("Завантажуємо фільм: \"$name\"");
  } 
  
  @override
  void play() {
    print("Відтворюємо фільм: \"$name\"");
  }

}

class ProxyMovie implements Movie{
  late String name;
  RealMovie? moviel;

  ProxyMovie(this.name);
  
  @override
  void play() { 
    //moviel = RealMovie(name);
    // ignore: unnecessary_null_comparison
    if(moviel == null){
      moviel = RealMovie(name);
    }
    moviel!.play();
  }

}