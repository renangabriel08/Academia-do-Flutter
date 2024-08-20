import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:projeto_imc/widgets/btn.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Btn(
              callback: () => Navigator.pushNamed(context, '/setState'),
              text: 'SetState',
            ),
            const SizedBox(height: 10),
            Btn(
              callback: () => Navigator.pushNamed(context, '/valueNotifier'),
              text: 'ValueNotifier',
            ),
            const SizedBox(height: 10),
            Btn(
              callback: () => Navigator.pushNamed(context, '/changeNotifier'),
              text: 'ChangeNotifier',
            ),
            const SizedBox(height: 10),
            Btn(
              callback: () => Navigator.pushNamed(context, '/bloc'),
              text: 'Bloc',
            ),
          ],
        ),
      ),
    );
  }
}
