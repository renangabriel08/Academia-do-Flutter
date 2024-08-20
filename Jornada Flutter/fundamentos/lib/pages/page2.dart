import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  Map argument = {};
  var cidades = [];

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        argument = ModalRoute.of(context)?.settings.arguments as Map;
        setState(() {});
      },
    );

    loadCities();

    super.initState();
  }

  Future<void> loadCities() async {
    final cidadesJson = await rootBundle.loadString('assets/cidades.json');
    setState(() {
      cidades = jsonDecode(cidadesJson);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(99),
                    gradient: const LinearGradient(
                      colors: [
                        Colors.deepPurple,
                        Colors.pink,
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 50,
                  height: 50,
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                      'https://s2.glbimg.com/JQ5_ziVlpMu2H0eP3QJ191PnDJ4=/620x480/top/e.glbimg.com/og/ed/f/original/2020/08/03/gettyimages-1193025241.jpg',
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    width: 40,
                    height: 10,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.red,
                    ),
                    child: const Center(
                      child: Text(
                        'AO VIVO',
                        style: TextStyle(fontSize: 7, color: Colors.white),
                      ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(width: 10),
            Text(argument['nome'] ?? 'Carregando...'),
          ],
        ),
        actions: [
          PopupMenuButton(
            initialValue: 'item1',
            itemBuilder: (context) {
              return [
                CheckedPopupMenuItem(
                  onTap: () => showDialog(
                    builder: (context) {
                      return const AlertDialog(
                        content: SingleChildScrollView(
                          child: Text('Item 1'),
                        ),
                      );
                    },
                    context: context,
                  ),
                  value: 'item1',
                  child: const Text('Item 1'),
                ),
                const CheckedPopupMenuItem(
                  value: 'item2',
                  child: Text('Item 2'),
                ),
                const CheckedPopupMenuItem(
                  value: 'item3',
                  child: Text('Item 3'),
                ),
              ];
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView.builder(
          itemCount: cidades.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.location_city),
                  title: Text(cidades[index]['cidade']),
                  subtitle: Text(cidades[index]['estado']),
                  contentPadding: const EdgeInsets.all(0),
                ),
                const Divider(),
              ],
            );
          },
        ),
      ),
    );
  }
}


// ElevatedButton(
//   style: ElevatedButton.styleFrom(
//     fixedSize: Size(MediaQuery.of(context).size.width, 50),
//     shape: RoundedRectangleBorder(
//       borderRadius: BorderRadius.circular(10),
//     ),
//   ),
//   onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
//     const SnackBar(
//       content: Text('Olá'),
//     ),
//   ),
//   child: const Text('Snackbar'),
// ),
// const SizedBox(height: 10),
// ElevatedButton(
//   style: ElevatedButton.styleFrom(
//     fixedSize: Size(MediaQuery.of(context).size.width, 50),
//     shape: RoundedRectangleBorder(
//       borderRadius: BorderRadius.circular(10),
//     ),
//   ),
//   onPressed: () => ScaffoldMessenger.of(context).showMaterialBanner(
//     MaterialBanner(
//       content: const Text('Olá'),
//       actions: [
//         TextButton(
//           onPressed: () => ScaffoldMessenger.of(context)
//               .hideCurrentMaterialBanner(),
//           child: const Text('Cancelar'),
//         )
//       ],
//     ),
//   ),
//   child: const Text('Banner'),
// ),