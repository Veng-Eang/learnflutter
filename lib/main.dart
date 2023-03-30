import 'package:flutter/material.dart';
import 'package:reancode/constrants/fruit_list_constrant.dart';
import 'package:reancode/custom_scroll.dart';
import 'package:reancode/models/fruit_model.dart';
import 'package:reancode/pages/children_detail_page.dart';

void main(List<String> args) {
  runApp(const MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Home();
  }
}


class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool hideIcon = true;
  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels <
          _scrollController.position.maxScrollExtent) {
        setState(() {
          hideIcon = false;
        });
      } else {
        setState(() {
          hideIcon = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: _buildAppBar(),
        body: _buildBody(context),
        bottomNavigationBar: _bottomNavigationBar(),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return _buildGridView(context);
  }

//============Grid View =========================================================================
  Widget _buildGridView(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 3,
      mainAxisSpacing: 5,
      children: [
        for (int i = 0; i < fruitModel.length; i++) _buildItem(fruitModel[i]),
      ],
    );
  }

  Widget _buildItem(FruitModel item) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ChildrenDetailPage(fruitModel: item),
              ),
            );
          },
          child: Image.network(
            item.image,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
            child: Text(
              item.name,
              style: const TextStyle(
                  fontSize: 20,
                  backgroundColor: Colors.black45,
                  color: Colors.white),
            ))
      ],
    );
  }

//=============Navigation Data to Detail Page =====================================================
  Widget get _listViewBuilderNavigationData2DetailPage {
    return Container(
      alignment: Alignment.center,
      child: ListView.builder(
        itemCount: fruitModel.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: const Icon(Icons.shopping_cart),
              title: Text(fruitModel[index].name),
              subtitle: Text(fruitModel[index].description),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) =>
                        ChildrenDetailPage(fruitModel: fruitModel[index]),
                  ),
                );
              },
              trailing: const Icon(
                Icons.navigate_next,
                size: 40,
              ),
            ),
          );
        },
      ),
    );
  }

//  ==================Build ListViewBuilder======================================================
  Widget get _listViewBuilder {
    return Stack(
      children: [
        _listView,
        Positioned(
          bottom: 20,
          right: 20,
          child: hideIcon ? _iconUp : const SizedBox(),
        )
      ],
    );
  }

  Widget get _iconUp {
    return Container(
      width: 50,
      height: 50,
      color: Colors.white54,
      child: IconButton(
        icon: const Icon(
          Icons.arrow_upward_sharp,
          size: 30,
        ),
        onPressed: () {
          if (_scrollController.hasClients) {
            final position = _scrollController.position.maxScrollExtent;
            _scrollController.animateTo(
              position,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeOutSine,
            );
          }
        },
      ),
    );
  }

  Widget get _listView {
    return Container(
      alignment: Alignment.center,
      child: ListView.builder(
          controller: _scrollController,
          reverse: true,
          itemCount: 50,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            if (index % 2 == 1) {
              return Card(
                child: ListTile(
                  leading: InkWell(
                    onTap: () {},
                    child: Icon(Icons.person),
                  ),
                  title: Text("item $index"),
                  subtitle: Text("this subtitle $index"),
                  trailing: const Icon(Icons.navigate_next),
                ),
              );
            } else {
              return Card(
                child: ListTile(
                  leading: const Icon(
                    Icons.person_off,
                    size: 40,
                  ),
                  title: Text("item $index"),
                  subtitle: Text("this subtitle $index"),
                  trailing: const Icon(Icons.navigate_next),
                ),
              );
            }
          }),
    );
  }

  // if (listScrollController.hasClients) {
  Widget get _buildListView {
    return ListView(
      physics: const BouncingScrollPhysics(),
      reverse: true,
      children: const [
        Card(
          child: ListTile(
            leading: Icon(
              Icons.person,
              size: 40,
            ),
            title: Text("item 1"),
            subtitle: Text("this subtitle 1"),
            trailing: Icon(Icons.navigate_next),
          ),
        ),
        Card(
          child: ListTile(
            leading: Icon(
              Icons.person,
              size: 40,
            ),
            title: Text("item 2"),
            subtitle: Text("this subtitle 2"),
            trailing: Icon(Icons.navigate_next),
          ),
        ),
        Card(
          child: ListTile(
            leading: Icon(
              Icons.person,
              size: 40,
            ),
            title: Text("item 3"),
            subtitle: Text("this subtitle 3"),
            trailing: Icon(Icons.navigate_next),
          ),
        ),
        Card(
          child: ListTile(
            leading: Icon(
              Icons.person,
              size: 40,
            ),
            title: Text("item 4"),
            subtitle: Text("this subtitle 4"),
            trailing: Icon(Icons.navigate_next),
          ),
        ),
        Card(
          child: ListTile(
            leading: Icon(
              Icons.person,
              size: 40,
            ),
            title: Text("item 5"),
            subtitle: Text("this subtitle 5"),
            trailing: Icon(Icons.navigate_next),
          ),
        ),
        Card(
          child: ListTile(
            leading: Icon(
              Icons.person,
              size: 40,
            ),
            title: Text("item 6"),
            subtitle: Text("this subtitle 6"),
            trailing: Icon(Icons.navigate_next),
          ),
        ),
        Card(
          child: ListTile(
            leading: Icon(
              Icons.person,
              size: 40,
            ),
            title: Text("item 7"),
            subtitle: Text("this subtitle 7"),
            trailing: Icon(Icons.navigate_next),
          ),
        ),
        Card(
          child: ListTile(
            leading: Icon(
              Icons.person,
              size: 40,
            ),
            title: Text("item 8"),
            subtitle: Text("this subtitle 8"),
            trailing: Icon(Icons.navigate_next),
          ),
        ),
        Card(
          child: ListTile(
            leading: Icon(
              Icons.person,
              size: 40,
            ),
            title: Text("item 9"),
            subtitle: Text("this subtitle 9"),
            trailing: Icon(Icons.navigate_next),
          ),
        ),
        Card(
          child: ListTile(
            leading: Icon(
              Icons.person,
              size: 40,
            ),
            title: Text("item 10"),
            subtitle: Text("this subtitle 10"),
            trailing: Icon(Icons.navigate_next),
          ),
        ),
        Card(
          child: ListTile(
            leading: Icon(
              Icons.person,
              size: 40,
            ),
            title: Text("item 11"),
            subtitle: Text("this subtitle 11"),
            trailing: Icon(Icons.navigate_next),
          ),
        ),
        Card(
          child: ListTile(
            leading: Icon(
              Icons.person,
              size: 40,
            ),
            title: Text("item 12"),
            subtitle: Text("this subtitle 12"),
            trailing: Icon(Icons.navigate_next),
          ),
        ),
        Card(
          child: ListTile(
            leading: Icon(
              Icons.hardware,
              size: 40,
            ),
            title: Text("item 13"),
            subtitle: Text("this subtitle 13"),
            trailing: Icon(Icons.navigate_next),
          ),
        )
      ],
    );
  }

