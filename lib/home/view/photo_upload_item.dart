import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../utils/global.dart';
import '../../utils/hex_color.dart';

class PhotoUploadItem extends StatelessWidget {
  final String? title;
  final List<String> images;
  final void Function(int index)? itemOnTap;
  final void Function()? addAction;

  const PhotoUploadItem({super.key, this.title, required this.images, this.itemOnTap, this.addAction});

  @override
  Widget build(BuildContext context) {
    double itemWidth = (MediaQuery.of(context).size.width - 40) / 3;
    double itemHeight = itemWidth * 0.7;
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      if (title != null)
        Container(
          padding: const EdgeInsets.only(top: 10, bottom: 10),
          child: Text(title!, style: TextStyle(color: Global.instance.textPrimaryColor, fontSize: 15)),
        ),
      if(title == null)
       const SizedBox(height: 10),
      Wrap(
        spacing: 8,
        runSpacing: 8,
        children: [
          ...List.generate(
            images.length,
            (index) => InkWell(
              onTap: () => itemOnTap!(index),
              child: Container(
                width: itemWidth,
                height: itemHeight,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
                child: CachedNetworkImage(
                  imageUrl: images[index],
                  placeholder: (context, text) => Icon(Icons.image, size: 70, color: Global.instance.themeColor),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          InkWell(
            onTap: addAction,
            child: Container(
                width: itemWidth,
                height: itemHeight,
                decoration: BoxDecoration(
                  color: HexColor('#F1FAFF'),
                  border: Border.all(color: Global.instance.textPrimaryColor, width: 1.0),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Icon(Icons.add, size: 40, color: Global.instance.textPrimaryColor)),
          )
        ],
      )
    ]);
    ;
  }
}
