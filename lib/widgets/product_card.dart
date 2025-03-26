import 'package:flutter/material.dart';

import '../models/models.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        margin: EdgeInsets.only(top: 30, bottom: 50),
        width: double.infinity,
        height: 400,
        decoration: _cardBorders(),
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            _BackgroundImage(product: product),

            _ProductDetails(product: product,),

            Positioned(
              top: 0,
              right: 0,
              child: _PriceTag(product: product,)
            ),

            if (!product.available)
              Positioned(
                top: 0,
                left: 0,
                child: _NotAvailable()
              )
          ],
        ),
      ),
    );
  }

  BoxDecoration _cardBorders() {
    return BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.black12, 
            offset: Offset(5, 7),
            blurRadius: 10
          )
        ]
      );
  }
}

class _NotAvailable extends StatelessWidget {
  const _NotAvailable({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 70,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.yellow[800],
        borderRadius: BorderRadius.only(topLeft: Radius.circular(25), bottomRight: Radius.circular(25))
      ),

      child: FittedBox(
        fit: BoxFit.contain,

        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text('No disponible', 
            style: TextStyle(color: Colors.white, fontSize: 20)
          ),
        ),
      ),
    );
  }
}

class _PriceTag extends StatelessWidget {
  final Product product;
  const _PriceTag({
    super.key, required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 70,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.indigo,
        borderRadius: BorderRadius.only(topRight: Radius.circular(25), bottomLeft: Radius.circular(25))
      ),

      child: FittedBox(
        fit: BoxFit.contain,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text('${product.price}€', 
            style: TextStyle(color: Colors.white, fontSize: 20)
          ),
        ),
      ),
    );
  }
}

class _ProductDetails extends StatelessWidget {
  final Product product;
  
  const _ProductDetails({
    super.key, required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 50),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        width: double.infinity,
        height: 70,
        decoration: _buildBoxDecoration(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text(product.name, 
            style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
            maxLines: 1, overflow: TextOverflow.ellipsis,),

            Text(product.id!, 
            style: TextStyle(fontSize: 15, color: Colors.white,),
            maxLines: 1, overflow: TextOverflow.ellipsis,)
          ],
        ),
      ),
    );
  }

  BoxDecoration _buildBoxDecoration() => BoxDecoration(
    color: Colors.indigo,
    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25), topRight: Radius.circular(25))
  );
}

class _BackgroundImage extends StatelessWidget {
  final Product product;
  const _BackgroundImage({
    super.key, required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: Container(
        width: double.infinity,
        height: 400,
        child: FadeInImage(
          placeholder: AssetImage('assets/jar-loading.gif'), 
          image: product.picture != null ? NetworkImage(product.picture!) : AssetImage('assets/no-image.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}