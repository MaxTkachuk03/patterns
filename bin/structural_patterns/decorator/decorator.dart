import 'dart:io';

void main(List<String> args) {
  Wallet wallet = USDExchange(Money(1000));
  Wallet wallet1 = EUROExchange(wallet);
  wallet1.fromMoney();
  wallet.getMoney();

  print("-"*77);

  Wallet newWallet = EUROExchange(Money(1000000));
  Wallet newWallet1 = USDExchange(newWallet);
  newWallet1.fromMoney();
  newWallet.getMoney();
}

abstract class Wallet{
  void getMoney();
  void fromMoney();
}

class Money implements Wallet{
  int number;

  Money(this.number);
  
  @override
  void getMoney() {
    stdout.write("Отримуємо $number ");
  }
  
  @override
  void fromMoney(){}
}

abstract class CurrencyExchangerDecorator implements Wallet{
  late Wallet mon;

  CurrencyExchangerDecorator(this.mon);

  @override
  void getMoney() {
    stdout.write("Конвертуємо гроші в ");
  }

  @override
  void fromMoney(){
    stdout.write("Конвертуємо гроші з ");
  }
}

class USDExchange extends CurrencyExchangerDecorator{
  USDExchange(super.mon);

  @override
  void getMoney() {
    super.getMoney();
    stdout.write("долари. ");
    mon.getMoney();
    stdout.write("USD");
    print("");
  }
  
  @override
  void fromMoney() {
    super.fromMoney();
    stdout.write("доларів. ");
  }
}

class EUROExchange extends CurrencyExchangerDecorator{
  EUROExchange(Wallet mon): super(mon);

  @override
  void getMoney() {
    super.getMoney();
    stdout.write("євро. ");
    mon.getMoney();
    stdout.write("EURO");
    print("");
  }
  
  @override
  void fromMoney() {
    super.fromMoney();
    stdout.write("євро. ");
  }
}