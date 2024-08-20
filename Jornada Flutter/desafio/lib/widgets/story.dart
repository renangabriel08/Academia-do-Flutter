import 'package:flutter/material.dart';

class Story extends StatelessWidget {
  final String nome;
  final String img;
  final bool live;
  final bool cf;

  const Story({
    super.key,
    required this.nome,
    required this.img,
    required this.live,
    required this.cf,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(7),
      child: SizedBox(
        width: 70,
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(999),
                    gradient: !cf
                        ? const LinearGradient(
                            colors: [
                              Colors.deepPurple,
                              Colors.pink,
                              Colors.purple,
                              Colors.pinkAccent,
                            ],
                          )
                        : null,
                    color: cf ? Colors.green : null,
                  ),
                ),
                SizedBox(
                  width: 65,
                  height: 65,
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(img),
                    backgroundColor: Colors.black,
                  ),
                ),
                live
                    ? Positioned(
                        bottom: 0,
                        child: Container(
                          width: 40,
                          height: 12,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            color: Colors.red,
                          ),
                          child: const Center(
                            child: Text(
                              'AO VIVO',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 8,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      )
                    : Container(),
              ],
            ),
            const SizedBox(height: 6),
            Text(
              nome,
              style: const TextStyle(
                overflow: TextOverflow.ellipsis,
                color: Colors.white,
                fontSize: 13,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
