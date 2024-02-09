import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:roottest/presentation/detailed.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

ValueNotifier carosel = ValueNotifier(0);

class MeetUp extends StatelessWidget {
  MeetUp({super.key});
  List<String> meeting = [
    'https://www.cityam.com/wp-content/uploads/2022/08/office-work-Jobbio.jpg?resize=960,540',
    'https://burst.shopifycdn.com/photos/business-team-meeting-boardroom.jpg?width=1000&format=pjpg&exif=0&iptc=0',
    'https://www.cityam.com/wp-content/uploads/2022/08/office-work-Jobbio.jpg'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Individual MeetUp"),
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios)),
        ),
        body: ValueListenableBuilder(
          valueListenable: carosel,
          builder: (context, value, _) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                shrinkWrap: true,
                physics: ScrollPhysics(),
                children: [
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.blue)),
                    child: TextFormField(
                      decoration: InputDecoration(
                        enabledBorder: InputBorder.none,
                        labelText: 'Search',
                        prefixIcon: Icon(Icons.search), // Prefix icon
                        suffixIcon: Icon(
                          Icons.mic_none_outlined,
                          color: Colors.blue,
                        ), // Suffix icon
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CarouselSlider(
                    options: CarouselOptions(
                      height: 250,
                      viewportFraction: 1,
                      onPageChanged: (index, reason) {
                        carosel.value = index;
                      },
                    ),
                    items: meeting.map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                              width: MediaQuery.of(context).size.width,
                              //margin: EdgeInsets.symmetric(horizontal: 5.0),
                              decoration: BoxDecoration(
                                  color: Colors.amber,
                                  borderRadius: BorderRadius.circular(10)),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image(
                                  fit: BoxFit.fill,
                                  image: NetworkImage(i),
                                ),
                              ));
                        },
                      );
                    }).toList(),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: AnimatedSmoothIndicator(
                      effect: const SlideEffect(
                          spacing: 8.0,
                          radius: 10.0,
                          dotWidth: 10.0,
                          dotHeight: 10.0,
                          strokeWidth: 1.5,
                          dotColor: Colors.grey,
                          activeDotColor: Colors.black),
                      activeIndex: carosel.value,
                      count: 3,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Trending Popular People",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TreadingPopularPeopleWidget(),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Top Trending MeetUps",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TopTreadingMeetUps()
                ],
              ),
            );
          },
        ));
  }
}

class TreadingPopularPeopleWidget extends StatelessWidget {
  TreadingPopularPeopleWidget({
    super.key,
  });
  final proImages = [
    'https://leadershipcircle.com/wp-content/uploads/2022/07/Tyson-Andrus.png',
    'https://leadershipcircle.com/wp-content/uploads/2022/07/Tyson-Andrus.png',
    'https://leadershipcircle.com/wp-content/uploads/2022/07/Tyson-Andrus.png',
    'https://leadershipcircle.com/wp-content/uploads/2022/07/Tyson-Andrus.png',
    'https://leadershipcircle.com/wp-content/uploads/2022/07/Tyson-Andrus.png',
    'https://leadershipcircle.com/wp-content/uploads/2022/07/Tyson-Andrus.png',
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: MediaQuery.of(context).size.width * 0.8,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: 4,
          itemBuilder: (context, index) {
            return Container(
              width: MediaQuery.of(context).size.width * 0.8,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey)),
              child: Column(
                children: [
                  Container(
                    child: Row(children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(color: Colors.black)),
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.leak_remove_sharp,
                            color: Colors.blueGrey,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Author",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14),
                            ),
                            Text(
                              "10244 members",
                              style: TextStyle(color: Colors.grey),
                            )
                          ],
                        ),
                      )
                    ]),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 07,
                    height: 1,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: Stack(
                      clipBehavior: Clip.hardEdge,
                      alignment: Alignment.center,
                      children: List.generate(6, (index) {
                        return Positioned(
                          left: index * 30.0,
                          child: CircleAvatar(
                            radius: 20,
                            backgroundImage: NetworkImage(proImages[index]),
                          ),
                        );
                      }),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          onPressed: () {},
                          child: Text(
                            "See more",
                            style: TextStyle(color: Colors.white),
                          ))
                    ],
                  )
                ],
              ),
            );
          },
          separatorBuilder: (context, index) {
            return SizedBox(
              width: 20,
            );
          },
          shrinkWrap: true),
    );
  }
}

class TopTreadingMeetUps extends StatelessWidget {
  TopTreadingMeetUps({
    super.key,
  });
  final proImages = [];
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) {
            return Detailed();
          },
        ));
      },
      child: Container(
        height: 260,
        width: MediaQuery.of(context).size.width * 0.5,
        child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: 4,
            itemBuilder: (context, index) {
              return Stack(
                  clipBehavior: Clip.none,
                  fit: StackFit.passthrough,
                  children: [
                    Container(
                        width: MediaQuery.of(context).size.width * 0.5,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.grey)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  'https://img.etimg.com/thumb/msid-52173565,width-640,height-480,imgsize-276756,resizemode-4/meet-indias-youtube-superstars.jpg')),
                        )),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.only(topLeft: Radius.circular(10)),

                          // border: Border.all(color: Colors.black)
                        ),
                        padding: EdgeInsets.all(10),
                        width: 80,
                        height: 80,
                        child: Text(
                          "0${(index + 1).toString()}",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 50,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                  ]);
            },
            separatorBuilder: (context, index) {
              return SizedBox(
                width: 20,
              );
            },
            shrinkWrap: true),
      ),
    );
  }
}
