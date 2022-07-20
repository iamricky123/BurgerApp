

class CustomLog{
  static void customPrintLog(String title, String msg){
    print('[$title][${DateTime.now()}]: $msg');
  }
}