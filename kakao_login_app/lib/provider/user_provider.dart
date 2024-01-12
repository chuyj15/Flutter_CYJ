import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';

class UserProvider extends ChangeNotifier {
  //로그인 정보
  //여기의 User는 카카오플러터sdk에 있는 User입니다.
  late User _userInfo; //late : 나중에 반드시 null 대신에 값을 초기화할거다
  //로그인 상태
  bool _loginStat = false;

  //전역에서 사용할수있도록 getter 메소드 지정
  // get 키워드 : getter메소드를 정의하는 키워드
  User get userInfo => _userInfo; //전역변수
  bool get isLogin => _loginStat; //전역변수

  //카카오 로그인 요청
  Future<void> kakaoLogin() async {
    try {
      // loginWithKakaoAccount() :카카오계정으로 로그인
      OAuthToken token = await UserApi.instance.loginWithKakaoAccount();
      //loginWithKakaoTalk() : 카톡이 열리고, 카톡을 통해서 로그인
      // OAuthToken token = await UserApi.instance.loginWithKakaoTalk();
      print('로그인 성공...');
      print('${token.accessToken}');
      _loginStat = true; // 로그인 여부 : true

      // 사용자 정보 가져오기 (메소드로 정의)
      getUserInfo();
    } catch (error) {
      print('카카오 계정으로 로그인 실패 $error');
      print( await KakaoSdk.origin);
    }
    ;

    //아래 메소드가 호출되면 공유된 상태를 가진 위젯을 다시 빌드합니다.
    notifyListeners();
  }

  //카카오톡 로그인 요청
  Future<void> kakaoTalkLogin() async {
    try {
      OAuthToken token = await UserApi.instance.loginWithKakaoTalk();
      print('카카오톡으로 로그인 성공...');
      print('${token.accessToken}');
      _loginStat = true; // 로그인 여부 : true
      getUserInfo();
    } catch (error) {
      print('카카오톡 로그인 실패 $error');
    }
    notifyListeners();
  }

//사용자 정보 가져오기
  Future<void> getUserInfo() async {
    try {
      _userInfo = await UserApi.instance.me(); //사용자 정보 요청
      print('사용자 정보 요청 성공');
      print(
          'id : ${_userInfo?.id}'); //고유식별자. 카카오가 유저를 식별하기 위한 정보입니다. (진짜 아이디 아님)
      print('nickname : ${_userInfo?.kakaoAccount?.name}');
      print('nickname2 : ${_userInfo?.kakaoAccount?.profile?.nickname}');
      print('nickname2 : ${_userInfo?.kakaoAccount?.profile?.profileImageUrl}');
    } catch (e) {
      print('사용자 정보 요청 실패 $e');
    }
  }

  //로그인 확인 ()
  Future<void> loginCheck() async {
    // 비로그인 시 로그인확인할 필요 없음
    if (!_loginStat) return;
    // 로그인 시 (즉, 이미 로그인인증받은 정보가 저장되어있는 케이스)
    if (await AuthApi.instance.hasToken()) {
      //토큰 확인
      try {
        AccessTokenInfo tokenInfo = await UserApi.instance.accessTokenInfo();
        print('토큰 유효성 체크 성공 ${tokenInfo.id} - ${tokenInfo.expiresIn}');
        _loginStat = true;
      } catch (e) {
        if (e is KakaoException && e.isInvalidTokenError()) {
          print('토큰 만료 - $e');
        } else {
          print('loginCheck() 중 오류 발생 - $e');
        }
        _loginStat = false;
      }
    } else {
      print('발급된 토큰 없음');
      _loginStat = false;
    }
    notifyListeners();
  }

  //
}
