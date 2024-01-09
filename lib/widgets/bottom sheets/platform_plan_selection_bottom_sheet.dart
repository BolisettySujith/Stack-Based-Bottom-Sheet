import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stack_based_bottom_sheet/utils/Constants/bottom_sheet_constants.dart';
import '../components/head_collapse_sheet_view.dart';
import '../../utils/screen_size_helpers.dart';
import '../components/head_expand_sheet_view.dart';
import '../components/main_button_buttom.dart';
import 'stack_sheets_framework.dart';

Future<dynamic> platformPlanSelectionBottomSheet({
  required context,
  required double height,
  required int level,
  required String platform,
}) {
  bool isActive = true;
  String planSelected = "";
  String planSelectedCost = "";

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
                    title: BottomSheetsConstants.platformsPlanSelSheetTitle,
                    description: BottomSheetsConstants.platformPlanSelSheetDescription,
                  )
                      : HeadCollapseView(
                    title: BottomSheetsConstants.platformsPlanSelAftSheetTitle,
                    description: "$planSelected Plan: \$$planSelectedCost/mo",
                  ),
                ),
                AnimatedSwitcher(
                    duration: const Duration(milliseconds: 500),
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: BottomSheetsConstants.platformPlans.map((plan) {
                          return GestureDetector(
                            onTap: (){
                              setState(() {
                                planSelected = plan.planName;
                                planSelectedCost = plan.pricePerMonth.toString();
                              });
                            },
                            child: Container(
                              margin: const EdgeInsets.all(15.0),
                              padding: const EdgeInsets.all(20.0),
                              height: 200,
                              width: 200,
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(Radius.circular(10)),
                                color: plan.color,
                                boxShadow: planSelected == plan.planName ? const [
                                  BoxShadow(
                                    color: Colors.black87,
                                    blurRadius: 10.0,
                                  ),
                                ]:[],
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(
                                    planSelected == plan.planName ? Icons.check_circle_outline_outlined : Icons.circle_outlined,
                                    size: 35,
                                    weight: 2,
                                    color: Colors.white,
                                  ),
                                  const SizedBox(height: 20,),
                                  Text(
                                    "\$${plan.pricePerMonth}/mo",
                                    style: GoogleFonts.montserrat(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25
                                    ),
                                  ),
                                  Text(
                                    "${plan.planName} Plan",
                                    style: GoogleFonts.montserrat(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 20
                                    ),
                                  ),
                                  const SizedBox(height: 10,),
                                  Container(
                                    height: 30,
                                    decoration: const BoxDecoration(
                                        color: Colors.black12,
                                        borderRadius: BorderRadius.horizontal(left: Radius.circular(50), right: Radius.circular(50))
                                    ),
                                    child: Center(
                                      child: Text(
                                        "See Guidelines",
                                        style: GoogleFonts.montserrat(
                                            color: Colors.white,
                                            fontSize: 12
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }).toList(),
                      ),
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
                      title: BottomSheetsConstants.platformsPlanSelSheetButtonTitle,
                      onPressed: () async {
                        if(planSelected.isNotEmpty){
                          setState(() {
                            isActive = false;
                          });
                          await bankAccountSelectionBottomSheet(
                            context: context,
                            height: height - 0.1,
                            level: level - 1,
                            plan: planSelected,
                            planCost: planSelectedCost,
                            platform: platform,
                          );
                          setState(() {
                            isActive = true;
                          });
                        } else {
                          Fluttertoast.showToast(
                              msg: "Please Select a Subscription Plan",
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

