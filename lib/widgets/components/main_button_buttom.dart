import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MainBottomButton extends StatefulWidget {
  final String title;
  final Function onPressed;

  const MainBottomButton({
    Key? key,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  @override
  _MainBottomButtonState createState() => _MainBottomButtonState();
}

class _MainBottomButtonState extends State<MainBottomButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        padding: EdgeInsets.zero,
        minimumSize: const Size(50, 65),
        // backgroundColor: const Color(0xff3d4ca3),
        backgroundColor: Theme.of(context).primaryColorDark
      ),
      child: Text(
        widget.title,
        style: GoogleFonts.montserrat(
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
      onPressed: () => widget.onPressed(),
    );
  }
}
