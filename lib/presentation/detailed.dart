import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:share_plus/share_plus.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

ValueNotifier caroselNotifier = ValueNotifier(0);

class Detailed extends StatelessWidget {
  Detailed({super.key});
  List<String> details = [
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQEoqhWRrwwHEX-OkRQUSfC2pzdpy7JeDmTew&usqp=CAU',
    'https://expertphotography.b-cdn.net/wp-content/uploads/2021/11/Color-Blocking-Mae-Mu.jpg',
    'https://images.unsplash.com/photo-1506792006437-256b665541e2?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8Y29sb3IlMjBibG9ja3xlbnwwfHwwfHx8MA%3D%3D'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text("Description"),
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(10),
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.6,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              child: Column(
                children: [
                  ValueListenableBuilder(
                    valueListenable: caroselNotifier,
                    builder: (context, value, child) {
                      return Stack(
                        children: [
                          CarouselSlider(
                            options: CarouselOptions(
                              height: MediaQuery.of(context).size.height * 0.55,
                              viewportFraction: 1,
                              onPageChanged: (index, reason) {
                                caroselNotifier.value = index;
                              },
                            ),
                            items: details.map((i) {
                              return Builder(
                                builder: (BuildContext context) {
                                  return Container(
                                      width: MediaQuery.of(context).size.width,
                                      //margin: EdgeInsets.symmetric(horizontal: 5.0),
                                      decoration: BoxDecoration(
                                          color: Colors.amber,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.55,
                                          fit: BoxFit.cover,
                                          image: NetworkImage(i),
                                        ),
                                      ));
                                },
                              );
                            }).toList(),
                          ),
                          Positioned(
                            bottom: 10,
                            left: MediaQuery.of(context).size.width * 0.4,
                            child: AnimatedSmoothIndicator(
                              effect: const SlideEffect(
                                  spacing: 8.0,
                                  radius: 10.0,
                                  dotWidth: 10.0,
                                  dotHeight: 10.0,
                                  strokeWidth: 1.5,
                                  dotColor: Colors.grey,
                                  activeDotColor: Colors.black),
                              activeIndex: caroselNotifier.value,
                              count: 3,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                  // ClipRRect(
                  //   borderRadius: BorderRadius.circular(20),
                  //   child: Image(
                  //       fit: BoxFit.cover,
                  //       width: MediaQuery.of(context).size.width,
                  //       height: MediaQuery.of(context).size.height * 0.55,
                  //       image: NetworkImage(
                  //           "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQEoqhWRrwwHEX-OkRQUSfC2pzdpy7JeDmTew&usqp=CAU")),
                  // ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(Icons.download_rounded),
                        Icon(Icons.file_copy_outlined),
                        Icon(Icons.favorite_border),
                        Icon(Icons.camera_front_rounded),
                        Icon(Icons.star_border),
                        InkWell(
                            onTap: () async {
                              await Share.share("share");
                            },
                            child: Icon(Icons.share)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.file_copy_outlined,
                    color: Colors.blue,
                  ),
                  Text("1024"),
                  Icon(
                    Icons.favorite_border,
                    color: Colors.blue,
                  ),
                  Text("1020"),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(10)),
                    child: RatingBar.builder(
                      itemSize: 20,
                      initialRating: 3,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, _) => Icon(
                        size: 5,
                        Icons.star,
                        color: Colors.greenAccent,
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    ),
                  ),
                  Text("10"),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "Actor Name",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Indian Actress",
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Icon(
                  Icons.alarm_sharp,
                  color: Colors.grey,
                ),
                Text(
                  "Duration 20 Mins",
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Icon(
                  Icons.wallet,
                  color: Colors.grey,
                ),
                Text(
                  "Total average fees  \u20B99,9999",
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "About",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit.Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
              style: TextStyle(color: Colors.grey),
            )
          ],
        ),
      ),
    );
  }
}
