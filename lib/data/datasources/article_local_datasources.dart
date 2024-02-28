import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:lautkita_mobile/data/models/article_response_model.dart';

class ArticleLocalDatasource {
  static const String _keyArticleData = 'article_data';

  Future<bool> saveArticleData(List<Post> articles) async {
    try {
      final SharedPreferences pref = await SharedPreferences.getInstance();
      final jsonString = jsonEncode(articles);
      await pref.setString(_keyArticleData, jsonString);
      return true;
    } catch (e) {
      print('Error saving article data: $e');
      return false;
    }
  }

  Future<bool> removeArticleData(Post article) async {
    try {
      final SharedPreferences pref = await SharedPreferences.getInstance();
      final jsonString = pref.getString(_keyArticleData);
      if (jsonString != null) {
        final List<dynamic> decodedData = jsonDecode(jsonString);
        final List<Post> articles = decodedData.map((item) => Post.fromJson(item)).toList();
        articles.removeWhere((savedArticle) => savedArticle.slug == article.slug);
        final updatedJsonString = jsonEncode(articles);
        await pref.setString(_keyArticleData, updatedJsonString);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print('Error removing article data: $e');
      return false;
    }
  }

  Future<List<Post>> getSavedArticles() async {
    try {
      final SharedPreferences pref = await SharedPreferences.getInstance();
      final jsonString = pref.getString(_keyArticleData);
      if (jsonString != null) {
        final List<dynamic> decodedData = jsonDecode(jsonString);
        final List<Post> articles = decodedData.map((item) => Post.fromJson(item)).toList();
        return articles;
      } else {
        return [];
      }
    } catch (e) {
      print('Error getting saved articles: $e');
      return [];
    }
  }
}
