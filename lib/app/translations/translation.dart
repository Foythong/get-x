import 'package:get/get.dart';

class Languages extends Translations {
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'greeting': 'Hello',
          'greeting2': 'Hi!!!',
        },
        'th_TH': {
          'greeting': 'สวัสดี',
          'greeting2': 'เฮลโหลลล!!!',
        },
      };
}
