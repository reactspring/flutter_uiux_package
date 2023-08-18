/* ********************************************************************
 *
 *  
 * 2022.08.29  Juwoon Kim  주석 추가
 * 
 * 
******************************************************************** */

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:extended_phone_number_input/consts/enums.dart';
import 'package:extended_phone_number_input/consts/strings_consts.dart';
import 'package:extended_phone_number_input/widgets/country_code_list.dart';
import 'package:extended_phone_number_input/models/country.dart';
import 'package:extended_phone_number_input/phone_number_controller.dart';

class PhoneNumberInput extends StatefulWidget {
  /// ## PhoneNumberInput 핸드폰 번호 입력필드
  ///
  /// 핸드폰 번호를 입력 받는 입력필드를 구현합니다.

  const PhoneNumberInput({
    Key? key,
    this.controller,
    this.onChanged,
    this.initialValue,
    this.initialCountry = 'KR',
    this.excludedCountries,
    this.allowPickFromContacts = true,
    this.pickContactIcon,
    this.includedCountries,
    this.hint,
    this.showSelectedFlag = true,
    this.border,
    this.locale = 'ko',
    this.searchHint,
    this.allowSearch = true,
    this.countryListMode = CountryListMode.bottomSheet,
    this.enabledBorder,
    this.focusedBorder,
    this.contactsPickerPosition = ContactsPickerPosition.suffix,
    this.errorText,
  }) : super(key: key);

  final PhoneNumberInputController? controller;

  /// 초기 값을 지정합니다.
  final String? initialValue;

  /// 초기 국가를 지정합니다.
  final String? initialCountry;

  /// 제외할 국가 목록을 지정합니다.
  final List<String>? excludedCountries;

  /// 포함할 국가 목록을 지정합니다.
  final List<String>? includedCountries;

  /// 연락처 접근 허용 여부를 지정합니다.
  final bool allowPickFromContacts;

  /// 연락처 접근 시에 보여지는 아이콘 위젯을 지정합니다.
  final Widget? pickContactIcon;

  /// 위젯 선택 시에 발생하는 이벤트를 지정합니다.
  final void Function(String)? onChanged;

  /// 힌트 메시지에 보여지는 텍스트를 지정합니다.
  final String? hint;

  /// 국기 활성화 여부를 지정합니다.
  final bool showSelectedFlag;

  /// 테두리의 스타일을 지정합니다.
  final InputBorder? border;

  /// 지역을 지정합니다.
  final String locale;

  /// 검색 시에 나타나는 힌트 텍스트를 지정합니다.
  final String? searchHint;

  /// 검색 활성화 여부를 지정합니다.
  final bool allowSearch;

  /// 국가 목록을 지정합니다.
  final CountryListMode countryListMode;

  /// 입력필드에 텍스트를 입력할 때 보여지는 테두리 스타일을 지정합니다.
  final InputBorder? enabledBorder;

  /// 포커스 시에 테두리 스타일을 지정합니다.
  final InputBorder? focusedBorder;

  /// 연락처 선택 아이콘의 위치를 지정합니다.
  final ContactsPickerPosition contactsPickerPosition;

  /// 입력필드에 입력된 값에 오류가 있을 경우 나타나는 텍스트를 지정합니다.
  final String? errorText;

  @override
  _CountryCodePickerState createState() => _CountryCodePickerState();
}

class _CountryCodePickerState extends State<PhoneNumberInput> {
  late PhoneNumberInputController _phoneNumberInputController;
  late TextEditingController _phoneNumberTextFieldController;
  late Future _initFuture;
  Country? _selectedCountry;

  @override
  void initState() {
    if (widget.controller == null) {
      _phoneNumberInputController = PhoneNumberInputController(
        context,
      );
    } else {
      _phoneNumberInputController = widget.controller!;
    }
    _initFuture = _init();
    _phoneNumberInputController.addListener(_refresh);
    _phoneNumberTextFieldController = TextEditingController();
    super.initState();
  }

  Future _init() async {
    await _phoneNumberInputController.init(
        initialCountryCode: widget.initialCountry,
        excludeCountries: widget.excludedCountries,
        includeCountries: widget.includedCountries,
        initialPhoneNumber: widget.initialValue,
        errorText: widget.errorText,
        locale: widget.locale);
  }

