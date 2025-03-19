import 'package:flutter/material.dart';
import 'package:practicas_flutter/themes/app_theme.dart';

class ListviewBuilderScreen extends StatefulWidget {
   
  const ListviewBuilderScreen({super.key});

  @override
  State<ListviewBuilderScreen> createState() => _ListviewBuilderScreenState();
}

class _ListviewBuilderScreenState extends State<ListviewBuilderScreen> {

  final List<int> imagesIds =  [1,2,3,4,5,6,7,8,9,10];
  final ScrollController scrollController =  ScrollController();
  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    scrollController.addListener(() {
      if ((scrollController.position.pixels + 200) >= scrollController.position.maxScrollExtent){
        fetchData();
      }
    },);
  }

  Future fetchData() async {
    if(isLoading){
      return;
    }

    isLoading = true;
    setState(() {
      
    });

    await Future.delayed(const Duration(seconds: 3));

    add5();

    isLoading = false;

    setState(() {});

    if ((scrollController.position.pixels + 100) <= scrollController.position.maxScrollExtent){
      return;
    }

    scrollController.animateTo(
      scrollController.position.pixels + 120, 
      duration: const Duration(milliseconds: 300),
      curve: Curves.fastOutSlowIn
    );
  }


  void add5(){
    final lastId = imagesIds.last;
    imagesIds.addAll(
      [1,2,3,4,5].map((e) => lastId + e,
    ));
    setState(() {});
  }

  Future<void> onRefresh() async {
    await Future.delayed(const Duration(seconds: 2));
    var lastId = imagesIds.last;
    imagesIds.clear();
    imagesIds.add(lastId + 1);
    add5();
  }


  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeBottom: true,

        child: Stack(
          children: [
            RefreshIndicator(
              onRefresh: onRefresh,
              child: ListView.builder(
              controller: scrollController,
              itemCount: imagesIds.length,
              itemBuilder: (context, index) {
                return FadeInImage(
                  width: double.infinity,
                  height: 300,
                  fit: BoxFit.cover,
                  placeholder: const AssetImage('assets/jar-loading.gif'), 
                  image: NetworkImage('https://picsum.photos/500/300?image=${imagesIds[index]}')
                );
              },
              ),
            ),

            if (isLoading)
              Positioned(
                bottom: 40,
                left: size.width*0.5-30,
                child: const _LoadingIcon()
              )
          ],
        ),
      )
    );
  }
}

class _LoadingIcon extends StatelessWidget {
  const _LoadingIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        color: Colors.white.withAlpha(200),
        shape: BoxShape.circle
      ),
      child: const CircularProgressIndicator( color: AppTheme.primaryColor2,)
    );
  }
}