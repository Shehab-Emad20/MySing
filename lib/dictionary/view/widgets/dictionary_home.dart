import 'package:flutter/material.dart';
import 'package:mikhail_samuel/core/widgets/search_text_field.dart';
import 'package:mikhail_samuel/dictionary/view/widgets/button_list_view.dart';

class DictionaryHome extends StatelessWidget {
  const DictionaryHome({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(height: 24),
        SearchTextFiield(),
        SizedBox(height: 24), // تأكد من أن هذا الكود مكون صحيح
        Expanded(child: ButtonListView()), // جعل قائمة الأزرار قابلة للتمرير
      ],
    );
  }
}
