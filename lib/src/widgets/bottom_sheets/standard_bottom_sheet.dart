// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:flutter_uiux_package/flutter_uiux_package.dart';

class StandardBottomSheet extends StatefulWidget {
  const StandardBottomSheet({
    Key? key,
  }) : super(key: key);

  @override
  _StandardBottomSheetState createState() => _StandardBottomSheetState();
}

class _StandardBottomSheetState extends State<StandardBottomSheet> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.only(top: 28.0, left: 24.0, right: 24.0, bottom: 24.0),
      child: ListView(
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Transfer to cards and\n accounts',
                  style: Theme.of(context).textTheme.headline5),
              GestureDetector(
                onTap: () => UiUxData.navigatorKey!.currentState!.pop(),
                child: Text('X',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    )),
              )
            ],
          ),
          SizedBox(height: 24.0),
          _buildIconTextCheckBox(),
          SizedBox(height: 30.0),
          Text('Cards', style: Theme.of(context).textTheme.headline5),
          SizedBox(height: 6),
          _secondBuildIconTextCheckBox(),
        ],
      ),
    );
  }
}

Widget _buildIconTextCheckBox() {
  return AgnesCheckBoxGroup(
    mainGroupAlignment: MainAxisAlignment.spaceBetween,
    crossGroupAlignment: CrossAxisAlignment.center,
    widgets: _checkBoxContents(),
    values: [true, true],
    padding: EdgeInsets.only(bottom: 12),
    groupType: AgnesGroupType.column,
    onChanged: (selected, index, values) => {
      print(selected),
      print(index),
      print(values),
    },
  );
}

// Row로 할 경우에는 []
Widget _secondBuildIconTextCheckBox() {
  return AgnesCheckBoxTileGroup(
    mainGroupAlignment: MainAxisAlignment.spaceBetween,
    crossGroupAlignment: CrossAxisAlignment.center,
    widgets: _secondCheckBoxContents(),
    //values: [false, false,tru],
    //padding: EdgeInsets.only(top: 12, bottom: 12),
    unTouchablePadding: EdgeInsets.only(bottom: 12),
    groupType: AgnesGroupType.column,
    onChanged: (selected, index, values) => {
      print(selected),
      print(index),
      print(values),
    },
  );
}

List<Widget> _secondCheckBoxContents() {
  return [
    Row(
      children: [
        SvgPicture.asset(
          Assets.card_temp,
          width: 34,
          height: 22,
          color: Colors.amber,
        ),
        SizedBox(width: 24.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Visa',
              style: TextStyle(height: 1.25, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4),
            Text('** 6917',
                style: TextStyle(
                  height: 1.29,
                  fontSize: 14.0,
                  color: Colors.grey[700],
                )),
          ],
        ),
      ],
    ),
    Row(
      children: [
        SvgPicture.asset(
          Assets.card_temp,
          width: 34,
          height: 22,
        ),
        SizedBox(width: 24.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Visa',
              style: TextStyle(height: 1.25, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4),
            Text('** 4552',
                style: TextStyle(
                  height: 1.29,
                  fontSize: 14.0,
                  color: Colors.grey[700],
                )),
          ],
        ),
      ],
    ),
    Row(
      children: [
        SvgPicture.asset(
          Assets.card_temp,
          width: 34,
          height: 22,
          color: Colors.red,
        ),
        SizedBox(width: 24.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Master',
              style: TextStyle(height: 1.25, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4),
            Text('** 1112',
                style: TextStyle(
                  height: 1.29,
                  fontSize: 14.0,
                  color: Colors.grey[700],
                )),
          ],
        ),
      ],
    ),
    Row(
      children: [
        SvgPicture.asset(
          Assets.card_temp,
          width: 34,
          height: 22,
          color: Colors.blueAccent,
        ),
        SizedBox(width: 24.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Master',
              style: TextStyle(height: 1.25, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4),
            Text('** 2234',
                style: TextStyle(
                  height: 1.29,
                  fontSize: 14.0,
                  color: Colors.grey[700],
                )),
          ],
        ),
      ],
    ),
  ];
}

List<Widget> _checkBoxContents() {
  return [
    Row(
      children: [
        Icon(Icons.download_for_offline_rounded, size: 32.0),
        SizedBox(width: 16.0),
        Text('External transfer'),
      ],
    ),
    Row(
      children: [
        Icon(Icons.download_for_offline_rounded, size: 32.0),
        SizedBox(width: 16.0),
        Text('Between my accounts'),
      ],
    ),
  ];
}
