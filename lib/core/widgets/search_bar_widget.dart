  import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:tunely_app/core/helper/dynamic_size.dart';

class SearchBarWidget extends StatelessWidget {
  final String hint;
  const SearchBarWidget({super.key, required this.hint});

  @override
  Widget build(BuildContext context) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: context.dynamicWidth(0.03), vertical: context.dynamicHeight(0.02)),
    decoration: BoxDecoration(
      color: Colors.grey[100],
      borderRadius: BorderRadius.circular(context.dynamicHeight(0.04))),
      child: Row(
      children: [
        Icon(HugeIcons.strokeRoundedSearch01, color: Colors.grey[600]),
        const SizedBox(width: 10),
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(color: Colors.grey[400]),
              border: InputBorder.none,
              isDense: true,
              contentPadding: EdgeInsets.zero),
              onChanged: (value) {},
            ),
          ),
          const SizedBox(width: 10,),
          const Icon(HugeIcons.strokeRoundedFilter)
        ],
      ),
    );
  }
}
