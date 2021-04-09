import 'package:get/get.dart';
import '../utils/api-response.dart';
import '../utils/api_endpoints.dart';
import '../utils/api_helper.dart';
import '../utils/http_exception.dart';
import '../models/facts.dart';


class FactsController extends GetxController with StateMixin<List<dynamic>>{

  final facts = RxList<Fact>([]);

  @override
  void onInit(){
    super.onInit();

  }



  Future<ApiResponse> fetchFacts() async {
    ApiResponse response;
    response =await ApiHelper().getRequest(
      endpoint: eFacts,
    );

    if(!response.error){
    List<Fact> facts = factFromJson(response.data);
    }
    // List<Fact> factFromJson(String str) => List<Fact>.from(json.decode(str).map((x) => Fact.fromJson(x)));





    _myProp.clear();
    if(!response.error){
      List<Property> list = response.data.map<Property>((e)=> Property.fromJson(e)).toList();
      _myProp.addAll(list);



    }


    return response;
  }

}