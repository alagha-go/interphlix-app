import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interphlix/api/movieclass.dart';
import 'package:interphlix/api/movies.dart';

import '../../main.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int crossAxisCount = MediaQuery.of(context).size.width ~/ 130;
    double spacing = (MediaQuery.of(context).size.width % 130) / crossAxisCount;
    return Obx(
      () => Container(
        height: double.infinity,
        color: myTheme.value.primaryColor,
        child: FutureBuilder<List<Movie>>(
          future: getHomeMovies(),
          builder: (BuildContext context, AsyncSnapshot<List<Movie>> snapshot) {
            if (snapshot.hasData) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.5,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: myTheme.value.primaryColor,
                        image: DecorationImage(
                          image: NetworkImage(
                            "${snapshot.data![0].imageUrl}",
                          ),
                          fit: BoxFit.cover,
                          filterQuality: FilterQuality.high,
                        ),
                      ),
                    ),
                    Wrap(
                      spacing: spacing,
                      runSpacing: 5,
                      alignment: WrapAlignment.start,
                      runAlignment: WrapAlignment.start,
                      direction: Axis.horizontal,
                      children:
                          List.generate(snapshot.data!.length - 1, (index) {
                        return InkWell(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Container(
                                height: 200,
                                width: 130,
                                child: Card(
                                  elevation: 10,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: myTheme.value.primaryColor,
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Image.network(
                                        "${snapshot.data![index + 1].imageUrl}",
                                        fit: BoxFit.cover,
                                        filterQuality: FilterQuality.high,
                                      ),
                                    ),
                                  ),
                                )),
                          ),
                        );
                      }),
                    )
                  ],
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

// 0785980967