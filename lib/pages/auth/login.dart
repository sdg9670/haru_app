import 'dart:math';

import 'package:flutter/material.dart';
import 'package:haruapp/pages/auth/register.dart';
import 'package:haruapp/services/auth/auth_service.dart';
import 'package:haruapp/utils/http_client.dart';
import 'package:haruapp/utils/validator.dart';
import 'package:haruapp/widgets/common/alert_bar.dart';
import 'package:haruapp/widgets/common/input_box.dart';
import 'package:haruapp/widgets/common/input_form.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  InputForm _inputForm;
  InputBox _emailInput;
  InputBox _passwordInput;

  @override
  Widget build(BuildContext context) {
    this._inputForm = this.loginForm();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(right: 40, left: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'HARU',
              style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 50,
            ),
            _inputForm,
            SizedBox(
              height: 25,
            ),
            Container(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    print('비밀번호 찾기');
                  },
                  child: Text(
                    '비밀번호를 잊으셨나요?',
                    style: TextStyle(color: Colors.blue),
                  ),
                )),
            SizedBox(
              height: 20,
            ),
            RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/main');
                AuthService().login('test', 'test');
              },
              color: Colors.blue,
              child: Text(
                '로그인',
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () async {
                final result = await Navigator.pushNamed(context, '/register');
                if (result != null) {
                  print(result);
                  if (result == 'registerSuccess') {
                    AlertBar(
                            type: AlertType.success,
                            message: '성공적으로 회원가입이 되었습니다.',
                            context: context)
                        .show();
                  }
                }
              },
              child: Text(
                '계정이 없으신가요?',
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ],
        ),
      ),
    );
  }

  InputForm loginForm() {
    this._emailInput = InputBox(
      name: '이메일',
      inputType: InputType.STRING,
    );
    this._passwordInput = InputBox(
      name: '비밀번호',
      inputType: InputType.STRING,
      obscureText: true,
    );
    return InputForm(
        child: Column(children: <Widget>[
      this._emailInput,
      SizedBox(
        height: 25,
      ),
      this._passwordInput,
    ]));
  }
}
