import 'package:get/get.dart';

class FactsBinding extends Bindings {
  @override
  void dependencies()<FactsController>{
    Get.lazyPut(() => FactsController(),
  );
  }
}