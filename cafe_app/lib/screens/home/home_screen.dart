import 'package:cafe_app/screens/menu/menu_detail_screen.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:cafe_app/models/coffee.dart';
import 'package:intl/intl.dart'; //임포트 시 lib폴더 기준으로 잡나봐..

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> menuItems = ["신메뉴", "커피", "디카페인", "Tea"];

    //이미지 슬라이드 아이템
    List<String> bannerItemImgUrl = [
      'images/banner01.jpg',
      'images/banner02.jpg',
      'images/cafe.jpg',
      'images/dessert.jpg',
    ];

    //커피 메뉴 아이템
    List<String> coffeeMenuImgUrl = [
      'images/13.jpg',
      'images/14.jpg',
      'images/15.jpg',
      'images/16.jpg',
      'images/7.jpg',
      'images/8.jpg',
      'images/13.jpg',
      'images/14.jpg',
      'images/15.jpg',
      'images/16.jpg',
      'images/7.jpg',
      'images/8.jpg',
    ];

    return DefaultTabController(
      initialIndex: 0, //탭바 초기 인덱스
      length: menuItems.length,
      child: Scaffold(
          appBar: AppBar(
              title: Text(
                '메뉴',
                style: TextStyle(color: Colors.black),
              ),
              centerTitle: true, //appbar title 가운데 정렬
              backgroundColor: Colors.white,
              leading: Icon(
                Icons.home,
                color: Colors.grey,
              ),
              bottom: TabBar(
                tabs: List.generate(
                    menuItems.length, (index) => Tab(text: menuItems[index])),
                unselectedLabelColor: Colors.grey, //미선택 라벨 색상
                labelColor: Colors.purple, //라벨 색상
                indicatorColor: Colors.purpleAccent,
                // indicatorSize: TabBarIndicatorSize.label,
                indicatorSize: TabBarIndicatorSize.tab,
                // isScrollable: true, //스크롤 여부
              )),
          body: TabBarView(
            children: [
              //탭1 : 신메뉴
              ListView(
                children: [
                  //배너
                  CarouselSlider.builder(
                      itemCount: bannerItemImgUrl.length,
                      itemBuilder: (context, index, realIndex) {
                        return Stack(children: [
                          Image.asset(
                            "${bannerItemImgUrl[index]}",
                            fit: BoxFit.cover,
                            width: MediaQuery.of(context)
                                .size
                                .width, //이미지 가로사이즈를 앱 가로사이즈로 지정
                          ),
                        ]);
                      },
                      options:
                          CarouselOptions(viewportFraction: 1.0 //화면당 이미지 개수
                              )),

                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start, //순서
                      children: [
                        Text(
                          '조은 카페의 신 메뉴',
                          style: TextStyle(color: Colors.purpleAccent),
                        ),
                        // Container(
                        //   height: 100,
                        // child:
                        GridView.builder(
                          //이 속성을 넣으니까 이미지가 나오네요..
                          //큰 이미지의 경우 축소해서 적용시켜주나봐요.
                          shrinkWrap: true,
                          // 📌 physics : 위젯 스크롤 동작을 지정하는 속성
                          // ScrollPhysics : 기본 스크롤 동작 위젯
                          // BouncingScrollPhysics : 바운스 효과 스크롤 동작 위젯
                          //GridView가 자체적으로 스크롤되지 않고, TabBarView 전체의 스크롤과 함께 움직이게 됩니다.
                          // physics: NeverScrollableScrollPhysics(),
                          physics: NeverScrollableScrollPhysics(),
                          //그리드를 몇 열로 놓을건지?
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3),
                          itemCount: coffeeMenuImgUrl.length,
                          itemBuilder: ((context, index) {
                            return Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Image.asset(
                                  coffeeMenuImgUrl[index],
                                  // width: 40,
                                  // height: 40,
                                  fit: BoxFit.cover,
                                ));
                          }),
                        ),
                        // ),
                      ],
                    ),
                  )
                ],
              ),

              //커피 탭뷰
              ListView(
                children:
                    // [] 로 안감싸줘도 된다..
                    List.generate(
                        coffeeList.length,
                        (index) => Container(
                              height: 150.0,
                              child: GestureDetector(
                                //클릭 시, 상세 화면 이동
                                onTap: () {
                                  //안녕
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=> MenuDetailScreen(item : coffeeList[index])));
                                },
                                child: Padding(
                                    padding: EdgeInsets.all(14.0),
                                    child: Row(
                                      //이미지, 내용 영역
                                      children: [
                                        Image.asset(
                                          coffeeList[index].imageUrl,
                                          fit: BoxFit.cover,
                                          width: 100.0,
                                          height: 100.0,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(coffeeList[index].title, style: TextStyle(fontSize: 22.0),),
                                              Text('${NumberFormat.decimalPattern().format(coffeeList[index].price)}원', style: TextStyle(fontSize: 16.0),),
                                            ]
                                          ),
                                        )
                                      ],
                                    )),
                              ),
                            )),
              ),

              Center(
                child: Text('디카페인 신메뉴'),
              ),
              Center(
                child: Text('티 신메뉴'),
              ),
            ],
          )),
    );
  }
}
