import 'package:flutter/material.dart';
import 'Helper/NewsHelper.dart';
import 'Homepage.dart';
import 'Model/NewsModel.dart';

class Favorites extends StatefulWidget {
  final String title,summary;
  final int newsid;
  Favorites({
    this.title,
    this.summary,
    
    this.newsid
  });
  @override
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  List<NewsModel> favList =List<NewsModel>();
  bool _loading = true;
  @override
  void initState(){
    super.initState();
    getFav();
  }

  getFav() async{
    NewsHelper favClass = NewsHelper();
    await favClass.getNews();
    favList = favClass.news;
    setState(() {
      _loading = false;
    });

  }  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      
       appBar: AppBar(
         title: Text('Favorites'),
         backgroundColor: Color(0xff6C63FF),
         centerTitle: true,
         ),
         
         
       body: _loading ? Center(
        child: Container(
          child: CircularProgressIndicator(),
        ),
      ): 
       Container(
        padding: EdgeInsets.fromLTRB(10, 2, 10,10),
        color: Colors.grey[350],
        child: Center(
          child: FutureBuilder(
          builder: (context,index){
            
            return ListView.builder(
              itemCount: favList.length,
              itemBuilder: (BuildContext context,int index){
                return Card(
                    child: ListTile(
                    
                    leading: Icon(Icons.favorite,size: 30,color: Colors.red,),
                    title: Text(favList[index].title),
                    subtitle: Text(favList[index].summary),
                    
                    // title: Text('${widget.title}'),
                    // subtitle: Text('${widget.summary}'),
                    
                    
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