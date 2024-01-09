import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:stack_based_bottom_sheet/utils/Constants/bottom_sheet_constants.dart';
import '../components/head_collapse_sheet_view.dart';
import '../../utils/screen_size_helpers.dart';
import '../components/head_expand_sheet_view.dart';
import '../components/main_button_buttom.dart';
import 'stack_sheets_framework.dart';


Future<dynamic> platformSelectionBottomSheet({
  required context,
  required double height,
  required int level,
}) {

  bool isActive = true;
  String platformSelected = "";

  return showModalBottomSheet<void>(
    elevation: 2.0,
    barrierColor: Colors.grey.withOpacity(0.3),
    backgroundColor:Colors.white,
    context: context,
    isScrollControlled: true,
    enableDrag: false,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(30),
        topRight: Radius.circular(30),
      ),
    ),
    builder: (context) {
      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return SizedBox(
            height: displayHeight(context) * height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 500),
                  child: isActive
                      ? const HeadExpandView(
                    title: BottomSheetsConstants.platformsSelSheetTitle,
                    description: BottomSheetsConstants.platformSelSheetDescription,
                  )
                      : HeadCollapseView(
                    title: BottomSheetsConstants.platformsSelAftSheetTitle,
                    description: platformSelected,
                  ),
                ),
                AnimatedSwitcher(
                    duration: const Duration(milliseconds: 500),
                    child: Wrap(
                      spacing: 8.0,
                      runSpacing: 8.0,
                      children: BottomSheetsConstants.ottPlatforms.map((platform) {
                        return GestureDetector(
                          onTap: (){
                            setState(() {
                              platformSelected = platform.platformName;
                            });
                          },
                          child: Container(
                              height: 100,
                              width: 150,
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(Radius.circular(10)),
                                image: DecorationImage(
                                  image: NetworkImage(platform.imageUrl), // Replace with your image URL
                                  fit: BoxFit.cover,
                                ),
                                color: platformSelected == platform.platformName ? Colors.blue: Colors.white,
                                boxShadow: platformSelected == platform.platformName ? const [
                                  BoxShadow(
                                    color: Colors.black54,
                                    blurRadius: 10.0,
                                  ),
                                ]:[],
                              ),
                              child: platformSelected == platform.platformName ? const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: Icon(
                                    Icons.check,
                                    color: Colors.white,
                                  ),
                                ),
                              ) : Container()
                          ),
                        );
                      }).toList(),
                    )
                ),
                SizedBox(
                  height: displayHeight(context) * 0.02,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    width: displayWidth(context),
                    child: MainBottomButton(
                      title: BottomSheetsConstants.platformsSelSheetButtonTitle,
                      onPressed: () async {
                        if(platformSelected.isNotEmpty){
                          setState(() {
                            isActive = false;
                          });
                          await platformPlanSelectionBottomSheet(
                              context: context,
                              height: height - 0.1,
                              level: level - 1,
                              platform: platformSelected
                          );
                          setState(() {
                            isActive = true;
                          });
                        } else {
                          Fluttertoast.showToast(
                              msg: "Please Select a OTT Platform",
                              toastLength: Toast.LENGTH_LONG,
                              gravity: ToastGravity.TOP,
                              backgroundColor: Colors.black54,
                              textColor: Colors.white,
                              fontSize: 16.0
                          );
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      );
    },
  );
}