  /// refresh :
  void _refresh() {
    _phoneNumberTextFieldController.value = TextEditingValue(
      text: _phoneNumberInputController.phoneNumber,
      selection: TextSelection(
          baseOffset: _phoneNumberInputController.phoneNumber.length,
          extentOffset: _phoneNumberInputController.phoneNumber.length),
    );

    setState(
      () {
        _selectedCountry = _phoneNumberInputController.selectedCountry;
      },
    );
    if (widget.onChanged != null) {
      widget.onChanged!(_phoneNumberInputController.fullPhoneNumber);
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initFuture,
      builder: (context, snapshot) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 2),
          child: Column(
            children: [
              /// Directionality : 위젯에 들어갈 텍스트의 진행 방향을 지정합니다.
              Directionality(
                textDirection: TextDirection.ltr,
                child: TextFormField(
                  controller: _phoneNumberTextFieldController,
                  inputFormatters: [
                    /// LengthLimitingTextInputFormatter : 입력필드에 입력되는 글자 수를 제한하는 함수
                    LengthLimitingTextInputFormatter(15),

                    /// FilteringTextInputFormatter : 특정 문자 입력을 제한하는 함수
                    FilteringTextInputFormatter.allow(kNumberRegex),
                  ],
                  onChanged: (v) {
                    _phoneNumberInputController.innerPhoneNumber = v;
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: _phoneNumberInputController.validator,
                  keyboardType: TextInputType.phone,
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.zero,
                    hintText: widget.hint,
                    border: widget.border,
                    hintStyle: const TextStyle(color: Color(0xFFB6B6B6)),
                    enabledBorder: widget.enabledBorder,
                    focusedBorder: widget.focusedBorder,
                    suffixIcon: Visibility(
                      visible: widget.allowPickFromContacts &&
                          widget.contactsPickerPosition ==

                              /// ContactsPickerPostiion : 연락처에 연결해 저장되어 있는 연락처를 선택할 수 있도록 구현하는 함수
                              ContactsPickerPosition.suffix,
                      child: widget.pickContactIcon == null
                          ? IconButton(
                              onPressed:
                                  _phoneNumberInputController.pickFromContacts,
                              icon: Icon(
                                Icons.contact_phone,
                                color: Theme.of(context).primaryColor,
                              ),
                            )
                          : InkWell(
                              onTap:
                                  _phoneNumberInputController.pickFromContacts,
                              child: widget.pickContactIcon,
                            ),
                    ),
                    prefixIcon: InkWell(
                      onTap: _openCountryList,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.arrow_drop_down),
                          if (_selectedCountry != null &&
                              widget.showSelectedFlag)
                            Image.asset(
                              _selectedCountry!.flagPath,
                              height: 12,
                            ),
                          const SizedBox(
                            width: 4,
                          ),
                          if (_selectedCountry != null)
                            Text(
                              _selectedCountry!.dialCode,
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor),
                            ),
                          const SizedBox(
                            width: 8,
                          ),
                          Container(
                            height: 24,
                            width: 1,
                            color: const Color(0xFFB9BFC5),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              Visibility(
                visible: widget.allowPickFromContacts &&
                    widget.contactsPickerPosition ==
                        ContactsPickerPosition.bottom,
                child: widget.pickContactIcon == null
                    ? IconButton(
                        onPressed: _phoneNumberInputController.pickFromContacts,
                        icon: Icon(
                          Icons.contact_phone,
                          color: Theme.of(context).primaryColor,
                        ),
                      )
                    : InkWell(
                        onTap: _phoneNumberInputController.pickFromContacts,
                        child: widget.pickContactIcon,
                      ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _openCountryList() {
    switch (widget.countryListMode) {
      case

      /// CountryListMode.bottomSheet : 바텀시트에서 국가 목록을 선택하는 모드
      CountryListMode.bottomSheet:
        showModalBottomSheet(
          isScrollControlled: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          enableDrag: true,
          context: context,
          builder: (_) => SizedBox(
            height: 500,
            child:

                /// CountryCodeList : 국가 코드 목록을 구현하는 함수
                CountryCodeList(
                    searchHint: widget.searchHint,
                    allowSearch: widget.allowSearch,
                    phoneNumberInputController: _phoneNumberInputController),
          ),
        );
        break;
      case

      /// CountryListMode.dialog : 다이얼로그 창에서 국가 목록을 선택하는 모드
      CountryListMode.dialog:
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            contentPadding: EdgeInsets.zero,
            content: SizedBox(
              width: double.maxFinite,
              child: CountryCodeList(
                  searchHint: widget.searchHint,
                  allowSearch: widget.allowSearch,
                  phoneNumberInputController: _phoneNumberInputController),
            ),
          ),
        );
        break;
    }
  }
}
