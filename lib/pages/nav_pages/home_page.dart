import 'package:flutter/material.dart';
import 'package:trip_finder/misc/colors.dart';
import 'package:trip_finder/widgets/app_large_text.dart';
import 'package:trip_finder/widgets/app_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  var exploreImgs = [
    "kayaking.png",
    "balloning.png",
    "hiking.png",
    "snorkling.png"
  ];
  var explrText = [
    "Kayaking",
    "Balloning",
    "Hiking",
    "Snorkling"
  ];

  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 70, left: 20),
            child: Row(              
              children: [
                Icon(Icons.menu, size: 30, color: Colors.black54),
                Expanded(child: Container()),
                Container(
                  margin: const EdgeInsets.only(right: 20),
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.withOpacity(0.5)
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 20),
          //discover text
          Container(
            margin: const EdgeInsets.only(left: 20),
            child: AppLargeText(text: "Discover")
          ),
          SizedBox(height: 16),
          //tabbar
          Container(
            child: Align(
              alignment: Alignment.centerLeft,
              child: TabBar(
                labelPadding: const EdgeInsets.only(left: 20, right: 20),
                controller: _tabController,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                isScrollable: true,
                indicatorSize: TabBarIndicatorSize.label,
                indicator: CircleTabIndicator(color: AppColors.mainColor, radius: 4),
                dividerColor: Colors.transparent,
                tabs: const [
                  Tab(text: "Places"),
                  Tab(text: "Inspirtation"),
                  Tab(text: "Emotions")
                ],
              ),
            )
          ),
          Container(
            padding: const EdgeInsets.only(left: 20),
            height: 300,
            width: double.maxFinite,
            child: TabBarView(
              controller: _tabController,
              children: [
                ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: const EdgeInsets.only(right: 10, top: 10),
                      width: 200,
                      height: 300,
                      decoration: BoxDecoration (
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        image: DecorationImage(
                          image: AssetImage("img/mountain.jpeg"),
                          fit: BoxFit.cover
                        ),
                      ),
                    );
                  },
                ),
                Text("Hiiiiisfd!!!"),
                Text("Hiiiiiffddd!!!"),
              ]
            ),
          ),
          SizedBox(height: 20),
          Container(
            margin: const EdgeInsets.only(left: 20, right: 30),
            child: Row(
              children: [
                AppLargeText(text: "Explore more", size: 20),
                Expanded(child: Container()),
                AppText(text: "See all", color: AppColors.textColor1,)
              ],
            ),
          ),
          SizedBox(height: 10),
          Container(
            margin: const EdgeInsets.only(left: 30),
            height: 120,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              itemBuilder:  (BuildContext context, int index) {
                return Container(
                  margin: const EdgeInsets.only(right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        // margin: const EdgeInsets.only(right: 30),
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: AppColors.mainTextColor.withOpacity(0.4),
                          image: DecorationImage(
                              image: AssetImage("img/"+exploreImgs[index]),
                              fit: BoxFit.cover
                            ),
                          )
                        ),
                        SizedBox(height: 5),
                        Container(
                          child: AppText(text: explrText[index], color: AppColors.textColor1)
                        )
                    ],
                  ),
                );
              }
            ),
          )
        ],
      )
    );
  }
}

class CircleTabIndicator extends Decoration {
  final Color color;
  double radius;

  CircleTabIndicator({required this.color, required this.radius});
  
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CirclePainter(color: color, radius: radius);
  }  
}

class _CirclePainter extends BoxPainter {
  final Color color;
  double radius;

  _CirclePainter({required this.color, required this.radius});

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {

    Paint _paint = Paint();
    _paint.color = color;
    // _paint.isAntiAlias = true;
    final Offset circleOffset = Offset(configuration.size!.width/2 - radius / 2, 
      configuration.size!.height - radius);
    canvas.drawCircle(offset+circleOffset, radius, _paint);
  }    
}