import 'package:flutter/material.dart';
import 'package:lautkita_mobile/data/models/article_response_model.dart';

import '../../../data/datasources/article_local_datasources.dart';

class SavedArticlePage extends StatefulWidget {
  @override
  _SavedArticlePageState createState() => _SavedArticlePageState();
}

class _SavedArticlePageState extends State<SavedArticlePage> {
  List<Post> savedArticles = [];

  @override
  void initState() {
    super.initState();
    loadSavedArticles();
  }

  Future<void> loadSavedArticles() async {
    final List<Post> articles =
        await ArticleLocalDatasource().getSavedArticles();
    setState(() {
      savedArticles = articles;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Saved Articles'),
      ),
      body: savedArticles.isEmpty
          ? Center(
              child: Text('No saved articles.'),
            )
          : ListView.builder(
              itemCount: savedArticles.length,
              itemBuilder: (context, index) {
                final article = savedArticles[index];
                return ListTile(
                  title: Text(article.title ?? ''),
                  subtitle: Text(article.category?.name ?? ''),
                  // Tambahkan fungsi lainnya seperti menampilkan gambar artikel, dll.
                );
              },
            ),
    );
  }
}
