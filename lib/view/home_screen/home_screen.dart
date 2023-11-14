import 'package:flutter/material.dart';

import 'package:flutter_application_14/view/home_screen/widgets/bottom_sheet/bottomsheet.dart';
import 'package:flutter_application_14/view/home_screen/widgets/colorlist.dart';

import 'package:flutter_application_14/view/home_screen/widgets/listscreen_widgets/listscreen_widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final namecontroller = TextEditingController();
  final descriptioncontroller = TextEditingController();
  final datecontroller = TextEditingController();
  List<NotModel> mynotmodellist = [
    NotModel(date: "10/4/1999", description: "Gamer", title: "Hari")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF427D9D),
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Color(0xFF164863),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView.builder(
            itemCount: mynotmodellist.length,
            itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: ListscreenWidgets(
                    onTap: () {
                      mynotmodellist.removeAt(index);
                      setState(() {});
                    },
                    title: mynotmodellist[index].title,
                    description: mynotmodellist[index].description,
                    date: mynotmodellist[index].date,
                  ),
                )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            backgroundColor: Color(0xFFDCBFFF),
            context: context,
            builder: (context) =>
                StatefulBuilder(builder: (context, insetState) {
              return Container(
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                        decoration: BoxDecoration(
                            color: Color(0xFF9BBEC8),
                            borderRadius: BorderRadius.circular(18)),
                        child: TextField(
                          controller: namecontroller,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Title',
                            hintStyle:
                                TextStyle(fontSize: 21, color: Colors.black),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                        decoration: BoxDecoration(
                            color: Color(0xFF9BBEC8),
                            borderRadius: BorderRadius.circular(18)),
                        child: TextField(
                          controller: descriptioncontroller,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Descriptiion',
                            hintStyle:
                                TextStyle(fontSize: 21, color: Colors.black),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                        decoration: BoxDecoration(
                            color: Color(0xFF9BBEC8),
                            borderRadius: BorderRadius.circular(18)),
                        child: TextField(
                          controller: datecontroller,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'date',
                            hintStyle:
                                TextStyle(fontSize: 21, color: Colors.black),
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      ElevatedButton(
                          onPressed: () {
                            mynotmodellist.add(NotModel(
                                date: datecontroller.text,
                                description: descriptioncontroller.text,
                                title: namecontroller.text));
                            setState(() {});
                            namecontroller.clear();
                            descriptioncontroller.clear();
                            datecontroller.clear();
                            Navigator.pop(context);
                          },
                          child: Text(
                            "Save",
                            style: TextStyle(fontSize: 24),
                          )),
                      SizedBox(
                        height: 15,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List.generate(
                              MyColor.colorlist.length,
                              (index) => Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: InkWell(
                                        onTap: () {
                                          insetState(() {});
                                        },
                                        child: Container(
                                          height: 30,
                                          width: 30,
                                          decoration: BoxDecoration(
                                              color: MyColor.colorlist[index],
                                              borderRadius:
                                                  BorderRadius.circular(8)),
                                        )),
                                  )),
                        ),
                      )
                    ],
                  ),
                ),
              );
            }),
          );
        },
        child: Icon(
          Icons.add,
          color: Colors.black,
          size: 34,
        ),
        backgroundColor: Color(0xFFDDF2FD),
      ),
    );
  }
}
