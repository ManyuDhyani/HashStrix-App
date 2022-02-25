import 'package:flutter/material.dart';

class BlogDetail extends StatefulWidget {
  int id;

  BlogDetail({Key? key, required this.id}) : super(key: key);

  @override
  State<BlogDetail> createState() => _BlogDetailState();
}

class _BlogDetailState extends State<BlogDetail> {
  @override
  Widget build(BuildContext context) {
    String id = widget.id.toString();
    return Container(
      child: Text(id),
    );
  }
}
