import 'package:flutter/material.dart';
import 'package:lautkita_mobile/data/models/article_response_model.dart';

class ArticleItemWidget extends StatelessWidget {
  final Post post;

  const ArticleItemWidget({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: FadeInImage.assetNetwork(
                height: 96.0,
                width: 96.0,
                fit: BoxFit.cover,
                image: post.image!,
                placeholder: 'assets/images/placeholder_1x1.png',
                imageErrorBuilder: (c, o, s) => Image.asset(
                  'assets/images/placeholder_1x1.png',
                  fit: BoxFit.cover,
                  height: MediaQuery.of(context).size.width / 2.45,
                ),
              ),
            ),
            const SizedBox(width: 16.0),
            Text(
              post.title!,
              style: const TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
