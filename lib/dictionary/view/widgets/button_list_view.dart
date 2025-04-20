import 'package:flutter/material.dart';
import 'package:mikhail_samuel/core/constets.dart';
import 'package:mikhail_samuel/core/utils/app_text_styles.dart';

class ButtonListView extends StatelessWidget {
  const ButtonListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: buttonLabels.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: SizedBox(
              width: 300, // زود العرض لو الكلام طويل
              height: 50,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  buttonLabels[index],
                  style: TextStyles.bold28,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
