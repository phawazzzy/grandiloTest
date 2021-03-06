import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grabdilo_test/weather.dart';
// import 'package:cuberto_bottom_bar/cuberto_bottom_bar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

//      title: 'Flutter Demo',
//      theme: ThemeData(
//        primarySwatch: Colors.blue,
//      ),
      home: DefaultTabController(length: 4, child: Home()),
    );
  }

  // void setState(Null Function() param0) {}
}

class TabContent {
  String title;
  Widget content;
  TabContent({this.title, this.content});
}

int _currentIndex = 1;

List<TabContent> tabContent = [
  TabContent(
      title: 'main content',
      content: Center(
        child: Text('GRANDILO',
            style: TextStyle(
                color: Colors.blueAccent,
                fontSize: 50,
                fontWeight: FontWeight.bold)),
      )),
  TabContent(
    title: 'content 1',
    content: Custom(),
  ),
  TabContent(
    title: 'content 2',
    content: LagosWeather(),
  ),
  TabContent(
      title: 'content 3',
      content: Center(
        child: Icon(Icons.settings)
      )),
];

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}


//this is the home which houses the BTNABAR
class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(tabContent[_currentIndex].title),
      // ),
      body: tabContent[_currentIndex].content,
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: true,
        type: BottomNavigationBarType.fixed,
        // selectedItemColor: Colors.red,
        backgroundColor: Colors.white,
        iconSize: 30.0,
        onTap: (index) {
          setState(
            () {
              _currentIndex = index;
            },
          );
        },
        currentIndex: _currentIndex,
        items: [
          new BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('home'),
            backgroundColor: Colors.blue,
          ),
          new BottomNavigationBarItem(
            icon: Icon(
              Icons.format_list_bulleted,
              color: Colors.pinkAccent,
            ),
            title: Text(
              'Transaction',
              style: TextStyle(color: Colors.pinkAccent),
            ),
            backgroundColor: Colors.red.withBlue(200),
          ),
          new BottomNavigationBarItem(
            icon: Icon(Icons.insert_chart),
            title: Text('weather'),
            backgroundColor: Colors.pink,
          ),
          new BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: Text('settings'),
            backgroundColor: Colors.red,
          ),
        ],
      ),
    );
  }
}

const kDefaultPadding = 24.0;

class Custom extends StatefulWidget {
  static bool showPreviewBanner = true;

  @override
  _CustomState createState() => _CustomState();
}

class _CustomState extends State<Custom> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SafeArea(
        left: false,
        right: false,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 16,
            ),
            Center(
              child: Text(
                'Transactions',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: Row(
                children: <Widget>[
                  Text(
                    'Sort by:',
                    style: TextStyle(
                        color: Colors.black54, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    padding: const EdgeInsets.all(4),
                    width: 160,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey.shade300,
                    ),
                    child: Row(
                      children: <Widget>[
                        // Switch(value: null, onChanged: null,),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30)),
                            alignment: Alignment.center,
                            child: Text('Sum'),
                          ),
                        ),
                        Expanded(
                          child: Center(child: Text('Date')),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Container(
                    width: 90,
                    height: 40,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30)),
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Filters'),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.5),
                        ),
                        Icon(Icons.filter_list)
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(
                      horizontal: kDefaultPadding, vertical: 12),
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return Container(
                        child: Column(
                      children: <Widget>[
                        CustomListItem(
                          thumbnail: CircleAvatar(
                            backgroundColor:
                                Colors.green.withBlue(170).withOpacity(0.3),
                            maxRadius: 30,
                            child: Icon(
                              Icons.send,
                              color: Colors.green.withBlue(170),
                              size: 40,
                            ),
                          ),
                          title: 'Tickets to Berlin (BNZ)',
                          subtitle: '25.11.2019',
                          trailingText: '-210 \€',
                        ),
                        CustomListItem(
                          thumbnail: CircleAvatar(
                            backgroundColor:
                                Colors.yellowAccent.withOpacity(0.3),
                            maxRadius: 30,
                            child: Icon(
                              Icons.shopping_basket,
                              color: Colors.yellow,
                              size: 40,
                            ),
                          ),
                          title: 'Monday Groceries',
                          subtitle: '25.11.2019',
                          trailingText: '-132 \€',
                        ),
                        CustomListItem(
                          thumbnail: CircleAvatar(
                            backgroundColor:
                                Colors.purpleAccent.withOpacity(0.3),
                            maxRadius: 30,
                            child: Icon(
                              Icons.home,
                              color: Colors.purpleAccent,
                              size: 40,
                            ),
                          ),
                          title: 'Recurrent and payment',
                          subtitle: '25.11.2019',
                          trailingText: '-112 \€',
                        ),
                        CustomListItem(
                          thumbnail: CircleAvatar(
                            backgroundColor: Colors.lightBlue.withOpacity(0.3),
                            maxRadius: 30,
                            child: Icon(
                              Icons.fastfood,
                              color: Colors.lightBlue,
                              size: 40,
                            ),
                          ),
                          title: 'Wednesday Launch',
                          subtitle: '25.11.2019',
                          trailingText: '  -63 \€',
                        ),
                        CustomListItem(
                          thumbnail: CircleAvatar(
                            backgroundColor: Colors.green.withOpacity(0.3),
                            maxRadius: 30,
                            child: Icon(
                              Icons.shopping_basket,
                              color: Colors.green,
                              size: 40,
                            ),
                          ),
                          title: 'Tickets to Berlin (BNZ)',
                          subtitle: '25.11.2019',
                          trailingText: '-200 \€',
                        ),
                      ],
                    ));
                    // CustomListItem(
                    //   thumbnail: CircleAvatar(
                    //     backgroundColor: Colors.green.withOpacity(0.3),
                    //     maxRadius: 30,
                    //     child: Icon(
                    //       Icons.shopping_basket,
                    //       color: Colors.green,
                    //       size: 40,
                    //     ),
                    //   ),
                    //   title: 'Tickets to Berlin (BNZ)',
                    //   subtitle: '25.11.2019',
                    //   trailingText: '-200 \$',
                    // );
                  }),
            )
          ],
        ),
      ),
    );
  }
}

class CustomListItem extends StatelessWidget {
  CustomListItem({
    Key key,
    this.elevation = 0,
    this.thumbnailAspectRatio = 0.7,
    this.thumbnail,
    this.title,
    this.subtitle,
    this.trailingText,
  }) : super(key: key);

  final double elevation;
  final double thumbnailAspectRatio;
  final Widget thumbnail;
  final String title;
  final String subtitle;
  final String trailingText;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 2,
        color: Colors.white,
        child: Container(
          height: 95,
          child: Row(
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 18, top: 14, bottom: 14),
                child: thumbnail,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(15.0, 25.0, 2.0, 20),
                  child: _ArticleDescription(
                    title: title,
                    subtitle: subtitle,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(15),
                margin: const EdgeInsets.only(left: 25),
                height: double.infinity,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                    color: Colors.green.withBlue(170)),
                child: Text(
                  trailingText,
                  style: theme.textTheme.caption.copyWith(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ArticleDescription extends StatelessWidget {
  _ArticleDescription({
    Key key,
    this.title,
    this.subtitle,
  }) : super(key: key);

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          '$title',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          // ignore: deprecated_member_use
          style: theme.textTheme.subhead.copyWith(
            fontWeight: FontWeight.w900,
          ),
        ),
        const Padding(padding: EdgeInsets.only(bottom: 3.0)),
        Text('$subtitle',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: theme.textTheme.body1.copyWith(color: Colors.black45)),
      ],
    );
  }
}

