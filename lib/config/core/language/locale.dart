import 'package:get/get.dart';
import 'package:tbs_logistics_dangtai/config/core/language/en.dart';
import 'package:tbs_logistics_dangtai/config/core/language/vi.dart';

class Messages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': En().messages,
        'vi_VN': VI().messages,
      };
}
