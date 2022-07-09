import 'package:flutter/material.dart';
import 'package:fooderlich_app/main.dart';
import 'package:fooderlich_app/models/app_state_manager.dart';
import 'package:fooderlich_app/models/fooderlich_pages.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  static MaterialPage page() {
    return MaterialPage(
      name: FooderlichPages.splashPath,
      key: ValueKey(FooderlichPages.splashPath),
      child: const SplashScreen(),
    );
  }

  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void didChangeDependencies() {
    super.didChangeDependencies();
    Provider.of<AppStateManager>(context, listen: false).initializeApp();
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
