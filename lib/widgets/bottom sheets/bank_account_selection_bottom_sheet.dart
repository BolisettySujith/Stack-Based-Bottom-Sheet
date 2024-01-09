import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stack_based_bottom_sheet/utils/Constants/bottom_sheet_constants.dart';
import '../../main.dart';
import '../../utils/screen_size_helpers.dart';
import '../components/head_expand_sheet_view.dart';
import '../components/main_button_buttom.dart';
import 'stack_sheets_framework.dart';


Future<dynamic> bankAccountSelectionBottomSheet({
  required context,
  required double height,
  required int level,
  required String platform,
  required String plan,
  required String planCost,
}) {
  String bankSelected = "";

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
                const AnimatedSwitcher(
                    duration: Duration(milliseconds: 500),
                    child: HeadExpandView(
                      title: BottomSheetsConstants.bankAccSelSheetTitle,
                      description: BottomSheetsConstants.bankAccSelSheetDescription,
                    )
                ),
                SizedBox(
                  height: 200,
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 500),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: BottomSheetsConstants.bankAccounts.length,
                              itemBuilder: (context, index){
                                final bankAccount = BottomSheetsConstants.bankAccounts[index];
                                return GestureDetector(
                                  onTap: (){
                                    setState((){
                                      bankSelected = bankAccount.bankName;
                                    });
                                  },
                                  child: ListTile(
                                    leading: Image.network(
                                      bankAccount.bankLogoImageUrl,
                                      width: 40,
                                      height: 40,
                                    ),
                                    title: Text(
                                      bankAccount.bankName,
                                      style: GoogleFonts.montserrat(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    subtitle: Text(
                                      bankAccount.accountNumber,
                                      style: GoogleFonts.montserrat(
                                          color: Colors.black,
                                          fontSize: 12
                                      ),
                                    ),
                                    trailing: bankSelected == bankAccount.bankName
                                        ? const Icon(Icons.check_circle_outline)
                                        : const Icon(Icons.circle_outlined),
                                  ),
                                );
                              }
                          ),
                        ),
                        FittedBox(
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            height: 35,
                            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                            decoration: const BoxDecoration(
                              color: Colors.black12,
                              borderRadius: BorderRadius.horizontal(left: Radius.circular(50), right: Radius.circular(50)),
                              // border: Border.all(color: Colors.black)
                            ),
                            child: Center(
                              child: Text(
                                "Add bank account",
                                style: GoogleFonts.montserrat(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: displayHeight(context) * 0.02,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    width: displayWidth(context),
                    child: MainBottomButton(
                      title: BottomSheetsConstants.bankAccSelSheetButtonTitle,
                      onPressed: () {
                        if(bankSelected.isNotEmpty) {
                          // Close BottomSheet3
                          Navigator.of(context).pop();

                          // Close BottomSheet2
                          Future.delayed(const Duration(milliseconds: 200), () {
                            if (parentContext != null && Navigator.of(parentContext!).canPop()) {
                              Navigator.of(parentContext!).pop();
                            }
                          });

                          // Close BottomSheet1
                          Future.delayed(const Duration(milliseconds: 400), () {
                            if (parentContext != null && Navigator.of(parentContext!).canPop()) {
                              Navigator.of(parentContext!).pop();
                            }
                          });

                          // Open Congratulations sheet
                          Future.delayed(const Duration(milliseconds: 450), () {
                            if (parentContext != null) {
                              successfulSubscriptionBottomSheet(
                                  context: parentContext,
                                  height: 0.6,
                                  platform: platform,
                                  plan: plan,
                                  planCost: planCost
                              );
                            }
                          });
                        } else {
                          Fluttertoast.showToast(
                              msg: "Please Select a Bank Account",
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
                )
              ],
            ),
          );
        },
      );
    },
  );
}

