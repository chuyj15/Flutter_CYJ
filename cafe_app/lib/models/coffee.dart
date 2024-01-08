class Coffee {
  final String id; //final은 한번 생성되고 따로 변형안하기 위해 붙인거에요. 
  final String title;
  final int price;
  final String imageUrl;
  final String imageUrl2;

  Coffee({
    required this.id,
    required this.title,
    required this.price,
    required this.imageUrl,
    required this.imageUrl2,
  });
}



//샘플 데이터
//클래스 밖에서 선언해줘야 다른데서 임포트해서 사용해줄 수 있어요. 
List<Coffee> coffeeList = [
  Coffee(id: '01', title: '아메리카노', price: 4000, imageUrl: 'images/17.jpg', imageUrl2: 'images/18.jpg') ,
  Coffee(id: '02', title: '라떼', price: 5000, imageUrl: 'images/19.jpg', imageUrl2: 'images/14.jpg') ,
  Coffee(id: '03', title: '프라푸치노', price: 6000, imageUrl: 'images/15.jpg', imageUrl2: 'images/16.jpg') ,
  Coffee(id: '04', title: '딸기라떼', price: 7000, imageUrl: 'images/20.jpg', imageUrl2: 'images/21.jpg') ,
  Coffee(id: '05', title: '파르페', price: 8000, imageUrl: 'images/22.jpg', imageUrl2: 'images/23.jpg') ,
];