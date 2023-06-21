import 'package:flutter/material.dart';

import 'package:quickpark/helper/constants.dart';

class ParkBlock extends StatefulWidget {
 // final Color colorBack;
//  final Color colorFore;
  final String number;
   Color color=Colors.blue;
  final ValueChanged<Color>? onColorChanged;



   ParkBlock(
      {Key? key,
     //   required this.colorBack,
      //  required this.colorFore,
        required this.color,
        required this.number,
        required this.onColorChanged,
      })
      : super(key: key);

  @override
  State<ParkBlock> createState() => _ParkBlockState();
}

class _ParkBlockState extends State<ParkBlock> {
  Color _blockColor = Colors.blue;
  @override
  void initState() {
    super.initState();
    _blockColor = widget.color;}

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _blockColor = _blockColor == Colors.blue ? Colors.red : Colors.blue;
            if (widget.onColorChanged != null) {
              debugPrint("Color changed to $_blockColor");
              widget.onColorChanged!(_blockColor);
            }
          });
        },
        child: Container(

        color: widget.color,

          child: Center(
            child: Text(

              widget.number,
            ),
          ),

          margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 3.0),

        ),
      ),
    );
  }
}