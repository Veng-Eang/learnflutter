import 'package:flutter/material.dart';
import 'package:reancode/constrants/fruit_list_constrant.dart';
import 'package:reancode/models/fruit_model.dart';

class ChildrenDetailPage extends StatefulWidget {
  FruitModel fruitModel;
  ChildrenDetailPage({super.key, required this.fruitModel});

  @override
  State<ChildrenDetailPage> createState() => _ChildrenDetailPageState();
}

class _ChildrenDetailPageState extends State<ChildrenDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar,
      body: _buildBody,
    );
  }

  AppBar get _buildAppBar {
    return AppBar(
      centerTitle: true,
      title: Text(widget.fruitModel.name),
    );
  }

  Widget get _buildBody {
    return Container(
      alignment: Alignment.topCenter,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(15),
              alignment: Alignment.topCenter,
              child: Text(
                widget.fruitModel.name,
                style: const TextStyle(fontSize: 30,),
              ),
            ),
            Container(
              child: Image.network(
                widget.fruitModel.image,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              child: Text(widget.fruitModel.description),
            )
          ],
        ),
      ),
    );
  }
}
