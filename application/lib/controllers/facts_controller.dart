import 'package:get/get.dart';
import '../utils/api-response.dart';
import '../utils/api_endpoints.dart';
import '../utils/api_helper.dart';
import '../utils/http_exception.dart';
import '../models/facts.dart';


class FactsController extends GetxController {
  var isLoading = true.obs;
  var factsList = List<Fact>().obs;
  final facts = RxList<Fact>([]);

  @override
  void onInit(){
    fetchFacts();
    super.onInit();
  }



  Future<ApiResponse> fetchFacts() async {
    try {
      isLoading(true);
      ApiResponse response;
      response =await ApiHelper().getRequest(
        endpoint: eFacts,
      );
      if(!response.error){
        List<Fact> facts = factFromJson(response.data);
        factsList.assignAll(facts);
      }
      
    } finally {
      isLoading(false);
    }
  }

}