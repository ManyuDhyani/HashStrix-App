import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:badges/badges.dart';
import 'package:hashstrix_app/Screens/Account/AccountDetail.dart';
import 'package:hashstrix_app/Screens/CreateBlog/CreateBlog.dart';
import 'package:hashstrix_app/Screens/Home/HomeMain.dart';
import 'package:hashstrix_app/Screens/Notifications/notificationDetail.dart';
import 'package:hashstrix_app/Screens/Trending/TrendingDetails.dart';
import 'package:hashstrix_app/widgets/MainDrawer.dart';

class NavMain extends StatefulWidget {
  NavMain({Key? key}) : super(key: key);

  @override
  State<NavMain> createState() => _NavMainState();
}

class _NavMainState extends State<NavMain> with SingleTickerProviderStateMixin {
  final List<Tab> topNavTabs = <Tab>[
    const Tab(icon: Icon(Icons.home_outlined)),
    const Tab(icon: Icon(Icons.add_comment_outlined)),
    const Tab(icon: Icon(Icons.trending_up_outlined)),
    Tab(
      icon: Badge(
        position: BadgePosition.topEnd(top: -20, end: -5),
        badgeContent:
            Text("4", style: TextStyle(fontSize: 18, color: Colors.white)),
        child: const Icon(Icons.notifications_outlined),
      ),
    ),
    const Tab(icon: Icon(Icons.account_circle_outlined)),
  ];

  late TabController _tabController;

  @override
  void initState() {
    _tabController =
        TabController(length: topNavTabs.length, initialIndex: 0, vsync: this)
          ..addListener(() {
            setState(() {});
          });
    super.initState();
  }

  Future<bool> _onWillPop() async {
    if (_tabController.index == 0) {
      await SystemNavigator.pop();
    }
    Future.delayed(const Duration(milliseconds: 200), () {
      _tabController.index = 0;
    });

    return _tabController.index == 0;
  }

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: const Text(
            'HashStrix',
            style: TextStyle(
              fontFamily: 'Klavika',
              fontSize: 34,
              color: Color(0xFF2b90d9),
            ),
          ),
          actions: [
            Container(
              child: IconButton(
                icon: const Icon(Icons.search),
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onPressed: () {
                  print("Search button is pressed");
                },
              ),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey[300],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10.0),
              child: IconButton(
                icon: const Icon(Icons.menu),
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onPressed: () {
                  _scaffoldKey.currentState?.openEndDrawer();
                },
              ),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey[300],
              ),
            )
          ],
          bottom: TabBar(
            controller: _tabController,
            indicatorColor: Colors.black,
            tabs: topNavTabs,
          ),
        ),
        endDrawer: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          child: MainDrawer(),
        ),
        body: TabBarView(controller: _tabController, children: [
          HomeMain(),
          CreateBlog(),
          TrendingDetails(),
          NotificationDetail(),
          AccountDetail(),
        ]),
      ),
    );
  }
}
