
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:gallery_3d/gallery_3d.dart';

class LanguesEya extends StatefulWidget {
  const LanguesEya({Key? key}) : super(key: key);

  @override
  State<LanguesEya> createState() => _LanguesEyaState();
}

class _LanguesEyaState extends State<LanguesEya> {
  var imageUrlList = [

    "https://media.istockphoto.com/id/1455207009/fr/vectoriel/fran%C3%A7ais-m%C3%A9gaphone-avec-bulle-de-griffonnage-de-langue.jpg?s=2048x2048&w=is&k=20&c=HpLz681tNRUhpr4FxPlfyTXP0vq3GVZmUb4NvZGJpy4=",
    "https://media.istockphoto.com/id/1047570732/fr/vectoriel/anglais.jpg?s=2048x2048&w=is&k=20&c=Cjz6hOrxbbuW7apVxl3GuX4kZxXm3mLrB_EPyW8_ZsA=",
   // "https://i0.hdslb.com/bfs/manga-static/6b5ab1a7cb883504db182ee46381835e70d6d460.jpg@300w.jpg",
    "https://logos.flamingtext.com/Name-Logos/Arabe-design-sketch-name.png",
  ];

  int currentIndex = 0;

  Widget buildGallery3D(BuildContext context) {
    return Gallery3D(
      autoLoop: false,
      itemCount: 3,
    //  itemCount: imageUrlList.length,
      width: MediaQuery.of(context).size.width,
      height: 300,
      isClip: false,
      itemConfig: GalleryItemConfig(
        width: 220,
        height: 300,
        radius: 10,
        isShowTransformMask: false,
      ),
      currentIndex: currentIndex,
      onItemChanged: (index) {
        // Vous ne pouvez pas utiliser setState dans un StatelessWidget
        // Vous devez utiliser un StatefulWidget pour cela
      },
      onActivePage: (index) {
        print('onActivePage $index');
      },
      onClickItem: (index) => print("currentIndex:$index"),
      itemBuilder: (context, index) {
        return Image.network(
          imageUrlList[index],
          fit: BoxFit.fill,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Langues",
          style: TextStyle(
            fontWeight: FontWeight.w600, // Texte en gras
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                BackgrounBlurView(
                  imageUrl: imageUrlList[currentIndex],
                ),
                Container(
                  padding: EdgeInsets.only(top: 40),
                  child: buildGallery3D(context),
                  margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class BackgrounBlurView extends StatelessWidget {
  final String imageUrl;
  BackgrounBlurView({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        height: 200,
        width: MediaQuery.of(context).size.width,
        child: Image.network(
          imageUrl,
          fit: BoxFit.cover,
        ),
      ),
      BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
        child: Container(
          color: Colors.black.withOpacity(0.1),
          height: 200,
          width: MediaQuery.of(context).size.width,
        ),
      )
    ]);
  }
}
