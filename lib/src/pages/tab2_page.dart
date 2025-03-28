import 'package:flutter/material.dart';
import 'package:practicas_flutter/src/models/category_model.dart';
import 'package:practicas_flutter/src/services/news_service.dart';
import 'package:practicas_flutter/src/theme/theme.dart';
import 'package:practicas_flutter/src/widgets/lista_noticias.dart';
import 'package:provider/provider.dart';

class Tab2Page extends StatelessWidget {
  const Tab2Page({super.key});

  @override
  Widget build(BuildContext context) {
    final newsService = Provider.of<NewsService>(context);

    return SafeArea(

      child: Scaffold(

        body: Column(
          
          children: [
            _ListaCategorias(),

            Expanded(
              child: ListaNoticias(noticias: newsService.getArticulosCategriaSeleccionada)
            )
          ],
        ),
      ),
    );
  }
}

class _ListaCategorias extends StatelessWidget {
  const _ListaCategorias();

  @override
  Widget build(BuildContext context) {
    final categories = Provider.of<NewsService>(context).categories;

    return Container(
      width: double.infinity,
      height: 90,

      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
          
            child: Column(
              children: [
                _CategoryBUtton(category: categories[index]),
                SizedBox(height: 5),
                Text('${categories[index].name[0].toUpperCase()}${categories[index].name.substring(1)}')
              ],
            ),
          );
        },
      ),
    );
  }
}

class _CategoryBUtton extends StatelessWidget {
  const _CategoryBUtton({
    required this.category
  });

  final Category category;

  @override
  Widget build(BuildContext context) {
    final newsService = Provider.of<NewsService>(context);

    return GestureDetector(
      onTap: () {  
        final newsService = Provider.of<NewsService>(context, listen: false);
        newsService.selectedCategory = category.name;
      },

      child: Container(
        width: 40,
        height: 40,
        margin: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          
          color: Colors.white
        ),
      
        child: Icon(
          category.icon, 
          color: (newsService.selectedCategory == category.name)
          ? miTema.primaryColor
          : Colors.black
      ),
      ),
    );
  }
}