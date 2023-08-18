/* ********************************************************************
 *
 *  
 * 2022.08.29  Juwoon Kim  주석 추가
 * 
 * 
******************************************************************** */

import 'package:flutter/material.dart';

enum Buttons {
  /// 페이스북 계정으로 로그인 할 수 있는 버튼을 구현합니다.
  ///
  /// [onPressed]는 null이 아니어야 합니다.
  facebookNew,

  /// 애플 계정으로 로그인 할 수 있는 버튼을 구현합니다.
  ///
  /// [onPressed]는 null이 아니어야 합니다.
  apple,

  /// 트위터 계정으로 로그인 할 수 있는 버튼을 구현합니다.
  ///
  /// [onPressed]는 null이 아니어야 합니다.
  twitter,

  /// 카카오 계정으로 로그인 할 수 있는 버튼을 구현합니다.
  ///
  /// [onPressed]는 null이 아니어야 합니다.
  kakao,

  /// 네이버 계정으로 로그인 할 수 있는 버튼을 구현합니다.
  ///
  /// [onPressed]는 null이 아니어야 합니다.
  naver,

  /// 구글 계정으로 로그인 할 수 있는 버튼을 구현합니다.
  ///
  /// [onPressed]는 null이 아니어야 합니다.
  google,

  /// 라인 계정으로 로그인 할 수 있는 버튼을 구현합니다.
  ///
  /// [onPressed]는 null이 아니어야 합니다.
  line,
}

class SignInButton extends StatelessWidget {
  /// ## SignInButton 소셜 로그인 버튼
  ///
  /// SNS (Apple, Google, Facebook, Twitter, Kakao, Naver, LINE) 계정으로 로그인 할 수 있는 버튼을 구현합니다.
  ///
  /// [onPressed]는 null이 아니어야 합니다.

  const SignInButton(
    this.button, {
    Key? key,
    required this.onPressed,
    this.mini = false,
    this.padding = EdgeInsets.zero,
    this.shape,
    this.text,
    this.elevation = 2.0,
  })  : assert(
          mini != true ||
              !(button == Buttons.facebookNew ||
                  button == Buttons.facebookNew ||
                  button == Buttons.facebookNew),
          'Google and FacebookNew buttons do not support mini mode',
        ),
        super(key: key);

  /// 버튼 클릭 시 발생하는 이벤트를 지정합니다.
  final Function onPressed;

  /// 사용할 버튼을 지정합니다.
  final Buttons button;

  /// 아이콘 버튼 사용 여부를 지정합니다.
  final bool mini;

  /// 버튼의 테두리 모양을 지정합니다.
  final ShapeBorder? shape;

  /// 버튼에 들어갈 텍스트를 지정합니다.
  final String? text;

  /// 버튼의 여백을 지정합니다.
  final EdgeInsets padding;

  /// 버튼의 그림자 정도를 지정합니다.
  final double elevation;

  @override
  Widget build(BuildContext context) {
    switch (button) {
      case Buttons.facebookNew:
        return SignInButtonBuilder(
          elevation: elevation,
          key: const ValueKey('Facebook'),
          text: text ?? 'Sign in with Facebook',
          icon: FontAwesomeIcons.facebook,
          image: button == Buttons.facebookNew
              ? const ClipRRect(
                  child: Image(
                    image: AssetImage(
                      'assets/png/facebook_new.png',
                    ),
                    height: 24.0,
                  ),
                )
              : null,
          backgroundColor: button == Buttons.facebookNew
              ? const Color(0xFF1877f2)
              : const Color(0xFF3B5998),
          innerPadding: button == Buttons.facebookNew
              ? const EdgeInsets.fromLTRB(12, 0, 11, 0)
              : null,
          onPressed: onPressed,
          padding: padding,
          shape: shape,
        );

      case Buttons.apple:
        return SignInButtonBuilder(
          elevation: elevation,
          key: const ValueKey('Apple'),
          text: text ?? 'Login with Apple',
          image: Container(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image(
                image: AssetImage(
                  button == Buttons.apple
                      ? 'assets/png/apple_logo.png'
                      : 'assets/png/apple_logo.png',
                ),
                height: 40.0,
              ),
            ),
          ),
          textColor: button == Buttons.apple ? Colors.black : Colors.white,
          iconColor: button == Buttons.apple ? Colors.black : Colors.white,
          backgroundColor: button == Buttons.apple
              ? const Color(0xFFFFFFFF)
              : const Color(0xFF000000),
          onPressed: onPressed,
          padding: padding,
          shape: shape,
        );
      case Buttons.google:
        return SignInButtonBuilder(
          elevation: elevation,
          key: const ValueKey('Google'),
          text: text ?? 'Sign in with Google',
          image: Container(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image(
                image: AssetImage(
                  button == Buttons.google
                      ? 'assets/png/google_light.png'
                      : 'assets/png/google_light.png',
                ),
                height: 40.0,
              ),
            ),
          ),
          textColor: button == Buttons.apple ? Colors.black : Colors.black,
          iconColor: button == Buttons.apple ? Colors.black : Colors.black,
          backgroundColor: button == Buttons.apple
              ? const Color(0xFFFFFFFF)
              : const Color(0xFFFFFFFF),
          onPressed: onPressed,
          padding: padding,
          shape: shape,
        );

