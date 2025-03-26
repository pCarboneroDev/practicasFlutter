import 'package:flutter/material.dart';


class ProductImage extends StatelessWidget {
  final String? url;

  const ProductImage({super.key, this.url});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10, left: 10, top: 10),
      child: Container(
        width: double.infinity,
        height: 450,
        decoration: _buildBoxDecoration(),
        child: Opacity(
          opacity: 0.8,
          child: ClipRRect(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(45), topRight: Radius.circular(45)),
            child: url == null
            ? Image( 
                image: AssetImage('assets/no-image.png'),
                fit: BoxFit.cover
              )
            : FadeInImage(
              placeholder: AssetImage('assets/jar-loading.gif'), 
              image: NetworkImage(url!),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }

  BoxDecoration _buildBoxDecoration() => BoxDecoration(
    borderRadius: BorderRadius.only(topLeft: Radius.circular(45), topRight: Radius.circular(45)),
    color: Colors.black,
    boxShadow: [
      BoxShadow(
        color: Colors.black12.withAlpha(150),
        blurRadius: 10,
        offset: Offset(0, 5)
      )
    ]
  );
}