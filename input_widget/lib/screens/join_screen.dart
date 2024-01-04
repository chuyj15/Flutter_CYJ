import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart'
    as picker;
import 'package:intl/intl.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';

class JoinScreen extends StatefulWidget {
  const JoinScreen({super.key});

  @override
  State<JoinScreen> createState() => _JoinScreenState();
}

class _JoinScreenState extends State<JoinScreen> {
  //state
  // TextEditingController _birthController = TextEditingController(text: DateTime.now().toString().split(' ')[0]);
  TextEditingController _idController = TextEditingController();
  TextEditingController _pwController = TextEditingController();
  TextEditingController _pwChkController = TextEditingController();
  TextEditingController _countController = TextEditingController();
  String _gender = '남자';
  TextEditingController _birthController = TextEditingController();
  String _identification = '주민등록증';

  String _date = '';

  final _formKey = GlobalKey<FormState>();

  //calendar_date_picker2 state
  List<DateTime?> _singleDatePickerValueWithDefaultValue = [
    DateTime.now(),
  ];

  //calendar_date_picker2 설정 정보
  final config = CalendarDatePicker2Config(
    //  calendarType: CalendarDatePicker2Type.multi,
    calendarType: CalendarDatePicker2Type.single,
    selectedDayHighlightColor: Colors.amber[900],
    weekdayLabels: ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'],
    weekdayLabelTextStyle: const TextStyle(
      color: Colors.black87,
      fontWeight: FontWeight.bold,
    ),
    firstDayOfWeek: 1,
    controlsHeight: 50,
    controlsTextStyle: const TextStyle(
      color: Colors.black,
      fontSize: 15,
      fontWeight: FontWeight.bold,
    ),
    dayTextStyle: const TextStyle(
      color: Colors.amber,
      fontWeight: FontWeight.bold,
    ),
    disabledDayTextStyle: const TextStyle(
      color: Colors.grey,
    ),
    selectableDayPredicate: (day) => !day
        .difference(DateTime.now().subtract(const Duration(days: 3)))
        .isNegative,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                '회원가입',
                style: TextStyle(fontSize: 30.0),
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      autofocus: true,
                      controller: _idController,
                      decoration: InputDecoration(
                        labelText: '아이디',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return '아이디를 입력하세요';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      controller: _pwController,
                      decoration: InputDecoration(
                        labelText: '비밀번호',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return '비밀번호를 입력하세요';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      controller: _pwChkController,
                      decoration: InputDecoration(
                        labelText: '비밀번호 확인',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return '비밀번호를 한번 더 입력하세요';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      children: [
                        Text('성별'),
                        Radio(
                          value: '남자',
                          groupValue: _gender,
                          onChanged: (value) {
                            setState(() {
                              // _gender = value.toString();
                              _gender = value!;
                            });
                          },
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _gender = '남자';
                            });
                          },
                          child: Text('남자'),
                        ),
                        Radio(
                          value: '여자',
                          groupValue: _gender,
                          onChanged: (value) {
                            setState(() {
                              // _gender = value.toString();
                              _gender = value!;
                            });
                          },
                        ),
                        Text('여자'),
                      ],
                    ),
                    Column(
                      children: [
                        TextFormField(
                          // initialValue: _date.toString(),
                          controller: _birthController,
                          readOnly: true,
                          decoration: InputDecoration(
                              labelText: '생년월일',
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  picker.DatePicker.showDatePicker(context,
                                      showTitleActions: true,
                                      minTime: DateTime(1900, 3, 5),
                                      maxTime: DateTime.now(),
                                      theme: picker.DatePickerTheme(
                                          //헤더
                                          headerColor: Colors.orange,
                                          //배경
                                          backgroundColor: Colors.blue,
                                          //항목
                                          itemStyle: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18),
                                          //완료
                                          doneStyle: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16)),
                                      onChanged: (date) {
                                    print(
                                        '생년월일_birthController : $_birthController');
                                    //TextEditingController#a9561(TextEditingValue(text: ┤2022-01-03 00:00:00.000├,
                                    //selection: TextSelection.collapsed(offset: 10, affinity: TextAffinity.downstream, isDirectional: false),
                                    //composing: TextRange(start: -1, end: -1)))
                                    // print('change $date in time zone ' +
                                    //     date.timeZoneOffset.inHours.toString());
                                    setState(() {
                                      // _birthController.text = date.toString().split(' ')[0];
                                      // _birthController.text = date.toString();
                                      // 2023/1/1 형식으로 바꾸는 방법 (직접)
                                      //  var dateFormat = '${date.year}/${date.month}/${date.day}';
                                      // _birthController.text = dateFormat;
                                      // 2023/01/01 형식으로 바꾸는 방법 (라이브러리 사용)
                                      var dateFormat =
                                          DateFormat('yyyy/MM/dd').format(date);
                                      _birthController.text = dateFormat;
                                    });
                                    print(
                                        '생년월일text : ${_birthController.text}');
                                  }, onConfirm: (date) {
                                    print('confirm $date');
                                    setState(() {
                                      _birthController.text =
                                          date.toString().split(' ')[0];
                                      _birthController.text = date.toString();
                                    });
                                  },
                                      currentTime: DateTime.now(),
                                      locale: picker.LocaleType.ko);
                                },
                                child: Icon(Icons.calendar_month),
                              )),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return '생년월일을 입력하세요';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                    //신분증 종류
                    DropdownButtonFormField(
                      value: _identification,
                      decoration: const InputDecoration(labelText: '신분증 종류'),
                      items: ['주민등록증', '운전면허증', '여권'].map((value) {
                        return DropdownMenuItem(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (value) {
                        _identification = value!;
                      },
                    ),

                    //calendar_date_picker2 위젯
                    CalendarDatePicker2(
                        config: config,
                        value: _singleDatePickerValueWithDefaultValue,
                        onValueChanged: (dates) {
                          if (dates.length > 2) {
                            setState(() {
                              _singleDatePickerValueWithDefaultValue =
                                  _singleDatePickerValueWithDefaultValue;
                            });
                          } else {
                            setState(() =>
                                _singleDatePickerValueWithDefaultValue = dates);
                            print('달력 날짜 : ${dates}');
                            // [2024-01-03 08:48:07.790480, 2024-01-04 00:00:00.000, 2024-01-11 00:00:00.000, 2024-01-18 00:00:00.000, 2024-01-19 00:00:00.000]
                          }

                          // 2023/01/01 ~ 2023/01/03 포맷팅
                          var start =
                              DateFormat('yyyy/MM/dd').format(dates[0]!);
                          var end = DateFormat('yyyy/MM/dd').format(dates[1]!);
                          var date = '${start} ~ ${end}';
                          setState(() {
                            _date = date;
                          });
                        }),

                    const SizedBox(
                      height: 20,
                    ),
                    //수량 버튼
                    TextField( //TextField는 사용자로부터 숫자를 입력 받을 수 있는 입력 필드
                          keyboardType: TextInputType.number, //숫자 키패드를 나타내도록 설정
                          controller: _countController,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          decoration: InputDecoration(labelText: '1', prefixIcon: ElevatedButton(onPressed: (){_countController.text = ((_countController.text as int) +1) as String;}, child: Text('+'), suffixIcon: ElevatedButton(onPressed: (){}, child: Text('-'),)),
                        ),
                    Row(
                      children: [ //텍스트필드랑 텍스트폼필드는 가로사이즈를 전부차지하다보니까
                      //다른 위젯들이랑 나란히 배치될 수 없다. 그래서 화면에 안나오는 현상이 있다. 

                        ElevatedButton(onPressed: () {}, child: Text('-')),
                        TextField( //TextField는 사용자로부터 숫자를 입력 받을 수 있는 입력 필드
                          keyboardType: TextInputType.number, //숫자 키패드를 나타내도록 설정
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          decoration: InputDecoration(labelText: '1'),
                        ),
                        ElevatedButton(onPressed: () {}, child: Text('+')),
                      ],
                    ),

                    //회원가입 버튼
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 40.0),
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0)),
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          print('아이디 : ${_idController.text}');
                          print('비밀번호 : ${_pwController.text}');
                          print('비번확인 : ${_pwChkController.text}');
                          print('성별 : ${_gender}');
                          print('생년월일 : ${_birthController.text}');
                          print('신분증 종류 : ${_identification}');
                          print('선택 날짜 : ${_date}');
                        }
                      },
                      child: Text('회원가입'),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
