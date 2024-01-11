import 'package:flutter/material.dart';

class SearchBarWidget extends StatefulWidget {
   const SearchBarWidget({required this.callback, super.key});

  final Function(String) callback; //다른 함수에 의해 호출되는 함수 (사용자가 검색버튼을 눌렀을 때 호출되어야 하는 함수
   // -> 부모 위젯 즉 메인페이지에서 searchItem이 제공되고 자식 위젯 즉 SearchBarWidget에서는 searchItem을 onSearch로(callback)으로 호출한다.
   //부모 위젯인 MainPage에서 searchItem 함수를 정의하고, 이 함수를 SearchBarWidget의 onSearch 콜백으로 전달하는 것

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
            widget.callback(controller.text);
            //stateless: SearchBarWidget 내부에서 onSearch 콜백 함수를 직접 사용 -> 재사용 불가능. 부모로부터 전달된 콜백 함수를 사용하거나, 상태 관리가 필요 없는 단순한 UI 요소를 구현하는 데 사용
            //stateful: 외부에서 onSearch 콜백 함수를 제공받아 사용 = 부모 위젯에서 전달된 콜백 함수를 참조 -> 재사용 가능
            //StatelessWidget는 불변(immutable)하고 상태가 없는 위젯이기 때문에 내부에 상태를 가지고 있지 않음. 따라서 widget 키워드를 사용하여 속성에 접근하는 것이 불가능.
          },
        ),
      ),
    );
  }
}
