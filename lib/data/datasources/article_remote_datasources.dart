import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:lautkita_mobile/data/models/article_response_model.dart';

import '../../common/global_variables.dart';

class ArticleRemoteDatasource {
  Future<Either<String, ArticleResponseModel>> getArticles() async {
    final headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    };
    final response = await http.get(
      Uri.parse('${GlobalVariables.baseUrl}/api/posts'),
      headers: headers,
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseBody = json.decode(response.body);
      return Right(ArticleResponseModel.fromJson(responseBody));
    } else {
      return const Left('Server Error, please contact admin');
    }
  }

  // Future<Either<String, ArticleResponseModel>> getArticlesByCategory(
  //     int categoryId) async {
  //   final headers = {
  //     'Accept': 'application/json',
  //     'Content-Type': 'application/json',
  //   };
  //   final response = await http.get(
  //     Uri.parse(
  //         '${GlobalVariables.baseUrl}/api/products?category_id=$categoryId'),
  //     headers: headers,
  //   );

  //   if (response.statusCode == 200) {
  //     final Map<String, dynamic> responseBody = json.decode(response.body);
  //     return Right(ArticleResponseModel.fromJson(responseBody));
  //   } else {
  //     return const Left('Server Error, please contact admin');
  //   }
  // }
}
