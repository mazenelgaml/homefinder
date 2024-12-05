// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:homefinder1/utilities/colors.dart';
class ChattingCell extends StatelessWidget {
  const ChattingCell({Key? key, required this.sender, required this.messageText, required this.messageTime, required this.longPress}) : super(key: key);
  final bool sender;
  final String messageText;
  final String messageTime;
  final VoidCallback longPress;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onLongPress: (){
        if(sender){
          longPress();
        }
      },
      child: Container(
        margin: const EdgeInsets.only(top: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment:
              sender? MainAxisAlignment.end : MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [

                Container(
                  padding: const EdgeInsets.all(10),
                  constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width*0.6),

                  decoration: BoxDecoration(
                      color: sender? kGreyColor:kVeryVioletColor ,
                      borderRadius: BorderRadius.only(
                        bottomRight:  Radius.circular(sender? 0 : 12),
                        bottomLeft:  const Radius.circular(16),
                        topRight: Radius.circular(sender ? 12 : 0),
                        topLeft: const Radius.circular(16),
                      )),
                  child: Text(
                      messageText,
                      style: sender?const TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          ): TextStyle(
                        fontSize: 14,
                        color: kDarkBlueColor,
                      )
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Row(
                mainAxisAlignment:
                sender? MainAxisAlignment.end : MainAxisAlignment.start,
                children: [
                  Text(
              messageTime,
                    // DateFormat.jm().format(DateFormat("hh:mm:ss").parse(messageTime)),
                    style:const TextStyle(
                      fontSize: 14,
                      color: Colors.black26,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
