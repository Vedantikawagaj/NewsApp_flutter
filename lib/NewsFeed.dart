import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/Favorites.dart';
import 'package:project/Helper/FavHelper.dart';
import 'package:project/Helper/NewsHelper.dart';
import 'package:project/Model/FavItemsModel.dart';
import 'package:project/Model/NewsModel.dart';
import 'package:provider/provider.dart';
import 'Homepage.dart';

class NewsFeed extends StatefulWidget {
  @override
  _NewsFeedState createState() => _NewsFeedState();
}

class _NewsFeedState extends State<NewsFeed> {

  List<NewsModel> newsList =List<NewsModel>();
  bool isFav = false;
  bool _loading = true;


  @override
  void initState(){
    super.initState();
    getNews();
    
  }
  getNews() async{
    NewsHelper newsClass = NewsHelper();
    await newsClass.getNews();
    newsList = newsClass.news;
    setState(() {
      _loading = false;
    });

  }

   
  @override
  Widget build(BuildContext context) {
    var favItems = Provider.of<FavItems>(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('NewsFeed'),
         backgroundColor: Color(0xff6C63FF),
         centerTitle: true,
        ),
      body: _loading ? Center(
        child: Container(
          child: CircularProgressIndicator(),
        ),
      )
      :Container(
        padding: EdgeInsets.fromLTRB(10, 2, 10,10),
        color: Colors.grey[350],
        child: Center(
          child: FutureBuilder(
          builder: (context,index){
            return ListView.builder(
              itemCount: newsList.length,
              physics: ClampingScrollPhysics(),
              itemBuilder: (BuildContext context,int index){
                return Card(
                    child: ListTile(
                    
                    leading: GestureDetector(
                      onTap: (){
                          FavItemsModel favItemsModel = FavItemsModel(
                            title: newsList[index].title,
                            summary: newsList[index].summary,
                            url: newsList[index].url,
                            published: newsList[index].published,

                          );

                          favItems.addFavItems(favItemsModel);
                          setState(() {
                            newsList[index].isFav= "True";
                          });
                          // isFav = true;
                       },
                      child: Icon(newsList[index].isFav=="True"? Icons.favorite: Icons.favorite_border_rounded
                      ,size: 30,
                      color: newsList[index].isFav=="True"? Colors.red: Colors.black,
                      ),
                    ),

                    title: Text(newsList[index].title),
                    subtitle: Text(newsList[index].summary),

                    ),
                );
      }
      
            );
          }
          ),
          
          )

      ),
    );
  }
}