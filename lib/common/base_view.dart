import 'package:flutter/material.dart';
import 'package:investigators/utils/global.dart';
import 'package:investigators/utils/hex_color.dart';

class BaseView extends StatelessWidget {
  final Widget child;
  final double appBarAdditionalHeight;
  final Widget? appBarBottomWidget;
  final Widget? leading;
  final String? title;
  final IconData? titleIcon;

  const BaseView({
    super.key,
    required this.child,
    this.appBarAdditionalHeight = 0,
    this.appBarBottomWidget,
    this.leading,
    this.title,
    this.titleIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Global.instance.themeColor,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomRight: Radius.circular(100))),
        clipBehavior: Clip.hardEdge,
        leading: leading,
        title: Row(
          children: [
            Icon(titleIcon, size: 40, color: HexColor('#87D0FF')),
            const SizedBox(width: 10),
            Text(title ?? '', style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold))
          ],
        ),
        bottom: PreferredSize(preferredSize: Size.fromHeight(appBarAdditionalHeight), child: appBarBottomWidget ?? const SizedBox()),
      ),
      body: Container(color: Colors.white, child: child),
    );
  }
}