//  ==============Build AppBar=======================================================================
  AppBar _buildAppBar() {
    return AppBar(
      leading: IconButton(
        onPressed: () => {},
        icon: const Icon(Icons.yard_rounded),
      ),
      backgroundColor: Colors.orange,
      title: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            InkWell(
              onTap: () => {},
              child: const Text("Rean1"),
            ),
            const SizedBox(width: 10),
            InkWell(
              onTap: () => {},
              child: const Text("Code2"),
            ),
            const SizedBox(width: 10),
            InkWell(
              onTap: () => {},
              child: const Text("Sala3"),
            ),
            const SizedBox(width: 10),
            InkWell(
              onTap: () => {},
              child: const Text("Rean4"),
            ),
            const SizedBox(width: 10),
            InkWell(
              onTap: () => {},
              child: const Text("Code5"),
            ),
            const SizedBox(width: 10),
            InkWell(
              onTap: () => {},
              child: const Text("Sala6"),
            ),
            const SizedBox(width: 10),
            InkWell(
              onTap: () => {},
              child: const Text("Rean7"),
            ),
            const SizedBox(width: 10),
            InkWell(
              onTap: () => {},
              child: const Text("Code8"),
            ),
            const SizedBox(width: 10),
            InkWell(
              onTap: () => {},
              child: const Text("Sala9"),
            )
          ],
        ),
      ),
      centerTitle: true,
    );
  }

// ===============Build Banner======================================================================
  Widget get _buildBanner {
    String pic = "https://images.thedirect.com/media/photos/posd1_1.jpg";
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
            height: 600,
            width: 500,
            child: Image.network(
              pic,
              fit: BoxFit.cover,
            )),
        Positioned(
          bottom: 0,
          child: Container(
            height: 150,
            width: 500,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                  Colors.black,
                  Colors.black.withOpacity(0.0),
                ])),
          ),
        ),
        Positioned(
          top: 0,
          child: Container(
            height: 150,
            width: 500,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                  Colors.black,
                  Colors.black.withOpacity(0.0),
                ])),
          ),
        ),
        InkWell(
          onTap: () {
            print("played");
          },
          child: Container(
            width: 100,
            height: 100,
            decoration: const BoxDecoration(
              color: Colors.white38,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.play_arrow,
              size: 70,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  // ========================Stack========================================
  Widget _buildStack() {
    return Container(
      alignment: Alignment.center,
      child: Stack(
        alignment: Alignment.center,
        children: [
          _buildBoX(width: 300, height: 300, color: Colors.orange),
          _buildBoX(),
          Positioned(
            bottom: 20,
            left: 20,
            child: _buildBoX(color: Colors.red),
          ),
          Positioned(
              right: 10,
              bottom: 10,
              child: IconButton(
                  onPressed: () => {}, icon: const Icon(Icons.arrow_circle_up)))
        ],
      ),
    );
  }

  Widget _buildSingleChildScrollView() {
    return Container(
      width: 500,
      // ignore: sort_child_properties_last
      child: SingleChildScrollView(
        child: Column(children: [
          _buildBoX(),
          _buildBoX(width: 100, color: Colors.red),
          _buildBoX(width: 200, height: 200, color: Colors.blue),
          _buildBoX(),
          _buildBoX(width: 300, color: Colors.red),
          _buildBoX(width: 400, height: 200, color: Colors.blue),
          _buildBoX(),
          _buildBoX(width: 500, color: Colors.red),
          _buildBoX(width: 600, height: 200, color: Colors.blue),
          _buildBoX(),
          _buildBoX(width: 700, color: Colors.red),
          _buildBoX(width: 200, height: 200, color: Colors.blue),
          _buildBoX(),
          _buildBoX(width: 200, color: Colors.red),
          _buildBoX(width: 200, height: 200, color: Colors.blue),
        ]),
      ),
      color: Colors.black,
    );
  }

  Widget _buildBoX(
      {double width = 100, double height = 100, Color color = Colors.black}) {
    return Container(
      width: width,
      height: height,
      color: color,
    );
  }

  Widget _bottomNavigationBar() {
    return BottomAppBar(
      color: Colors.orange,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(onPressed: () => {}, icon: const Icon(Icons.home)),
          IconButton(onPressed: () => {}, icon: const Icon(Icons.play_arrow)),
          IconButton(onPressed: () => {}, icon: const Icon(Icons.person)),
          IconButton(onPressed: () => {}, icon: const Icon(Icons.settings))
        ],
      ),
    );
  }
}
