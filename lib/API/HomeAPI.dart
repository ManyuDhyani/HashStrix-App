import 'package:hashstrix_app/Models/HomeModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class BlogData {
  String baseURL = "https://hashstrix.com/api/blogs/";

  Future<List> getAllBlogs() async {
    List<Blogs> BlogList = [];
    try {
      var response = await http.get(Uri.parse(baseURL));
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        //print(data);
        data.forEach((Blog) {
          Blogs i = Blogs(
            id: Blog['id'],
            Title: Blog['title'],
            Overview: Blog['overview'],
            Content: Blog['content'],
            Thumbnail: Blog['thumbnail'],
            Status: Blog['status'],
            Timestamp: Blog['timestamp'],
          );
          BlogList.add(i);
        });
        return BlogList;
      } else {
        return Future.error("Server Error");
      }
    } catch (e) {
      return Future.error(e);
    }
  }
}
