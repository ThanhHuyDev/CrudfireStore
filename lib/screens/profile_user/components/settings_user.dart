import 'package:flutter/material.dart';
import '../../../utils/sizeconfig.dart';

class SettingsUser extends StatefulWidget {
    SettingsUser({Key? key,this.name,this.title}) : super(key: key);
   String? name;
   String? title;

  @override
  State<SettingsUser> createState() => _SettingsUserState(name: name,title: title);
}

class _SettingsUserState extends State<SettingsUser> {
   String? name;
   String? title;
  _SettingsUserState({this.name,this.title});
  RangeValues values = const RangeValues(0, 100);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: getsizeHeight(90),
      padding: EdgeInsets.symmetric(
          horizontal: getsizeWidth(10), vertical: getsizeHeight(3)),
      margin: EdgeInsets.symmetric(vertical: getsizeHeight(10)),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 1, color: Colors.black26)),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                name!,
                style: TextStyle(
                    fontSize: getsizeHeight(18),
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              Text(
                title!,
                style: TextStyle(
                    fontSize: getsizeHeight(18),
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
          SliderTheme(
            data: SliderThemeData(
              thumbColor: Colors.deepPurple,
              activeTrackColor: Colors.deepPurple[200],
              trackHeight: getsizeHeight(3) ),
            child: RangeSlider(
              values: values,
              min: 0.0,
              max: 100,
              divisions: 5,
              
              labels: RangeLabels(
                  values.start.round().toString(), values.end.round().toString()),
              onChanged: (newValues) {
                setState(() {
                  values = newValues;
                });
              },
            ),
          )
        ],
      ),
    );
  }
}
