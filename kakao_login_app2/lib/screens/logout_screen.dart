import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kakao_login_app2/provider/user_provider.dart';
import 'package:provider/provider.dart';

class LogoutScreen extends StatefulWidget {
  const LogoutScreen({super.key});

  @override
  State<LogoutScreen> createState() => _LogoutScreenState();
}

class _LogoutScreenState extends State<LogoutScreen> {
  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = context.read<UserProvider>();

    return Scaffold(
      appBar: AppBar(
        title: Text('로그아웃 페이지'),
        backgroundColor: Colors.brown,
        titleTextStyle: GoogleFonts.jua(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      body: Container(
        child: Center(
            child: ListView(
          children: [
            userProvider.isLogin
                ? Image.network(
                    '${userProvider.userInfo.kakaoAccount?.profile?.profileImageUrl}',
                    width: 220,
                    height: 220,
                    fit: BoxFit.cover,
                  )
                : Text(''),
            userProvider.isLogin
                ? Text(
                    '${userProvider.userInfo?.kakaoAccount?.profile?.nickname}',
                    style: TextStyle(
                      fontSize: 40,
                    ),
                  )
                : Text(''),
            ElevatedButton(
              child: Consumer<UserProvider>(
                  builder: (context, user, child) => Text(
                        '로그아웃',
                        style: GoogleFonts.jua(),
                      )),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amberAccent,
                foregroundColor: Colors.brown,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 5,
              ),
              onPressed: () async {
                await userProvider.kakaoLogout();
                Navigator.pushReplacementNamed(context, "/login");
              },
            ),
            ElevatedButton(
              child: Consumer<UserProvider>(
                  builder: (context, user, child) => Text(
                        '로그인 페이지로 이동',
                        style: GoogleFonts.jua(),
                      )),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amberAccent,
                foregroundColor: Colors.brown,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 5,
              ),
              onPressed: () {
                Navigator.pushReplacementNamed(context, "/login");
              },
            ),
          ],
        )),
      ),
    );
  }
}
