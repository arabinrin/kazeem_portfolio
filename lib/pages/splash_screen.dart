import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData color = Theme.of(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 20,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
              height: 5,
            ),
            Center(
              child: Text(
                'Kazeem',
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w600,
                  color: color.primaryColor,
                ),),
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}
