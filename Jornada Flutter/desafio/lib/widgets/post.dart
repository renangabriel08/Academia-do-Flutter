import 'package:desafio/widgets/btnIcon.dart';
import 'package:flutter/material.dart';

class Post extends StatefulWidget {
  final String nome;
  final String img;
  final String post;
  final int curtidas;
  final String desc;
  final int comentarios;

  const Post({
    super.key,
    required this.nome,
    required this.img,
    required this.post,
    required this.curtidas,
    required this.desc,
    required this.comentarios,
  });

  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
  bool overflow = true;
  bool click = false;
  bool save = false;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 30,
                    height: 30,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(
                        widget.img,
                      ),
                    ),
                  ),
                  const SizedBox(width: 7),
                  Text(
                    widget.nome,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              BtnIcon(
                callback: () => (),
                icone: Icons.more_horiz_outlined,
              ),
            ],
          ),
        ),
        SizedBox(
          width: width,
          height: width,
          child: Image.network(widget.post, fit: BoxFit.cover),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () => setState(() => click = !click),
                    child: Icon(
                      click ? Icons.favorite : Icons.favorite_outline,
                      color: click ? Colors.red : Colors.white,
                    ),
                  ),
                  const SizedBox(width: 20),
                  BtnIcon(
                    callback: () => (),
                    icone: Icons.mode_comment_outlined,
                  ),
                  const SizedBox(width: 20),
                  BtnIcon(
                    callback: () => (),
                    icone: Icons.send_rounded,
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        !save
                            ? 'Publicação salva'
                            : 'Publicação removida dos salvos',
                      ),
                      action: SnackBarAction(
                        label: !save ? 'Ver todas' : '',
                        onPressed: () => (),
                      ),
                      duration: const Duration(milliseconds: 1000),
                    ),
                  );
                  setState(() => save = !save);
                },
                child: Icon(
                  save ? Icons.bookmark : Icons.bookmark_outline,
                  color: save ? Colors.grey : Colors.white,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    '${widget.curtidas} curtidas',
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              GestureDetector(
                onTap: () => setState(() => overflow = !overflow),
                child: SizedBox(
                  width: width,
                  child: Text(
                    '${widget.nome}: ${widget.desc}',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      overflow: overflow
                          ? TextOverflow.ellipsis
                          : TextOverflow.visible,
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  Text(
                    'Ver todos os ${widget.comentarios} comentários',
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.normal,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
