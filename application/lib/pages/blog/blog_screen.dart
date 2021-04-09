import 'package:doortodata/constants.dart';
import 'package:doortodata/controllers/facts_controller.dart';
import 'package:doortodata/main.dart';
import 'package:get/get.dart';

import '../../widgets/ui_view/area_list_view.dart';
import '../../widgets/ui_view/running_view.dart';
import '../../widgets/ui_view/title_view.dart';
import '../../widgets/ui_view/workout_view.dart';
import 'package:flutter/material.dart';


class BlogsScreen extends StatelessWidget {
  final FactsController factController = Get.put(FactsController());

  @override
  Widget build(BuildContext context) {
    return Container(
        color: DoorToDataAppTheme.background,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Know More !"),
            centerTitle: true,
            backgroundColor: DoorToDataAppTheme.nearlyDarkBlue,
          ),
          backgroundColor: Colors.transparent,
          body: Obx((){
            if (factController.isLoading.value)
              return Center(child: CircularProgressIndicator());
            else
              return Stack(
                children: <Widget>[
                  ListView.builder(
                    itemCount: factController.factsList.length,
                    itemBuilder: (context, index){
                      return Padding(
                        padding: const EdgeInsets.only(
                            left: 24, right: 24, top: 16, bottom: 8),
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(colors: [
                              DoorToDataAppTheme.nearlyDarkBlue,
                              HexColor("#6F56E8")
                            ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(8.0),
                                bottomLeft: Radius.circular(8.0),
                                bottomRight: Radius.circular(8.0),
                                topRight: Radius.circular(68.0)),
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                  color: DoorToDataAppTheme.grey.withOpacity(0.6),
                                  offset: Offset(1.1, 1.1),
                                  blurRadius: 10.0),
                            ],
                          ),
                          child: BlogListRow(),

                          // Padding(
                          //   padding: const EdgeInsets.all(16.0),
                          //   child: Column(
                          //     mainAxisAlignment: MainAxisAlignment.center,
                          //     crossAxisAlignment: CrossAxisAlignment.start,
                          //     children: <Widget>[
                          //       Text(
                          //         factController.factsList[index].category,
                          //         textAlign: TextAlign.left,
                          //         style: TextStyle(
                          //           fontFamily: DoorToDataAppTheme.fontName,
                          //           fontWeight: FontWeight.normal,
                          //           fontSize: 14,
                          //           letterSpacing: 0.0,
                          //           color: DoorToDataAppTheme.white,
                          //         ),
                          //       ),
                          //       Padding(
                          //         padding: const EdgeInsets.only(top: 8.0),
                          //         child: Text(
                          //           factController.factsList[index].fact,
                          //           textAlign: TextAlign.left,
                          //           style: TextStyle(
                          //             fontFamily: DoorToDataAppTheme.fontName,
                          //             fontWeight: FontWeight.normal,
                          //             fontSize: 20,
                          //             letterSpacing: 0.0,
                          //             color: DoorToDataAppTheme.white,
                          //           ),
                          //         ),
                          //       ),
                          //       SizedBox(
                          //         height: 16,
                          //       ),
                          //
                          //     ],
                          //   ),
                          // ),
                        ),
                      );
                    },
                  )
                ]);
            }),
      ),
    );
  }

}

class BlogListRow extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: 24, right: 24, top: 16, bottom: 8),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            DoorToDataAppTheme.nearlyDarkBlue,
            HexColor("#6F56E8")
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8.0),
              bottomLeft: Radius.circular(8.0),
              bottomRight: Radius.circular(8.0),
              topRight: Radius.circular(68.0)),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: DoorToDataAppTheme.grey.withOpacity(0.6),
                offset: Offset(1.1, 1.1),
                blurRadius: 10.0),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Facebook',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontFamily: DoorToDataAppTheme.fontName,
                  fontWeight: FontWeight.normal,
                  fontSize: 14,
                  letterSpacing: 0.0,
                  color: DoorToDataAppTheme.white,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  'FaceBook collects locations everytime you use it.',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontFamily: DoorToDataAppTheme.fontName,
                    fontWeight: FontWeight.normal,
                    fontSize: 20,
                    letterSpacing: 0.0,
                    color: DoorToDataAppTheme.white,
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),

            ],
          ),
        ),
      ),
    );
  }
}


