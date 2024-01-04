import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //state
  bool rememberId = false;
  bool rememberMe = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40.0),
      child: Column(
        children: [
          Text(
            '로그인',
            style: TextStyle(fontSize: 32.0),
          ),
          SizedBox(
            height: 10,
          ),

          TextField(
            obscureText: false, //사용자가 입력한 텍스트를 가리기 위해 사용됩니다.
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: '아이디',
                hintText: '아이디 입력해요'),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            obscureText: true, //사용자가 입력한 텍스트를 가리기 위해 사용됩니다.
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: '비밀번호',
                hintText: '비밀번호 입력해요'),
          ),
          SizedBox(
            height: 20,
          ),
          //아이디 저장, 자동로그인 체크박스
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    Checkbox(
                        value: rememberId,
                        onChanged: (value) {
                          print('아이디저장여부 : $value');
                          setState(() {
                            rememberId = value!; // ! :확실히 안비어있음
                          });
                        }),
                    Text('아이디 저장')
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                        value: rememberMe,
                        onChanged: (value) {
                          setState(() {
                            rememberMe = value!;
                          });
                        }),
                    Text('자동 로그인')
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 40.0),
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0)),
                  ),

              // ButtonStyle(
              //   backgroundColor: MaterialStateProperty.all(Colors.red), //배경색
              //   foregroundColor: MaterialStateProperty.all(Colors.white), //글자색
              //   shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(0))), //버튼 둥근정도
              //     minimumSize:
              //         MaterialStateProperty.all(Size(double.infinity, 40))),

              onPressed: () {
                print('로그인');
              },

              child: Text('로그인'),
            ),
          ),
        ],
      ),
    );
  }
}
