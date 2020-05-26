import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:micro_flutter/micro/common/dao/subject_dao.dart';
import 'package:micro_flutter/micro/model/subject.dart';
import 'package:micro_flutter/micro/model/wallpaper.dart';

class PictureBrowserPage extends StatefulWidget {
  final Subject subject;
  static const route_name = "picture_browser";

  PictureBrowserPage({Key key, this.subject}) : super(key: key);

  @override
  _PictureBrowserState createState() => _PictureBrowserState(subject);
}

class _PictureBrowserState extends State<PictureBrowserPage> {
  List<Wallpaper> _papers = [];
  Subject _subject;

  _PictureBrowserState(this._subject);

  @override
  void initState() {
    super.initState();
    SubjectDao.getSubjectWallpapers(_subject.id).then((it) {
      setState(() {
        _papers = it;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_subject.name)),
      body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, crossAxisSpacing: 5, mainAxisSpacing: 5),
          itemBuilder: (context, index) {
            return _buildCard(index);
          },
          itemCount: _papers.length),
    );
  }

  Card _buildCard(int index) {
    return Card(
      elevation: 4,
      child: Stack(
        children: <Widget>[
          Container(
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(_papers[index].url),
              ),
            ),
          ),
          Material(
              type: MaterialType.transparency, child: InkWell(onTap: () {})),
        ],
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    );
  }
}
