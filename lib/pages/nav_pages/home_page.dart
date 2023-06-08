import 'package:flutter/material.dart';
import 'package:trip_finder/misc/colors.dart';
import 'package:trip_finder/widgets/app_large_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
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
          SizedBox(height: 40),
          //discover text
          Container(
            margin: const EdgeInsets.only(left: 20),
            child: AppLargeText(text: "Discover")
          ),
          SizedBox(height: 20),
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