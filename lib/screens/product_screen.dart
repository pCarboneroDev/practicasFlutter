import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:practicas_flutter/providers/product_form_provider.dart';
import 'package:practicas_flutter/services/services.dart';
import 'package:practicas_flutter/ui/input_decorations.dart';
import 'package:practicas_flutter/widgets/widgets.dart';
import 'package:provider/provider.dart';

class ProductScreen extends StatelessWidget {
   
  const ProductScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final productService = Provider.of<ProductService>(context);

    return ChangeNotifierProvider(
      create: (context) => ProductFormProvider(productService.selectedProduct),
      child: _ProductScreenBody(productService: productService),
    );

    //return _ProductScreenBody(productService: productService);
  }
}

class _ProductScreenBody extends StatelessWidget {
  const _ProductScreenBody({
    super.key,
    required this.productService,
  });

  final ProductService productService;

  @override
  Widget build(BuildContext context) {

    final productForm = Provider.of<ProductFormProvider>(context);

    return Scaffold(
      body: SingleChildScrollView(
        //keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
    
        child: Column(
          children: [
      
            Stack(
              children: [
                ProductImage(url: productService.selectedProduct.picture),
    
                Positioned(
                  top: 60,
                  left: 20,
                  child: IconButton(
                    onPressed: () => Navigator.of(context).pop(), 
                    icon: Icon(Icons.arrow_back_ios_new,size: 40, color: Colors.white)
                  )
                ),
    
                Positioned(
                  top: 60,
                  right: 20,
                  child: IconButton(
                    onPressed: () async {
                      final picker = new ImagePicker();
                      final XFile? pickedFile = await picker.pickImage(
                        source: ImageSource.camera,
                        imageQuality: 100
                      );

                      if (pickedFile == null) {
                        return;
                      }

                      print('Tenemos imagen ${pickedFile.path}');
                      productService.updateSelectedImage(pickedFile.path);
                    }, 
                    icon: Icon(Icons.camera_alt_outlined, size: 40, color: Colors.white)
                  )
                )
              ],
            ),
    
            _ProductForm(),
    
            SizedBox(height: 100,)
          ],
        ),
      ),
    
      floatingActionButton: FloatingActionButton(
        onPressed: productService.isSaving 
        ? null
        : () async {
          if (!productForm.isValidForm()) return;


          final String? imageUrl = await productService.uploadImage();

          if(imageUrl != null){
            productForm.product.picture = imageUrl;
          }

          await productService.saveOrCreateProduct(productForm.product);
        },
        child: productService.isSaving 
        ? CircularProgressIndicator.adaptive()
        : Icon(Icons.save_outlined),
      ),
    );
  }
}

class _ProductForm extends StatelessWidget {
  const _ProductForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final productFormProvider = Provider.of<ProductFormProvider>(context);
    final product = productFormProvider.product;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 25),
        width: double.infinity,
        height: 500,
        decoration: _BuildBoxDecoration(),
        child: Form(
          key: productFormProvider.formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,

          child: Column(
            children: [

              SizedBox(height: 10,),

              TextFormField(
                initialValue: product.name,
                onChanged: (value) => product.name = value,
                validator: (value) {
                  if(value == null || value.isEmpty){
                    return 'El nombre es obligatorio';
                  }
                },
                decoration: InputDecorations.authInputDecoratio(
                  hintText: 'Nombre productp',
                  labelText: 'Nombre'
                ),
              ),

              SizedBox(height: 40,),


              TextFormField(
                initialValue: product.price.toString(),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^(\d+)?\.?\d{0,2}'))
                ],
                onChanged: (value) {
                  if (double.tryParse(value) == null){
                    product.price = 0;
                  }
                  else{
                    product.price = double.parse(value);
                  }
                },
                validator: (value) {
                  if(value == null || value.isEmpty){
                    return 'El precio es obligatorio';
                  }
                },
                keyboardType: TextInputType.number,
                decoration: InputDecorations.authInputDecoratio(
                  hintText: '150€',
                  labelText: 'Precio'
                ),
              ),


              SizedBox(height: 40,),


              SwitchListTile.adaptive(
                title: Text('Disponible'),
                activeColor: Colors.indigo,
                value: product.available, 
                onChanged: productFormProvider.updateAvailability,
              )
            ],
          )
        ),
      ),
    );
  }

  BoxDecoration _BuildBoxDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25), bottomRight: Radius.circular(25))
    );
  }
}