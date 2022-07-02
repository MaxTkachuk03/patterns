void main(List<String> args) {
  OS os = Windows(Button());
  String j = os.getElement().toString().split("'")[1];
  print("Our element: $j");
  os.removeElement();
  os.changeElement(Label());
  os.addElement();
  print("-"*35);
  OS newos = Linux(Label());
  newos.removeElement();
  String h = newos.getElement().toString().split("'")[1];
  print("Our element: $h");
}

abstract class OS{
  late Elements elements;
  OS(Elements el){
    elements = el;
  }
  void addElement();
  void removeElement();
  Elements getElement(){
    return elements;
  }
  void changeElement(Elements ell){
    var f = getElement().toString().split("'")[1];
    String l = ell.toString().split("'")[1];
    print("Change element from $f to $l");
    elements = ell;
  }
}

class Windows extends OS{
  Windows(Elements elements): super(elements);
  
  @override
  void addElement() {
  String f= elements.createdElement();
  print("Add $f for Windows");
  }
  
  @override
  void removeElement() {
  String f= elements.uploadedElement();
  print("Delete $f for Windows");
  }

}

class Linux extends OS{
  Linux(super.elements);
  
  @override
  void addElement() {
  String f= elements.updatedElement();
  print("Add $f for Linux");
  }
  
  @override
  void removeElement() {
  String f= elements.createdElement();
  print("Delete $f for Linux");
  }

}


abstract class Elements{
    String createdElement();
    String updatedElement();
    String uploadedElement();
}

class Button implements Elements{
  @override
  String createdElement() {
    return "created button";
  }

  @override
  String updatedElement() {
    return "updated button";
  }

  @override
  String uploadedElement() {
    return "uploaded button";
  }
}

class Label implements Elements{
  @override
  String createdElement() {
    return "created label";
  }

  @override
  String updatedElement() {
    return "updated label";
  }

  @override
  String uploadedElement() {
    return "uploaded label";
  }
}