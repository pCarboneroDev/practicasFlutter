import 'package:flutter/material.dart';
import 'package:practicas_flutter/src/services/news_service.dart';
import 'package:practicas_flutter/src/widgets/lista_noticias.dart';
import 'package:provider/provider.dart';

class Tab1Page extends StatefulWidget {
  const Tab1Page({super.key});

  @override
  State<Tab1Page> createState() => _Tab1PageState();
}

class _Tab1PageState extends State<Tab1Page> with AutomaticKeepAliveClientMixin{
  @override
  Widget build(BuildContext context) {
    final newsService = Provider.of<NewsService>(context);
    //newsService.headlines;


    return Scaffold(
      body: (newsService.headlines.length == 0) 
      ? Center(child: CircularProgressIndicator.adaptive())
      : ListaNoticias(noticias: newsService.headlines)
    );
  }
  
  @override
  bool get wantKeepAlive => true;
}