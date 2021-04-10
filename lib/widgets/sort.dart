import 'package:flutter/material.dart';
import 'package:myshop/res/strings.dart';

import 'm_text.dart';
class SortWidget extends StatelessWidget {
  bool isExpanded;

  @override
  Widget build(BuildContext context) {
   return Expanded(
      child: ExpansionPanelList(
        // elevation: 0,
        expansionCallback: (int index, bool isExpanded) {
          setState(() {
            isExpanded = !isExpanded;
          });
        },
        children: [
          ExpansionPanel(
            headerBuilder: (BuildContext context, bool isExpanded) {
              return ListTile(
                hoverColor: Colors.transparent,
                title: MText(
                  text: AppStrings.Sort,
                ),
              );
            },
            body: ListTile(
              title: Text('Item 1 child'),
              subtitle: Text('Details goes here'),
            ),
            isExpanded: false,
          ),
        ],
      ),
    );
  }

  void setState( Function() param0) {

    void Expanded() {
      setState(() {
        isExpanded = !isExpanded;
      });
    }
  }
}
