import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stack_based_bottom_sheet/models/ott_platforms_model.dart';
import '../../utils/screen_size_helpers.dart';
import '../components/head_collapse_sheet_view.dart';
import '../../main.dart';
import '../components/head_expand_sheet_view.dart';
import '../components/main_button_buttom.dart';
import 'stack_sheets_framework.dart';


Future<dynamic> successfulSubscriptionBottomSheet({
  required context,
  required double height,
  required String platform,
  required String plan,
  required String planCost,
}) {

  return showModalBottomSheet<void>(
    elevation: 2.0,
    barrierColor: Colors.grey.withOpacity(0.3),
    backgroundColor:Theme.of(context).primaryColorDark,
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
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      height: displayHeight(context) * height,
                      width: displayWidth(context),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.check_circle,
                            color: Colors.white,
                            size: 100,
                          ),
                          const SizedBox(height: 10,),
                          Text(
                            "Congratulations",
                            style: GoogleFonts.montserrat(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.white
                            ),
                          ),
                          Text(
                            "Your Subscription Was Successful",
                            style: GoogleFonts.montserrat(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.white
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 20,),
                          Text(
                            "Platform\t\t\t:\t\t$platform\n"
                                "Plan Type\t:\t\t$plan\n"
                                "Plan Cost\t:\t\t\$$planCost\\mo",
                            style: GoogleFonts.montserrat(
                                fontSize: 16,
                                color: Colors.white
                            ),
                            textAlign: TextAlign.start,
                          ),
                          const SizedBox(height: 20,),
                          FittedBox(
                            child: GestureDetector(
                              onTap: (){
                                Navigator.of(context).pop();
                              },
                              child: Container(
                                margin: const EdgeInsets.symmetric(horizontal: 20),
                                height: 35,
                                padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                                decoration: const BoxDecoration(
                                  color: Colors.lightGreen,
                                  borderRadius: BorderRadius.horizontal(left: Radius.circular(50), right: Radius.circular(50)),
                                  // border: Border.all(color: Colors.black)
                                ),
                                child: Center(
                                  child: Text(
                                    "Go back to Home",
                                    style: GoogleFonts.montserrat(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                ),
              ],
            ),
          );
        },
      );
    },
  );
}
