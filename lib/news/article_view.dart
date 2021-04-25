import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleView extends StatefulWidget {
  final String imageUrl;
  ArticleView({this.imageUrl});
  @override
  _ArticleViewState createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {
  final Completer<WebViewController> _controller = new Completer<WebViewController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Flutter',style: TextStyle(color: Colors.black),),
            Text('News',style: TextStyle(color: Colors.blue),)
          ],
      ),
        actions: [
          Opacity(
              opacity: 0.0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Icon(Icons.save),
            ),
          ),
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: WebView(
          initialUrl: widget.imageUrl,
          onWebViewCreated: ((WebViewController webController){
            _controller.complete(webController);
          }),
        ),
      ),
    );
  }
}