      case Buttons.twitter:
        return SignInButtonBuilder(
          elevation: elevation,
          key: const ValueKey('Twitter'),
          mini: mini,
          text: text ?? 'Sign in with Twitter',
          icon: FontAwesomeIcons.twitter,
          image: Container(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image(
                image: AssetImage(
                  button == Buttons.kakao
                      ? 'assets/png/twitter_logo.png'
                      : 'assets/png/twitter_logo.png',
                ),
                height: 30.0,
              ),
            ),
          ),
          backgroundColor: const Color(0xFF1D9BF0),
          onPressed: onPressed,
          padding: padding,
          shape: shape,
        );

      case Buttons.kakao:
        return SignInButtonBuilder(
          key: const ValueKey('Kakao'),
          mini: mini,
          text: text ?? 'Login with Kakao',
          image: Container(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image(
                image: AssetImage(
                  button == Buttons.kakao
                      ? 'assets/png/kakao_login_medium_narrow.png'
                      : 'assets/png/kakao_login_medium_narrow.png',
                ),
                height: 45.0,
              ),
            ),
          ),
          backgroundColor: const Color(0xffFEE500),
          onPressed: onPressed,
          padding: padding,
          shape: shape,
        );

      case Buttons.line:
        return SignInButtonBuilder(
          elevation: elevation,
          key: const ValueKey('Line'),
          mini: mini,
          text: text ?? 'Sign in with LINE',
          icon: FontAwesomeIcons.twitter,
          image: Container(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image(
                image: AssetImage(
                  button == Buttons.line
                      ? 'assets/png/line_logo.png'
                      : 'assets/png/line_logo.png',
                ),
                height: 30.0,
              ),
            ),
          ),
          backgroundColor: const Color(0xff06C755),
          onPressed: onPressed,
          padding: padding,
          shape: shape,
        );

      case Buttons.naver:
      default:
        return SignInButtonBuilder(
          key: const ValueKey('Naver'),
          mini: mini,
          text: text ?? 'Login with Naver',
          image: Container(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image(
                image: AssetImage(
                  button == Buttons.naver
                      ? 'assets/png/naver_login.png'
                      : 'assets/png/naver_login.png',
                ),
                height: 40.0,
              ),
            ),
          ),
          backgroundColor: const Color(0xff03C75A),
          onPressed: onPressed,
          padding: padding,
          shape: shape,
        );
    }
  }
}

class SignInButtonBuilder extends StatelessWidget {
  const SignInButtonBuilder({
    Key? key,
    required this.backgroundColor,
    required this.onPressed,
    required this.text,
    this.icon,
    this.image,
    this.fontSize = 14.0,
    this.textColor = Colors.white,
    this.iconColor = Colors.white,
    this.splashColor = Colors.white30,
    this.highlightColor = Colors.white30,
    this.padding,
    this.innerPadding,
    this.mini = false,
    this.elevation = 2.0,
    this.shape,
    this.height,
    this.width,
  }) : super(key: key);

  /// 버튼에 들어갈 이미지 위젯을 지정합니다.
  final Widget? image;

  /// 작은 크기의 버튼 생성 여부를 지정합니다.
  final bool mini;

  /// 버튼에 들어갈 텍스트를 지정합니다.
  final String text;

  /// 버튼에 들어갈 아이콘을 지정합니다.
  final IconData? icon;

  /// 버튼에 들어갈 텍스트 크기를 지정합니다.
  final double fontSize;

  /// 버튼에 들어갈 텍스트 색상을 지정합니다.
  final Color textColor;

  /// 버튼에 들어갈 아이콘 색상을 지정합니다.
  final Color iconColor;

  /// 버튼의 배경 색상을 지정합니다.
  final Color backgroundColor;

  /// 버튼의 테두리 모양을 지정합니다.
  final ShapeBorder? shape;

  /// 버튼의 높이를 지정합니다.
  final double? height;

  /// 버튼의 너비를 지정합니다.
  final double? width;

  /// 버튼의 스플래시 효과에 적용할 색상을 지정합니다.
  final Color splashColor;

  /// 버튼에 강조할 색상을 지정합니다.
  final Color highlightColor;

  /// 버튼 클릭 시 발생하는 이벤트입니다.
  final Function onPressed;

  /// 버튼의 여백을 지정합니다.
  final EdgeInsets? padding;

  /// 버튼의 내부 여백을 지정합니다.
  final EdgeInsets? innerPadding;

  /// 버튼의 그림자 강도를 지정합니다.
  final double elevation;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      key: key,
      minWidth: mini ? width ?? 35.0 : null,
      height: height,
      elevation: elevation,
      padding: padding ?? EdgeInsets.zero,
      color: backgroundColor,
      onPressed: onPressed as void Function()?,
      splashColor: splashColor,
      highlightColor: highlightColor,
      shape: shape ?? ButtonTheme.of(context).shape,
      child: _getButtonChild(context),
    );
  }

  Widget _getButtonChild(BuildContext context) {
    if (mini) {
      return SizedBox(
        width: height ?? 35.0,
        height: width ?? 35.0,
        child: _getIconOrImage(),
      );
    }
    return Container(
      constraints: BoxConstraints(
        maxWidth: width ?? 220,
      ),
      child: Center(
        child: Row(
          children: <Widget>[
            Padding(
              padding: innerPadding ??
                  const EdgeInsets.symmetric(
                    horizontal: 13,
                  ),
              child: _getIconOrImage(),
            ),
            Text(
              text,
              style: TextStyle(
                color: textColor,
                fontSize: fontSize,
                backgroundColor: const Color.fromRGBO(0, 0, 0, 0),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget? _getIconOrImage() {
    if (image != null) {
      return image;
    }
    return Icon(
      icon,
      size: 20,
      color: iconColor,
    );
  }
}

class FontAwesomeIcons {
  static const IconData facebook = IconDataBrands(0xf09a);
  static const IconData apple = IconDataBrands(0xf179);
  static const IconData twitter = IconDataBrands(0xf099);
}

class IconDataBrands extends IconData {
  const IconDataBrands(int codePoint)
      : super(
          codePoint,
          fontFamily: 'FontAwesomeBrands',
          fontPackage: 'font_awesome_flutter',
        );
}
