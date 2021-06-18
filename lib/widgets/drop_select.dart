import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:giasu_vn/common/images.dart';
import 'package:giasu_vn/common/theme/app_colors.dart';
import 'package:giasu_vn/data_off/provincial_subject.dart';

class DropSelect extends StatefulWidget {
  final List<dynamic> list;
  // final void Function(String) onTap;
  final GestureTapCallback onTap;

  const DropSelect({Key key, this.list, this.onTap}) : super(key: key);

  @override
  _DropSelectState createState() => _DropSelectState();
}

class _DropSelectState extends State<DropSelect> with SingleTickerProviderStateMixin {
  AnimationController expandController;
  Animation<double> animation;

  bool isShow = false;

  _DropSelectState();

  @override
  void initState() {
    super.initState();
    expandController = AnimationController(vsync: this, duration: Duration(milliseconds: 350));
    animation = CurvedAnimation(
      parent: expandController,
      curve: Curves.fastOutSlowIn,
    );
    _runExpandCheck();
  }

  void _runExpandCheck() {
    if (isShow) {
      expandController.forward();
    } else {
      expandController.reverse();
    }
  }

  @override
  void dispose() {
    expandController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15),
      child: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 17),
            decoration: new BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(color: AppColors.grey747474),
            ),
            child: new Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                      onTap: () {
                        this.isShow = !this.isShow;
                        _runExpandCheck();
                        setState(() {});
                      },
                      child: Text(
                        // _registerController.chooseCity.value ? widget.title :
                        'Chọn tỉnh/thành phố',
                        style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16, color: AppColors.grey747474),
                      )),
                ),
                Align(
                  alignment: Alignment(1, 0),
                  child: SvgPicture.asset(
                    Images.ic_arrow_down,
                  ),
                ),
              ],
            ),
          ),
          SizeTransition(
            axisAlignment: 1.0,
            sizeFactor: animation,
            child: Container(
                height: height * 0.35,
                margin: const EdgeInsets.only(bottom: 10, left: 5, right: 5),
                padding: const EdgeInsets.only(bottom: 10),
                decoration: new BoxDecoration(
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
                  boxShadow: [BoxShadow(blurRadius: 4, color: Colors.black26, offset: Offset(0, 2))],
                  color: Colors.white,
                ),
                child: ListView.builder(
                  itemCount: listDataClass.length,

                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.only(left: 10.0, top: 5, bottom: 5),
                    child: GestureDetector(
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: Container(
                              padding: const EdgeInsets.only(top: 20),
                              decoration: BoxDecoration(
                                border: Border(top: BorderSide(color: Colors.grey[200], width: 1)),
                              ),
                              child: Text(listDataClass[index].ctName,
                                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16, color: AppColors.grey747474), maxLines: 3, textAlign: TextAlign.start, overflow: TextOverflow.ellipsis),
                            ),
                          ),
                        ],
                      ),
                      onTap: () => print(listDataClass[index].ctName),
                    ),
                  ),
                )),
          )
        ],
      ),
    );
  }

}

