import 'package:flutter/material.dart';

class CustomScrollViewScreen extends StatelessWidget {
  const CustomScrollViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody,
    );
  }

  Widget get _buildBody{
    return CustomScrollView(
      slivers: [
        _buildSliverAppBar,

      ],
    );
  }

  Widget get _buildSliverAppBar{
    return const SliverAppBar(
      title: Text("rean code"),
      centerTitle: true,
    );
  }
}





























