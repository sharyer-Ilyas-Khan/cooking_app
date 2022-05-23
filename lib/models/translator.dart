import 'package:cooking_app/models/shared.dart';
import 'package:translator/translator.dart';
class LanguageTranslator{
  var language;
  LanguageTranslator({this.language});
  final translator = GoogleTranslator();
   // dynamic output='';
  String data='';
  UserSimplePreferences shared=new UserSimplePreferences();

  dynamic translateByFuture(input)async{
    language=shared.getDialogue()?? "en";
    print(language);
    translator
        .translate(input, to: language.toString())
        .then((result)
        {
          var output=result;
        });
return ;

  }
 String translateData(input){
    //data='';
    //data='';
    language=shared.getDialogue()?? "en";
    translator
        .translate(input, to: language.toString())
        .then((result) =>data=result.text.toString());
    print(data);
    return data;
  }
}
