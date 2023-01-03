import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppBarTH extends StatelessWidget implements PreferredSizeWidget {
  final Widget? titleWidget;
  final bool? centerTitle;
  final Widget? leadingWidget;
  final VoidCallback? onTapLeadingWidget;
  final Widget? actionFirst;
  final Widget? actionSecond;

  const AppBarTH({
    Key? key,
    this.titleWidget,
    this.actionFirst,
    this.actionSecond,
    this.centerTitle = true,
    this.leadingWidget,
    this.onTapLeadingWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 80,
      centerTitle: centerTitle,
      elevation: 1,
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      leading: InkWell(
        onTap: onTapLeadingWidget,
        child: leadingWidget ??
            InkWell(
              onTap: context.pop,
              child: const Icon(Icons.arrow_back_ios),
            ),
      ),
      title: titleWidget ?? const Text(""),
      actions: [
        Container(
          margin: const EdgeInsets.only(right: 10),
          child: actionFirst,
        ),
        Container(
          margin: const EdgeInsets.only(right: 10),
          child: actionSecond,
        ),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize =>  const Size.fromHeight(80);
}
