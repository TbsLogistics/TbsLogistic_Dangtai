import 'package:get/get.dart';
import 'package:tbs_logistics_dangtai/app/tallyman/controller/list_team_details_of_tallyman_controller.dart';

class ListTeamDetailsOfTallymanBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListTeamDetailsOfTallymanController>(
        () => ListTeamDetailsOfTallymanController());
  }
}
