import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> buildList = [
    'Krong Bade',
    'Bolon',
    'Gadang',
    'Selaso Jatuh Kembar',
    'Rumah Atap Limas Potong',
    'Bubungan Lima',
    'Panggung',
    'Rumah Nuwo Sesat',
    'Rumah Limas',
    'Rumah Rakit',
    'Rumah Baduy',
    'Rumah Kebaya',
    'Rumah Kasepuhan',
    'Rumah Joglo',
    'Rumah Panjang',
    'Rumah Lamin',
    'Rumah Bubungan Tinggi',
    'Rumah Betang',
    'Rumah Baloy',
    'Rumah Dulohupa',
    'Rumah Souraja',
    'Rumah Buton',
    'Rumah Adat Tongkonan',
    'Rumah Gapura Candi Bentar',
    'Rumah Boyang',
    'Rumah Walewangko',
    'Rumah Musalaki',
    'Rumah dalam Loka',
    'Rumah Baileo',
    'Rumah Sasasu',
    'Rumah Mod Aki Aksa',
    'Rumah Adat Joglo',
    'Rumah Honai',
  ];
  List<String>? foodListSearch;
  final FocusNode _textFocusNode = FocusNode();
  TextEditingController? _textEditingController = TextEditingController();
  @override
  void dispose() {
    _textFocusNode.dispose();
    _textEditingController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.blue.shade300,
            title: Container(
              decoration: BoxDecoration(
                  color: Colors.blue.shade200,
                  borderRadius: BorderRadius.circular(20)),
              child: TextField(
                controller: _textEditingController,
                focusNode: _textFocusNode,
                cursorColor: Colors.black,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    hintText: 'Search here',
                    contentPadding: EdgeInsets.all(8)),
                onChanged: (value) {
                  setState(() {
                    foodListSearch = buildList
                        .where(
                            (element) => element.contains(value.toLowerCase()))
                        .toList();
                    if (_textEditingController!.text.isNotEmpty &&
                        foodListSearch!.length == 0) {
                      print('buildListSearch length ${foodListSearch!.length}');
                    }
                  });
                },
              ),
            )),
        body: _textEditingController!.text.isNotEmpty &&
                foodListSearch!.length == 0
            ? Center(
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.search_off,
                          size: 160,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'No results found,\nPlease try different keyword',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : ListView.builder(
                itemCount: _textEditingController!.text.isNotEmpty
                    ? foodListSearch!.length
                    : buildList.length,
                itemBuilder: (ctx, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        CircleAvatar(
                          child: Icon(Icons.food_bank),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(_textEditingController!.text.isNotEmpty
                            ? foodListSearch![index]
                            : buildList[index]),
                      ],
                    ),
                  );
                }));
  }
}
