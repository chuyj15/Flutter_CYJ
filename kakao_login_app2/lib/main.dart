import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk_common/kakao_flutter_sdk_common.dart';
import 'package:kakao_login_app2/provider/user_provider.dart';
import 'package:kakao_login_app2/screens/login_screen.dart';
import 'package:kakao_login_app2/screens/logout_screen.dart';
import 'package:provider/provider.dart';

void main() {
  // 웹 환경에서 카카오 로그인을 정상적으로 완료하려면 runApp() 호출 전 아래 메서드 호출 필요
  WidgetsFlutterBinding.ensureInitialized();

  // runApp() 호출 전 Flutter SDK 초기화
  KakaoSdk.init(
    nativeAppKey: '98a3c1ac40b433f841e4e76d518952c2',
    // javaScriptAppKey: '71237b6d0dff787ccb38ce788f03f23e',
  );
  runApp(
    // ChangeNotifierProvider: UserProvider의 인스턴스를 생성하고 해당 인스턴스를 위젯 트리에 주입합니다.
    ChangeNotifierProvider(
      //create: UserProvider의 인스턴스를 생성하는 콜백 함수를 전달합니다.
      create: (context) => UserProvider(),
      //child: ChangeNotifierProvider가 제공하는 상태를 공유하는 모든 자식 위젯들의 부모 역할을 합니다.
      child: const MyApp(),
      //이렇게 하면 MyApp 위젯 및 이 위젯 아래의 모든 자식 위젯들에서 UserProvider에 접근할 수 있습니다
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginScreen(),
        '/logout': (context) => LogoutScreen(),
      },
    );
  }
}
