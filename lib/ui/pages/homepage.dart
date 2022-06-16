import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interphlix/api/movies.dart';

import '../../main.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double trendingWidth = screenWidth * 0.7;
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
              return ListView.builder(
                  shrinkWrap: true,
                  itemCount: dataHolder.value.recommendation.departments.length,
                  itemBuilder: (context, i) {
                    if (dataHolder
                            .value.recommendation.departments[i].movies.length <
                        1) {
                      return Container();
                    }
                    return Container(
                      height: (i == 0) ? screenHeight * 0.5 : 300,
                      child: Column(
                        mainAxisAlignment: (i != 0)
                            ? MainAxisAlignment.start
                            : MainAxisAlignment.center,
                        crossAxisAlignment: (i != 0)
                            ? CrossAxisAlignment.start
                            : CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: (i != 0)
                                ? EdgeInsets.all(10)
                                : EdgeInsets.all(0),
                            child: (i != 0)
                                ? Text(
                                    "${dataHolder.value.recommendation.departments[i].title}",
                                    style: TextStyle(
                                      color: myTheme.value.secondaryColor,
                                      fontSize: 20,
                                    ),
                                  )
                                : null,
                          ),
                          Container(
                            height: (i == 0) ? (screenHeight * 0.4) - 50 : 250,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemCount: dataHolder.value.recommendation
                                    .departments[i].movies.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: InkWell(
                                      child: Card(
                                        child: Container(
                                          height: (i == 0) ? 300 : 240,
                                          width: (i == 0) ? trendingWidth : 140,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: myTheme.value.primaryColor,
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                "${dataHolder.value.recommendation.departments[i].movies[index].imageUrl}",
                                              ),
                                              fit: BoxFit.cover,
                                              filterQuality: FilterQuality.high,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                          ),
                        ],
                      ),
                    );
                  }
                  // child: Column(
                  //   children: List.generate(
                  //       dataHolder.value.recommendation.departments.length, (i) {
                  //     return Container(
                  //       height: 300,
                  //       child: (dataHolder.value.recommendation.departments[i]
                  //                   .movies.length >
                  //               1)
                  //           ? Column(
                  //             mainAxisAlignment: MainAxisAlignment.start,
                  //             crossAxisAlignment: CrossAxisAlignment.start,
                  //               children: [
                  //                 Container(
                  //                   margin: EdgeInsets.all(10),
                  //                   child: (i != 0)
                  //                       ? Text(
                  //                           "${dataHolder.value.recommendation.departments[i].title}",
                  //                           style: TextStyle(
                  //                               color:
                  //                                   myTheme.value.secondaryColor,
                  //                               fontSize: 20),
                  //                         )
                  //                       : null,
                  //                 ),
                  //                 // Container(
                  //                 //   width: double.infinity,
                  //                 //   child: ListView.builder(
                  //                 //     scrollDirection: Axis.horizontal,
                  //                 //     shrinkWrap: true,
                  //                 //       itemCount: dataHolder
                  //                 //           .value
                  //                 //           .recommendation
                  //                 //           .departments[i]
                  //                 //           .movies
                  //                 //           .length,
                  //                 //       itemBuilder: (context, index) {
                  //                 //         return InkWell(
                  //                 //           child: Container(
                  //                 //             height: (i == 0)
                  //                 //                 ? screenHeight * 0.4
                  //                 //                 : 250,
                  //                 //             width: (i == 0)
                  //                 //                 ? screenWidth * 0.7
                  //                 //                 : 120,
                  //                 //             decoration: BoxDecoration(
                  //                 //               color:
                  //                 //                   myTheme.value.primaryColor,
                  //                 //               image: DecorationImage(
                  //                 //                 image: NetworkImage(
                  //                 //                   "${dataHolder.value.recommendation.departments[i].movies[index].imageUrl}",
                  //                 //                 ),
                  //                 //                 fit: BoxFit.cover,
                  //                 //                 filterQuality:
                  //                 //                     FilterQuality.high,
                  //                 //               ),
                  //                 //             ),
                  //                 //           ),
                  //                 //         );
                  //                 //       }),
                  //                 // )
                  //               ],
                  //             )
                  //           : null,
                  //     );
                  //   }),
                  // children: [
                  // Container(
                  //   height: MediaQuery.of(context).size.height * 0.5,
                  //   width: double.infinity,
                  //   decoration: BoxDecoration(
                  //     color: myTheme.value.primaryColor,
                  //     image: DecorationImage(
                  //       image: NetworkImage(
                  //         "${snapshot.data![0].imageUrl}",
                  //       ),
                  //       fit: BoxFit.cover,
                  //       filterQuality: FilterQuality.high,
                  //     ),
                  //   ),
                  // ),
                  //   Wrap(
                  //     spacing: spacing,
                  //     runSpacing: 5,
                  //     alignment: WrapAlignment.start,
                  //     runAlignment: WrapAlignment.start,
                  //     direction: Axis.horizontal,
                  //     children:
                  //         List.generate(snapshot.data!.length - 1, (index) {
                  //       return InkWell(
                  //         child: ClipRRect(
                  //           borderRadius: BorderRadius.circular(8),
                  //           child: Container(
                  //               height: 200,
                  //               width: 130,
                  //               child: Card(
                  //                 elevation: 10,
                  //                 child: Container(
                  //                   decoration: BoxDecoration(
                  //                     borderRadius: BorderRadius.circular(8),
                  //                     color: myTheme.value.primaryColor,
                  //                   ),
                  //                   child: ClipRRect(
                  //                     borderRadius: BorderRadius.circular(8),
                  //                     child: Image.network(
                  //                       "${snapshot.data![index + 1].imageUrl}",
                  //                       fit: BoxFit.cover,
                  //                       filterQuality: FilterQuality.high,
                  //                     ),
                  //                   ),
                  //                 ),
                  //               )),
                  //         ),
                  //       );
                  //     }),
                  //   )
                  // ],
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