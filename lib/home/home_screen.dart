import 'package:flutter/material.dart';
import 'package:simpleflutter/constants.dart';
import 'package:simpleflutter/icons.dart';
import 'conversation_page.dart';

enum ActionItems { GROUP_CHAT, ADD_FRIEND, QR_SCAN, PAYMENT, HELP }

class NavigationIconView {
  final IconData _icon;
  final Color _color;
  final String _title;
  final BottomNavigationBarItem item;

  NavigationIconView({
    IconData icon,
    IconData activeIcon,
    String title,
    Color color,
  })  : _icon = icon,
        _color = color,
        _title = title,
        item = new BottomNavigationBarItem(
          icon: Icon(icon),
          activeIcon: Icon(activeIcon),
          title: Text(title),
          backgroundColor: Colors.white,
        );
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
      PageController _pageController;
  int _currentIndex = 0;
  List<NavigationIconView> _navigationViews;
  List<Widget> _pages;
  void initState() {
    super.initState();
    _navigationViews = <NavigationIconView>[
      NavigationIconView(
          title: '消息',
          icon: SimpleIcons.message_outline,
          activeIcon: SimpleIcons.message,
          color: Colors.white),
      NavigationIconView(
          title: '通讯录',
          icon: SimpleIcons.mailList_outline,
          activeIcon: SimpleIcons.mailList,
          color: Colors.white),
      NavigationIconView(
          title: '发现',
          icon: SimpleIcons.find_outline,
          activeIcon: SimpleIcons.find,
          color: Colors.white),
      NavigationIconView(
          title: '我',
          icon: SimpleIcons.me_outline,
          activeIcon: SimpleIcons.me,
          color: Colors.white),
    ];
    _pageController = PageController(initialPage: _currentIndex);
    _pages = [
      ConversationPage(),
      Container(color: Colors.green,),
      Container(color: Colors.blue,),
      Container(color: Colors.brown,),
    ];
  }

  _buildPopupMenuItem(IconData icon, String title) {
    return Row(
      children: <Widget>[
        Icon(icon,
            size: 22.0, color: Color(AppColors.AppBarPopupMenuTextColor)),
        Container(
          width: 12.0,
        ),
        Text(
          title,
          style: TextStyle(color: Color(AppColors.AppBarPopupMenuTextColor)),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {

    final BottomNavigationBar botNavBar = BottomNavigationBar(
      fixedColor: const Color(AppColors.TanIconActive),
      items: _navigationViews
          .map<BottomNavigationBarItem>(
              (NavigationIconView navigationView) => navigationView.item)
          .toList(),
      currentIndex: _currentIndex,
      type: BottomNavigationBarType.fixed,
      onTap: (int index) {
        setState(() {
          _currentIndex = index;
          _pageController.animateToPage(_currentIndex, duration: Duration(milliseconds: 200), curve: Curves.easeInOut);
        });
      },
    );
    return Scaffold(
      appBar: AppBar(
        title: Text('IM'),
        // elevation: 0,
        actions: <Widget>[
          Container(
            padding: const EdgeInsets.only(right: 16.0),
            child: IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                print('点击率搜索按钮');
              },
            ),
          ),
          PopupMenuButton(
            itemBuilder: (BuildContext content) {
              return <PopupMenuItem<ActionItems>>[
                PopupMenuItem(
                  child: _buildPopupMenuItem(Icons.add, "发起群聊"),
                  value: ActionItems.GROUP_CHAT,
                ),
                PopupMenuItem(
                  child: _buildPopupMenuItem(Icons.add_circle, "添加朋友"),
                  value: ActionItems.ADD_FRIEND,
                ),
                PopupMenuItem(
                  child: _buildPopupMenuItem(Icons.party_mode, "扫一扫"),
                  value: ActionItems.QR_SCAN,
                ),
                PopupMenuItem(
                  child: _buildPopupMenuItem(Icons.payment, "收款码"),
                  value: ActionItems.PAYMENT,
                ),
                PopupMenuItem(
                  child: _buildPopupMenuItem(Icons.help, "帮助与反馈"),
                  value: ActionItems.HELP,
                )
              ];
            },
            icon: Icon(Icons.add),
            onSelected: (ActionItems selected) {
              print('点击的是$selected');
            },
          ),
          Container(
            width: 16.0,
          ),
          // IconButton(
          //   icon: Icon(Icons.add),
          //   onPressed: () {
          //     print("显示下拉列表");
          //   },
          // ),
        ],
      ),
      body: PageView.builder(itemBuilder: (BuildContext content, int index){
        return _pages[index];
      },
      controller: _pageController,
      itemCount: _pages.length,
      onPageChanged: (int index){
        setState(() {
          _currentIndex = index;
        });
      },
      ),
      bottomNavigationBar: botNavBar,
    );
  }
}
