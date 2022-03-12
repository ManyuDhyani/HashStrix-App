import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class BlogDetail extends StatefulWidget {
  final String slug;
  BlogDetail({Key? key, required this.slug}) : super(key: key);

  @override
  State<BlogDetail> createState() => _BlogDetailState();
}

class _BlogDetailState extends State<BlogDetail> {
  @override
  Widget build(BuildContext context) {
    String slug = widget.slug;
    return WebviewScaffold(
      url: "https://hashstrix.com/post/" + widget.slug,
      appBar: new AppBar(
        title: new Text("HashStrix"),
        // centerTitle: true,
        elevation: 0,
      ),
      withZoom: true,
      withLocalStorage: true,
      withJavascript: true,
    );
  }
}
