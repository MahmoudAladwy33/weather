import 'package:flutter/material.dart';

class Noweatherbody extends StatelessWidget {
  const Noweatherbody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Color(0xff424553),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/images/no info.png',
                width: 250,
                height: 300,
              ),
              Text(
                'There is No Weather',
                style: TextStyle(
                  color: Color.fromARGB(255, 202, 17, 3),
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'Try Search Now',
                style: TextStyle(
                  color: Color.fromARGB(255, 202, 17, 3),
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
