class AppExeptions implements Exception {

  final _message;
  final _prefix;

  AppExeptions([this._message,this._prefix]);

@override
String toString(){
  return '$_message$_prefix';
}

}




class InternetExeption extends AppExeptions{

  InternetExeption([String? message]): super([message ,'No Internet']);

  
}