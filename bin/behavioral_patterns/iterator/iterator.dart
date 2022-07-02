void main(List<String> args) {
  Vinnitsia marks = LandmarksVinnitsia();
  Way iterator =  marks.getIterator();
  Vinnitsia rest = RestoransVinnitsia();
  Way iterator1 =  rest.getIterator();

  while(iterator.hasMore()){
    print(iterator.getNext().toString());
  }

  print("-"*20);

  while(iterator1.hasMore()){
    print(iterator1.getNext().toString());
  }
}

//* interface Iterator
abstract class Way{
  bool hasMore();
  Object getNext();
}

//* concrete Iterator
class Guide implements Way{
  int i=0; 
  LandmarksVinnitsia landmarksVinnitsia;

  Guide(this.landmarksVinnitsia);
  
  @override
  Object getNext() {
    return landmarksVinnitsia.landmarks[i++];
  }

  @override
  bool hasMore() {
    if(i<landmarksVinnitsia.landmarks.length){
      return true;
    }
    return false;
  }
}

//* concrete Iterator
class OurMind implements Way{
  int i=0;
  RestoransVinnitsia restoransVinnitsia;

  OurMind(this.restoransVinnitsia);
  
  @override
  Object getNext() {
    return restoransVinnitsia.landmarks.reversed.elementAt(i++);
  }

 @override
  bool hasMore() {
    if(i<restoransVinnitsia.landmarks.length){
      return true;
    }
    return false;
  }
}

//! interface Collection
abstract class Vinnitsia{
  Way getIterator();
}

//! concrete Collection
class LandmarksVinnitsia implements Vinnitsia{
  List<String> landmarks = ["Краєзнавчий музей","Водонапірна вежа","Замкова гора"];
  
  @override
  Way getIterator() {
    return Guide(this);
  }
}

//! concrete Collection
class RestoransVinnitsia implements Vinnitsia{
  List<String> landmarks = ["Mont Blanc","Марсель","Велюр"];
  
  @override
  Way getIterator() {
    return OurMind(RestoransVinnitsia());
  }
}
