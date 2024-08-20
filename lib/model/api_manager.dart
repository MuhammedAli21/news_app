import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:news_app/model/NewsRespons.dart';
import 'package:news_app/model/SourceResponse.dart';
import 'package:news_app/model/api_constants.dart';

class ApiManager {
//https://newsapi.org/v2/top-headlines/sources?apiKey=267790771ff94a99b979989d96a92f5d

  static Future<SourceResponse?> getSources(
      [String? categoryId, String? lang]) async {
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.sourcesEndpoint, {
      'apiKey': ApiConstants.ApiKey,
      'category': categoryId,
      'language': lang
    });
    Response response = await http.get(url);

    //todo: it might have an error here from client side, so we use try and catch
    try {
      var responseBody = response.body; // string
      var json = jsonDecode(responseBody); // json using jsonDecode
      return SourceResponse.fromJson(json); //SourceResponse
    } catch (e) {
      throw e;
    }
    //todo we can use this instead on one line
    // return SourceResponse.fromJson(jsonDecode(response.body));
  }

//https://newsapi.org/v2/everything?q=bitcoin&apiKey=267790771ff94a99b979989d96a92f5d

  static Future<NewsRespons?> getNewsBySourceId(
      {String? sourceId, String? lang, String page = '1'}) async {
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.NewsApi, {
      'apiKey': ApiConstants.ApiKey,
      'sources': sourceId,
      'language': lang,
      'page': page
    });
    var newsRespons = await http.get(url);
    try {
      var responsBody = newsRespons.body; //String
      var json = jsonDecode(responsBody); //json
      return NewsRespons.fromJson(json);
    } catch (e) {
      throw e;
    }
  }

  static Future<NewsRespons?> searchInNews({String? query}) async {
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.NewsApi, {
      'apiKey': ApiConstants.ApiKey,
      'q': query,
    });
    var newsRespons = await http.get(url);
    try {
      var responsBody = newsRespons.body; //String
      var json = jsonDecode(responsBody); //json
      return NewsRespons.fromJson(json);
    } catch (e) {
      throw e;
    }
  }
}
