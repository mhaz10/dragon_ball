import 'package:dragon_ball/core/utils/styles.dart';
import 'package:flutter/material.dart';

class ExpandedText extends StatefulWidget {
  final String text;
  const ExpandedText({super.key, required this.text});

  @override
  State<ExpandedText> createState() => _ExpandedTextState();
}

class _ExpandedTextState extends State<ExpandedText> {
  String? firstHalf;
  String? secondHalf;
  bool flag = true;

  @override
  void initState() {
    super.initState();

    if (widget.text.length > 100) {
      firstHalf = widget.text.substring(0, 50);
      secondHalf = widget.text.substring(51, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: flag?  firstHalf!.length.toDouble()+30 : widget.text.length.toDouble(),
      child: Column(
        children: [
          secondHalf == '' ? Text(firstHalf!, style: Styles.textStyle16,) : Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                flag ? Text( firstHalf!,  style: Styles.textStyle16,) : Expanded(child: Text(widget.text,  style: Styles.textStyle16,)),
                SizedBox(height: 5,),
                InkWell(
                  onTap: () {
                    setState(() {
                      flag = !flag;
                    });
                  },
                  child: Row(
                    children: [
                      Text(flag ? 'Show More' : 'Show Less', style: Styles.textStyle14,),
                      Icon(flag ? Icons.arrow_drop_down_outlined : Icons.arrow_drop_up_outlined , color: Colors.amber)
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
