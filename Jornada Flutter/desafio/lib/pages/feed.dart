import 'dart:convert';

import 'package:desafio/widgets/btnIcon.dart';
import 'package:desafio/widgets/post.dart';
import 'package:desafio/widgets/story.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Feed extends StatefulWidget {
  const Feed({super.key});

  @override
  State<Feed> createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  bool loading = true;
  List story = [];
  List posts = [];

  Future<void> loadStory() async {
    story = jsonDecode(await rootBundle.loadString('assets/jsons/story.json'));
    posts = jsonDecode(await rootBundle.loadString('assets/jsons/posts.json'));
    loading = false;
    setState(() {});
  }

  @override
  void initState() {
    loadStory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 50, 20, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Instagram',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 27,
                    fontFamily: 'OleoScript',
                  ),
                ),
                Row(
                  children: [
                    BtnIcon(
                      callback: () => (),
                      icone: Icons.add_box_outlined,
                    ),
                    const SizedBox(width: 20),
                    BtnIcon(
                      callback: () => (),
                      icone: Icons.favorite_outline,
                    ),
                    const SizedBox(width: 20),
                    BtnIcon(
                      callback: () => (),
                      icone: Icons.message_outlined,
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          !loading
              ? SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      const SizedBox(width: 3),
                      for (var str in story)
                        Story(
                          nome: str['nome'],
                          img: str['img'],
                          live: str['live'],
                          cf: str['cf'],
                        )
                    ],
                  ),
                )
              : Container(),
          const Divider(),
          Column(
            children: [
              for (var post in posts)
                Post(
                  nome: post['nome'],
                  img: post['img'],
                  post: post['post'],
                  curtidas: post['curtidas'],
                  desc: post['desc'],
                  comentarios: post['comentarios'],
                ),
            ],
          )
        ],
      ),
    );
  }
}
