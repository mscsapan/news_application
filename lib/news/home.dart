import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:news_app/helper/article.dart';
import 'package:news_app/helper/data.dart';
import 'package:news_app/model/article_model.dart';
import 'package:news_app/model/model_category.dart';
import 'package:news_app/news/article_view.dart';
import 'package:webview_flutter/webview_flutter.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categories = new List<CategoryModel>();
  List<ArticleModel> articleModel = new List<ArticleModel>();
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    //if(Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
    categories = getModel();
    getNews();

  }
  getNews() async{
    News newsClass = News();
    await newsClass.getNews();
    articleModel = newsClass.news;
    setState(() {
      _loading = false;

    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Flutter',style: TextStyle(color: Colors.black),),
            Text('News',style: TextStyle(color: Colors.blue),),
          ],
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: _loading ?Center(
        child: Container(
          child: SpinKitCircle(color: Colors.blue,size: 60,),
        ),
      ) :
      SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                height: 70.0,
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: ListView.builder(
                  shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    itemBuilder: (context,index){
                      return CategoryTile(
                       imageUrl: categories[index].imageUrl,
                       categoryName: categories[index].categoryName,
                      );
                    }),
              ),
              Container(
                //height: MediaQuery.of(context).size.height,
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  itemCount: articleModel.length,
                    itemBuilder: (context,index){
                    return NewsTile(
                      imageUrl: articleModel[index].urlToImage,
                      title: articleModel[index].title,
                      des: articleModel[index].description,
                      url: articleModel[index].url,
                    );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
class CategoryTile extends StatelessWidget {
  final  imageUrl;
  final categoryName;
 CategoryTile({this.imageUrl,this.categoryName});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
              child: Image.network(imageUrl,width: 120.0,height: 60,fit: BoxFit.cover,)),
          Container(
            alignment: Alignment.center,
              width: 120.0,height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(categoryName,
                style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 15),)),
      ]
      ),
    );
  }
}

class NewsTile extends StatelessWidget {
  final String title,imageUrl,des,url;
  NewsTile({@required this.imageUrl,@required this.title,@required this.des,@required  this.url});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ArticleView(imageUrl: url,)));
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        margin: EdgeInsets.only(bottom: 16),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
                child: Image.network(imageUrl)),
            SizedBox(height: 8.0,),
            Text(title,style: TextStyle(fontSize: 20.0,color: Colors.black,fontWeight: FontWeight.w400),),
            SizedBox(height: 6.0,),
            Text(des,style: TextStyle(fontSize: 16.0)),
          ],
        ),
      ),
    );
  }
}



