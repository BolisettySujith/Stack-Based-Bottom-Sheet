import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../utils/screen_size_helpers.dart';

class HeadExpandView extends StatelessWidget {
  final String title;
  final String description;

  const HeadExpandView({
    Key? key,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: displayHeight(context) * 0.13,
      child: Padding(
        padding: const EdgeInsets.only(
          top: 20,
          left: 20,
          right: 0,
          bottom: 10,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FittedBox(
                  child: Text(
                    title,
                    style: GoogleFonts.montserrat(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                SizedBox(
                  height: displayHeight(context) * 0.01,
                ),
                SizedBox(
                  width: displayWidth(context) * 0.8,
                  child: Text(
                    description,
                    style: GoogleFonts.montserrat(
                      color: Colors.black,
                      fontSize: 11,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(width: displayWidth(context) * 0.08),
          ],
        ),
      ),
    );
  }
}
