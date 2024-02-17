import 'package:flutter/material.dart';
import 'package:lautkita_mobile/data/models/article_response_model.dart';

import '../../../common/global_variables.dart';

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: FadeInImage.assetNetwork(
                height: 96.0,
                width: 96.0,
                fit: BoxFit.cover,
                image: '${GlobalVariables.baseUrl}${post.image}',
                placeholder: 'assets/images/placeholder_1x1.png',
                imageErrorBuilder: (c, o, s) => Image.asset(
                  'assets/images/placeholder_1x1.png',
                  fit: BoxFit.cover,
                  height: MediaQuery.of(context).size.width / 2.45,
                ),
              ),
            ),
            const SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8),
                  Text(
                    post.category!.name!,
                    style: const TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    post.title!,
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

