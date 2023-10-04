import 'package:api_with_block/Model/foodResultModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadedPage extends StatelessWidget {
  const LoadedPage({required this.recepie, super.key});
  final List<Recepie> recepie;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        Recepie obj = recepie[index];
        return ListTile(
          leading: Text(obj.id.toString()),
          title: Text(obj.title! ?? 'Its Error but ok'),
          // subtitle: Image.network(obj.image),
        );
      },
    );
  }
}
