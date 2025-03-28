import 'package:flutter/material.dart';
import 'package:practicas_flutter/src/models/news_models.dart';
import 'package:practicas_flutter/src/theme/theme.dart';

class ListaNoticias extends StatelessWidget {
  final List<Article> noticias;

  const ListaNoticias({super.key, required this.noticias});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: noticias.length,
      itemBuilder: (context, index) {
        return _Noticia(noticia: noticias[index], index: index);
      },
    );
  }
}


class _Noticia extends StatelessWidget {
  final Article noticia;
  final int index;
  const _Noticia({required this.noticia, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),

      child: Column(
        children: <Widget>[
          _TarjetaTopBar(noticia: noticia, index: index),
          _TarjetaTitulo(noticia: noticia),
          _TarjetaImage(noticia: noticia),
          _TarjetaBody(noticia: noticia),

          _TarjetaBotones(),

          SizedBox(height: 10,),
          Divider()
        ],
      ),
    );
  }
}

class _TarjetaTopBar extends StatelessWidget {
  final Article noticia;
  final int index;

  const _TarjetaTopBar({
    required this.noticia, required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      margin: EdgeInsets.only(bottom: 10),
      child: Row(

        children: [
          Text('${index+1}: ',
            style: TextStyle(color: miTema.primaryColor)),

          Text('${noticia.source.name}')
        ],
      ),
    );
  }
}


class _TarjetaTitulo extends StatelessWidget {
  final Article noticia;
  const _TarjetaTitulo({required this.noticia});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(noticia.title, style: 
        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
    );
  }
}

class _TarjetaImage extends StatelessWidget {
  final Article noticia;
  const _TarjetaImage({required this.noticia});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),

      child: Container(
        child: FadeInImage(
          placeholder: AssetImage('assets/giphy.gif'), 
          image: noticia.urlToImage != null 
            ? NetworkImage(noticia.urlToImage!)
            : AssetImage('assets/no-image.png')
        ),
      ),
    );
  }
}


class _TarjetaBody extends StatelessWidget {
  final Article noticia;
  const _TarjetaBody({required this.noticia});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(noticia.description ?? ''),
    );
  }
}

class _TarjetaBotones extends StatelessWidget {
  const _TarjetaBotones();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          RawMaterialButton(
            onPressed: () {
              
            },
            fillColor: miTema.primaryColor,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Icon(Icons.star_border),
          ),

          SizedBox(width: 10,),

          RawMaterialButton(
            onPressed: () {
              
            },
            fillColor: Colors.blue,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Icon(Icons.more),
          ),
        ],
      ),
    );
  }
}