import 'package:hashstrix_app/Models/BlogModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TrendingData {
  String baseURL = "https://hashstrix.com/api/trending/";

  Future<List> getTrendingBlogs() async {
    List<Blogs> TrendingBlogList = [];
    try {
      var response = await http.get(Uri.parse(baseURL));
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        data.forEach((Blog) {
          Blogs i = Blogs(
            id: Blog['id'],
            Title: Blog['title'],
            Slug: Blog['slug'],
            Overview: Blog['overview'],
            Content: Blog['content'],
            Thumbnail: Blog['thumbnail'],
            Timestamp: Blog['timestamp'],
            ProfilePicture: Blog['author']['profile_picture'],
            Verified: Blog['author']['verified'],
            Username: Blog['author']['user']['username'],
          );
          TrendingBlogList.add(i);
        });
        return TrendingBlogList;
      } else {
        return Future.error("Server Error");
      }
    } catch (e) {
      return Future.error(e);
    }
  }
}
