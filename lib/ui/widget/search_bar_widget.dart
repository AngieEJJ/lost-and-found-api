import 'package:flutter/material.dart';

class SearchBarWidget extends StatefulWidget {
   const SearchBarWidget({required this.onSearch, super.key});

  final Function(String) onSearch;

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: '분실물을 입력하세요',
        border: const OutlineInputBorder(),
        suffixIcon: IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {
            widget.onSearch(controller.text);

           },
        ),
      ),
    );
  }
}
