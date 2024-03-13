import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<String> infos = [
    '『ちいかわらんど TOKYO Station』リニューアルオープン記念🎉',
    '『ハチさんマスコット(ちいかわ/ハチワレ/うさぎ)』',
    '『まじかるちいかわストア』',
    // 可以添加更多的资料
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(242, 242, 242, 242),
      appBar: AppBar(
        title: Text('Chiikawa Home Page'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Align(
          alignment: Alignment.topCenter,
          child: Column(
            children: [
              HeadPic(),
              SizedBox(height: 10),
              ListView.builder(
                shrinkWrap: true,
                itemCount: infos.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Info(data: infos[index]),
                      SizedBox(height: 10),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Info extends StatelessWidget {
  final String data;

  const Info({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: 360,
      height: 145,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Text(data),
                SizedBox(height: 10),
                Row(
                  children: [
                    Image.network(
                      'https://www.chiikawa-info.jp/chiikawaland/tokyo/img/main_02.jpg',
                      width: 78,
                      height: 109,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(width: 10),
                    Image.network(
                      'https://www.chiikawa-info.jp/chiikawaland/tokyo/img/main_02.jpg',
                      width: 78,
                      height: 109,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(width: 10),
                    Image.network(
                      'https://www.chiikawa-info.jp/chiikawaland/tokyo/img/main_02.jpg',
                      width: 78,
                      height: 109,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(width: 10),
                    Image.network(
                      'https://www.chiikawa-info.jp/chiikawaland/tokyo/img/main_02.jpg',
                      width: 78,
                      height: 109,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(width: 10),
                    Image.network(
                      'https://www.chiikawa-info.jp/chiikawaland/tokyo/img/main_02.jpg',
                      width: 78,
                      height: 109,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class HeadPic extends StatelessWidget {
  const HeadPic({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          color: Colors.white,
          width: 360,
          height: 272,
        ),
        Positioned(
          top: 0,
          child: Image.network(
              'https://www.chiikawa-info.jp/chiikawaland/tokyo/img/main_02.jpg',
              width: 360,
              height: 180,
              fit: BoxFit.cover),
        ),
        Positioned(
          top: 151,
          right: 151,
          child: Container(
            width: 57,
            height: 57,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Image.network(
                'https://pbs.twimg.com/profile_images/1762710167614017536/MMn4pafo_400x400.jpg',
                width: 57,
                height: 57,
                fit: BoxFit.cover),
          ),
        ),
        Positioned(
          top: 208,
          child: Container(
            // Adjust width as needed
            child: Text(
              'ちいかわグッズ案内',
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Positioned(
          top: 225,
          child: Container(
            child: Text(
              '非公式アカウントです。グッズ発売日などの最新情報。',
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ],
    );
  }
}
