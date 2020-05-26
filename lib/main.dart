import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/material_footer.dart';
import 'package:flutter_easyrefresh/material_header.dart';
import 'package:micro_flutter/micro/common/dao/subject_dao.dart';
import 'package:micro_flutter/micro/model/choice.dart';
import 'package:micro_flutter/micro/model/subject.dart';
import 'package:micro_flutter/micro/pages/picture_browser_page.dart';

void main() => runApp(Micro());

class Micro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        builder: BotToastInit(),
        navigatorObservers: [BotToastNavigatorObserver()],
        home: TestHome(),
        routes: {
          PictureBrowserPage.route_name: (context) => PictureBrowserPage(
              subject: ModalRoute.of(context).settings.arguments),
        });
  }
}

class TestHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TestState();
  }
}

class TestState extends State<TestHome> {
  List<Subject> _subjects = [];
  int offset = 0;

  @override
  void initState() {
    super.initState();
    loadData(true);
  }

  void loadData(bool clear) {
    offset = clear ? 0 : offset + 20;
    SubjectDao.getSubjects(offset).then((value) {
      setState(() {
        if (clear) {
          _subjects.clear();
        }
        _subjects.addAll(value);
      });
    });
  }

  openPictureBrowser(Subject subject) {
    Navigator.pushNamed(context, PictureBrowserPage.route_name,
        arguments: subject);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('萌幻Cos'),
      ),
      body: EasyRefresh(
        header: MaterialHeader(),
        footer: MaterialFooter(),
        child: ListView.builder(
            itemBuilder: (context, index) {
              return _buildCard(index);
            },
            itemCount: _subjects.length),
        onRefresh: () async {
          loadData(true);
        },
        onLoad: () async {
          loadData(false);
        },
      ),
    );
  }

  InkWell _buildCard(int index) {
    return InkWell(
      onTap: () => openPictureBrowser(_subjects[index]),
      child: Card(
        elevation: 4,
        child: Container(
            height: 200,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    image: NetworkImage(_subjects[index].cover),
                    fit: BoxFit.cover))),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
