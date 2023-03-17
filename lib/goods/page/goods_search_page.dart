import 'package:flutter/material.dart';
import 'package:manager_app/util/toast_utils.dart';
import 'package:manager_app/widgets/search_bar.dart';

class GoodsSearchPage extends StatefulWidget {
  const GoodsSearchPage({super.key});

  @override
  _GoodsSearchPageState createState() => _GoodsSearchPageState();
}

class _GoodsSearchPageState extends State<GoodsSearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchBar(
        hintText: '请输入商品名称查询',
        onPressed: (text) => Toast.show('搜索内容：$text'),
      ),
      body: Container(),
    );
  }
}
