import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interphlix/api/extensions.dart';
import 'package:interphlix/api/movies.dart';

import '../../main.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double trendingWidth = screenWidth * 0.9;
    if (screenWidth > 500) {
      trendingWidth = 300;
    }
    return Obx(
      () => Container(
        height: double.infinity,
        color: myTheme.value.primaryColor,
        child: FutureBuilder<dynamic>(
          future: getHomeMovies(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasData) {
              return SingleChildScrollView(
                key: const PageStorageKey("Departments"),
                physics: ClampingScrollPhysics(),
                controller: dataHolder.value.recommendation.scrollController,
                scrollDirection: Axis.vertical,
                child: Column(
                  children: List.generate(
                      dataHolder.value.recommendation.departments.length,
                      (dindex) {
                    if (dindex == 0) {
                      return Container(
                        child: SingleChildScrollView(
                          key: const PageStorageKey("Movies"),
                          controller: dataHolder.value.recommendation
                              .departments[dindex].scrollController,
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: List.generate(
                                dataHolder.value.recommendation.departments[0]
                                    .movies.length, (index) {
                              scrollListener(
                                  dataHolder.value.recommendation
                                      .departments[dindex].scrollController,
                                  dindex);
                              return Container(
                                margin: EdgeInsets.only(
                                    left: 10, right: 10, bottom: 10),
                                height:
                                    MediaQuery.of(context).size.height * 0.55,
                                width: trendingWidth,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: myTheme.value.primaryColor,
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      "${dataHolder.value.recommendation.departments[dindex].movies[index].imageUrl}",
                                    ),
                                    fit: BoxFit.cover,
                                    filterQuality: FilterQuality.high,
                                  ),
                                ),
                              );
                            }),
                          ),
                        ),
                      );
                    } else {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: (dataHolder.value.recommendation
                                        .departments[dindex].movies.length >
                                    1)
                                ? EdgeInsets.all(10)
                                : EdgeInsets.all(0),
                            child: (dataHolder.value.recommendation
                                        .departments[dindex].movies.length >
                                    1)
                                ? Text(
                                    "${dataHolder.value.recommendation.departments[dindex].title}",
                                    style: TextStyle(
                                      color: myTheme.value.secondaryColor,
                                      fontSize: 22,
                                    ),
                                  )
                                : null,
                          ),
                          Container(
                            height: (dataHolder.value.recommendation
                                        .departments[dindex].movies.length >
                                    1)
                                ? 220
                                : 0,
                            child: (dataHolder.value.recommendation
                                        .departments[dindex].movies.length >
                                    1)
                                ? ListView.builder(
                                    key: PageStorageKey("Movies${dindex}"),
                                    controller: dataHolder.value.recommendation
                                        .departments[dindex].scrollController,
                                    scrollDirection: Axis.horizontal,
                                    shrinkWrap: true,
                                    itemCount: dataHolder.value.recommendation
                                        .departments[dindex].movies.length,
                                    itemBuilder: (context, index) {
                                      scrollListener(
                                          dataHolder
                                              .value
                                              .recommendation
                                              .departments[dindex]
                                              .scrollController,
                                          dindex);
                                      return Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: InkWell(
                                          child: Card(
                                            child: Container(
                                              height: 220,
                                              width: 130,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color:
                                                    myTheme.value.primaryColor,
                                                image: DecorationImage(
                                                  image: NetworkImage(
                                                    "${dataHolder.value.recommendation.departments[dindex].movies[index].imageUrl}",
                                                  ),
                                                  fit: BoxFit.cover,
                                                  filterQuality:
                                                      FilterQuality.high,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    })
                                : null,
                          ),
                        ],
                      );
                    }
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

  scrollListener(ScrollController controller, int index) {
    controller.addListener(() {
      double maxScroll = controller.position.maxScrollExtent;
      double currentScroll = controller.position.pixels;
      double delta = 200.0; // or something else..
      if (maxScroll - currentScroll <= delta) {
        if (index == 0 || index == 2) {
        } else {
          int round = (dataHolder
                      .value.recommendation.departments[index].movies.length ~/
                  20) -
              1;
          String path = "${dataHolder.value.recommendation.departments[index].path}?round=${round}&seed=${dataHolder.value.recommendation.seed}";

          getMoviesExtension(path, index);
        }
      }
    });
  }
}
