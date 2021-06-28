import 'package:flutter/material.dart';
import 'package:project/Favorites.dart';
import 'package:project/Helper/NewsHelper.dart';
import 'package:project/Model/NewsModel.dart';
import 'Homepage.dart';

class NewsFeed extends StatefulWidget {
  @override
  _NewsFeedState createState() => _NewsFeedState();
}

class _NewsFeedState extends State<NewsFeed> {

  List<NewsModel> newsList =List<NewsModel>();
  bool isFav = false;
  bool _loading = true;
  int countFav = 0;

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
    return Scaffold(
      appBar: AppBar(
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
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => Favorites(
                          //  title: newsList[index].title,
                          //  summary: newsList[index].summary,
                          //  countFav: countFav+1,
                          newsid: index,
                           )
                           )
                           );
                          isFav = true;
                        
                       },
                      child: Icon(isFav? Icons.favorite: Icons.favorite_border_rounded
                      ,size: 30,
                      color: isFav? Colors.red: Colors.black,
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