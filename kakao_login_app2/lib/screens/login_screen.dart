import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:kakao_login_app2/provider/user_provider.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('로그인 페이지'),
          backgroundColor: Colors.brown,
          titleTextStyle: GoogleFonts.jua(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        body: Consumer<UserProvider>(
          builder: (context, user, child) => Container(
            child: Center(
              child: ElevatedButton(
                // child: Text(
                //   '카카오 로그인',
                //   style: GoogleFonts.jua(
                //   ),
                // ),
                child: Text(
                  !user.isLogin ? 
                  '카카오 로그인' : '로그아웃',
                  style: GoogleFonts.jua(),
                ),

                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amberAccent,
                  foregroundColor: Colors.brown,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  elevation: 5,
                ),
                onPressed: () async {
                  //카카오 로그인 요청
                  //provider로부터 사용자정보 가져와서 확인
                  var user = context.read<UserProvider>();
                  // 카카오로그인하기 전 먼저 확인해야 하는 것
                  // 1. 로그인 여부 확인
                  // 질문) 왜 _loginStat이란게 있는데 굳이 loginCheck()함수를 만드는가??
                  // 답변) true/false만 가지고 로그인을 체크할 수 없음. 카카오에서 준 토큰도 있어야 로그인을 체크할 수 있겠죠?
                  await user.loginCheck();
                  //비로그인 시  -> 로그인 요청
                  if (!user.isLogin) {
                    // 2. 사용자조건 : 카카오톡 설치 여부
                    isKakaoTalkInstalled().then((value) => {
                          if (value)
                            user.kakaoTalkLogin()
                          else
                            user.kakaoLogin()
                        });

                    // () ? user.kakaoTalkLogin() : user.kakaoLogin();
                  } else {
                    //이미 로그인된 상태 -> 로그아웃화면으로 이동
                    Navigator.pushReplacementNamed(context, "/logout");
                  }
                },
              ),
            ),
          ),
        ));
  }
}
