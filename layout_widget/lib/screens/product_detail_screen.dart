import 'package:flutter/material.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("상품 상세 화면")),
      body: Container(
          margin: const EdgeInsets.all(20.0),
          color: Colors.lightBlue,
          child: Column(
            //주축 정렬 방식
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 300,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                      image: AssetImage("img/4.jpg"), fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              const SizedBox( height: 12.0,),
              const Text(
                '상품 이름',
                style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
              ),
              //상품 가격
              Container(
                padding: const EdgeInsets.all(10.0),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.payment,
                      size: 24.0,
                      color: Colors.black,
                    ),
                    Text(
                      '50,000원',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              //장바구니 버튼 추가
              Container(
                width: double.infinity, //가로사이즈 최대로
                padding: const EdgeInsets.all(10.0),
                child: ElevatedButton(
                  onPressed: (){
                    
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)
                    ),
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,

                  ),
                  child : const Text('장바구니 추가'),
                ),
              ),
              const Divider(),


            ],
          )),
    );
  }
}
