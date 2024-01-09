import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'widgets/bottom sheets/stack_sheets_framework.dart';

void main() {
  runApp(const MyApp());
}

BuildContext? parentContext;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Subscription App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Subscription App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        backgroundColor: Theme.of(context).primaryColorDark,
        title: Text(
          widget.title,
          style: GoogleFonts.montserrat(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            ListTile(
              tileColor: Theme.of(context).dialogBackgroundColor,
              leading: CircleAvatar(
                backgroundColor: Theme.of(context).primaryColorDark,
                child: const Icon(
                  Icons.movie,
                  color: Colors.white,
                ),
              ),
              title: Text(
                "OTT Subscriptions",
                style: GoogleFonts.montserrat(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 12
                ),
              ),
              subtitle: Text(
                "Disney+, Prime Video, Netflix, Jio Cinema....",
                style: GoogleFonts.montserrat(
                    color: Colors.black,
                    fontSize: 12
                ),
              ),
              trailing: TextButton(
                style: TextButton.styleFrom(
                  elevation: 2,
                  foregroundColor: Theme.of(context).primaryColorDark,
                  textStyle: GoogleFonts.montserrat(
                    fontSize: 16,
                    fontWeight: FontWeight.w600
                  ),
                ),
                onPressed: (){
                  parentContext = context;
                  platformSelectionBottomSheet(
                    context: context,
                    height: 0.8,
                    level: 3,
                  );
                },
                child: const Text(
                  "Buy",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
