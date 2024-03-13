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
  final List<Map<String, dynamic>> infos = [
    {
      'text': '『ちいかわらんど TOKYO Station』リニューアルオープン記念🎉',
      'imageUrls': [
        'https://www.chiikawa-info.jp/chiikawaland/tokyo/img/main_02.jpg',
      ],
    },
    {
      'text': '『ハチさんマスコット(ちいかわ/ハチワレ/うさぎ)』',
      'imageUrls': [
        'https://www.chiikawa-info.jp/chiikawaland/tokyo/img/main_02.jpg',
        'https://www.chiikawa-info.jp/chiikawaland/tokyo/img/main_02.jpg',
        'https://www.chiikawa-info.jp/chiikawaland/tokyo/img/main_02.jpg',
        'https://www.chiikawa-info.jp/chiikawaland/tokyo/img/main_02.jpg',
      ],
    },
    {
      'text': '『まじかるちいかわストア』',
      'imageUrls': [
        'https://www.chiikawa-info.jp/chiikawaland/tokyo/img/main_02.jpg',
      ],
    },
    // 添加更多的資料，每個資料項目都包含文字資訊和圖片URL列表
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
                  Map<String, dynamic> info = infos[index];
                  return Column(
                    children: [
                      Info(
                        data: info['text'],
                        imageUrls: info['imageUrls'],
                      ),
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
  final List<String> imageUrls;

  const Info({
    Key? key,
    required this.data,
    required this.imageUrls,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> imageWidgets = [];

    // 將圖片和間距一起添加到列表中
    for (int i = 0; i < imageUrls.length; i++) {
      imageWidgets.add(
        SizedBox(
          width: 10, // 調整間距的大小
        ),
      );
      imageWidgets.add(
        SizedBox(
          width: 78,
          height: 109,
          child: Image.network(
            imageUrls[i],
            fit: BoxFit.cover,
          ),
        ),
      );
    }

    return Container(
      color: Colors.white,
      width: 360,
      height: 145,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start, // 調整圖片的對齊方式
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start, // 調整文字的對齊方式
              children: [
                Text(data),
                SizedBox(height: 10),
                Row(
                  children: imageWidgets,
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
