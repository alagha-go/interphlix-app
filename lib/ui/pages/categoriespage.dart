import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interphlix/api/categories.dart';
import 'package:interphlix/main.dart';
import 'package:interphlix/objects/category.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        color: myTheme.value.primaryColor,
        height: double.infinity,
        child: FutureBuilder<List<Category>>(
          future: getCategories(),
          builder:
              (BuildContext context, AsyncSnapshot<List<Category>> snapshot) {
            if (snapshot.hasData) {
              return Container(
                color: myTheme.value.primaryColor,
                width: double.infinity,
                child: ListView(
                  children: List.generate(snapshot.data!.length, (index) {
                    return Container(
                      color: myTheme.value.primaryColor,
                      child: Card(
                        elevation: 10,
                        color: myTheme.value.secondaryColor,
                        child: InkWell(
                          child: Container(
                            height: 70,
                            width: MediaQuery.of(context).size.width * 0.8,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                "${snapshot.data![index].type}",
                                style: TextStyle(
                                  color: myTheme.value.primaryColor,
                                  fontSize: 30,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(
                  color: myTheme.value.actionColor,
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
