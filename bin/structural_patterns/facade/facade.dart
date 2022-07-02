void main(List<String> args) {
  ManagerFacade managerFacade = ManagerFacade();
  managerFacade.operation();
}

class ManagerFacade{
  Shop shop = Shop();
  Seller seller = Seller();
  Cashier cashier = Cashier();

  void operation(){
    shop.close();
    //shop.open();
    seller.getOrder(shop);
    cashier.haveOrder(seller);  
  }
  
}
class Shop{
  late bool state;

  bool getState(){
    return state;
  }
  
  void open(){
    print("Магазин відкритий.");
    state = true;
  }

  void close(){
    print("Магазин закритий!");
    state = false;
  }
}
class Cashier{

  void haveOrder(Seller product){
    if(product.retrun()){
    print("Продавець передав продукт касиру.");
    }
    else{
      print("Касиру не надали продукт. ");
    }
  }
}

class Seller{
  late bool order;

  bool retrun(){
    return order;
  }
  
  void getOrder(Shop state){
    if(state.getState()){
    print("Продавець отримав замовлення.");
    order = true;
    }
    else{
      print("Продавець не отримав замовлення.");
      order = false;
    }
  }
}