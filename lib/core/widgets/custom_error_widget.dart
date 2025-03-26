import 'package:dragon_ball/core/utils/styles.dart';
import 'package:dragon_ball/core/widgets/custom_image.dart';
import 'package:flutter/material.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({super.key, required this.errorMessage});

  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    return Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            height: 90,
            decoration:  BoxDecoration(
              color: Color(0xFFC72C41),
              borderRadius: BorderRadius.circular(20)
            ),
            child: Row(
              children: [
                const SizedBox(width: 48,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Oh Error', style: Styles.textStyle18,),
                      const Spacer(),
                      Text(errorMessage,  style: Styles.textStyle12, maxLines: 2, overflow: TextOverflow.ellipsis,),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
              bottom: 0,
              left: 4,
              top: 1,
              child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20)
                  ),
                  child: CustomImage(
                    image: 'assets/images/error.png',
                    height: 48, width: 48,))),
          Positioned(
              top: -14,
              right: 2,
              child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: [
                  CustomImage(
                    image: 'assets/images/fail.png',
                    width: 40,
                    height: 40,
                  ),
                  Positioned(
                      top: 10,
                      child: Icon(Icons.close, size: 18,))
                ],
              )),
        ],
      );
  }
}
