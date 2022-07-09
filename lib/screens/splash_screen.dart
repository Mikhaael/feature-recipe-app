import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  // TODO: SplashScreen MaterialPage Helper

  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void didChangeDependencies() {
    super.didChangeDependencies();
    // TODO: Initialize App
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Image(
                image: AssetImage('assets/images/mk_logo.jpg'),
              ),
              Text('Initializing...'),
            ],
          ),
        ),
      ),
    );
  }
}
