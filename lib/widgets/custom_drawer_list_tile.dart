import 'package:flutter/material.dart';

class CustomDrawerListTile extends StatelessWidget {
  const CustomDrawerListTile({
    super.key,
    required this.listTileTitle,
    required this.listTileSuffixIcon,
    this.onTap,
  });
  final String listTileTitle;
  final Icon listTileSuffixIcon;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Text(
        listTileTitle,
        style: const TextStyle(
          fontSize: 24.0,
          color: Colors.black,
          fontWeight: FontWeight.w700,
        ),
      ),
      trailing: listTileSuffixIcon, // for puting icons on right
    );
  }
}
