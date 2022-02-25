import 'package:flutter/material.dart';
import 'package:hashstrix_app/Models/BlogModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class BlogDetail extends StatefulWidget {
  int id;

  BlogDetail({Key? key, required this.id}) : super(key: key);

  @override
  State<BlogDetail> createState() => _BlogDetailState();
}

class _BlogDetailState extends State<BlogDetail> {
  List<Blogs> BlogList = [];
  void fetchBlogData async {
    String baseURL = "https://hashstrix.com/api/blog/";
    try{
      var response = await http.get(Uri.parse(baseURL + widget.id.toString()));
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        data.forEach((Blog) {
          Blogs i = Blogs(
            id: Blog['id'],
            Title: Blog['title'],
            Overview: Blog['overview'],
            Content: Blog['content'],
            Thumbnail: Blog['thumbnail'],
            Timestamp: Blog['timestamp'],
            ProfilePicture: Blog['author']['profile_picture'],
            Verified: Blog['author']['verified'],
            Username: Blog['author']['user']['username'],
          );
          BlogList.add(i);
        });
        return BlogList;
      } else {
        return Future.error("Server Error");
      }
    }
    catch (e) {
      return Future.error(e);
    }
  }

  @override
  void initState() {
    fetchBlogData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String id = widget.id.toString();
    return Container(
      child: Text(id),
    );
  }
}
