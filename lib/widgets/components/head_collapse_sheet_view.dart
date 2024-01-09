import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/screen_size_helpers.dart';

class HeadCollapseView extends StatefulWidget {
  final String title;
  final String description;

  const HeadCollapseView({
    Key? key,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  _HeadCollapseViewState createState() => _HeadCollapseViewState();
}

class _HeadCollapseViewState extends State<HeadCollapseView> {
  @override
  Widget build(BuildContext context) {
    return Container(

      height: displayHeight(context) * 0.13,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        )
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          top: 20,
          left: 30,
          bottom: 20,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // After title
                Text(
                  widget.title,
                  style: GoogleFonts.montserrat(
                    color: const Color(0xff4a555e),
                    fontSize: 11,
                  ),
                ),
                SizedBox(
                  height: displayHeight(context) * 0.01,
                ),
                // After description
                SizedBox(
                  width: displayWidth(context) * 0.7,
                  child: Text(
                    widget.description,
                    style: GoogleFonts.montserrat(
                      color: const Color(0xff929ea5),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            // SizedBox(width: displayWidth(context) * 0.08),
            const Icon(
              Icons.keyboard_arrow_down,
              color: Colors.black,
            ),
            SizedBox(width: displayWidth(context) * 0.08),
          ],
        ),
      ),
    );
  }
}
