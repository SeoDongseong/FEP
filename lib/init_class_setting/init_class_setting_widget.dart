import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class InitClassSettingWidget extends StatefulWidget {
  const InitClassSettingWidget({Key key}) : super(key: key);

  @override
  _InitClassSettingWidgetState createState() => _InitClassSettingWidgetState();
}

class _InitClassSettingWidgetState extends State<InitClassSettingWidget> {
  TextEditingController inputBankrateController;
  TextEditingController inputCurrencyNameController;
  TextEditingController inputWageController;
  TextEditingController inputTaxRateController;
  TextEditingController inputInterstController;
  TextEditingController inputClassIDController;
  TextEditingController inputClassDomainController;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    inputBankrateController = TextEditingController(text: '5');
    inputCurrencyNameController = TextEditingController();
    inputWageController = TextEditingController(text: '400');
    inputTaxRateController = TextEditingController(text: '10');
    inputInterstController = TextEditingController(text: '5');
    inputClassIDController = TextEditingController(text: 'ogdb');
    inputClassDomainController = TextEditingController(text: '@gbe.com');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        automaticallyImplyLeading: false,
        title: Text(
          '금융교실 초기 설정',
          style: FlutterFlowTheme.of(context).title1,
        ),
        actions: [],
        centerTitle: false,
        elevation: 0,
      ),
      backgroundColor: FlutterFlowTheme.of(context).darkBG,
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 53,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).darkBG,
                    image: DecorationImage(
                      fit: BoxFit.fitWidth,
                      image: Image.asset(
                        'assets/images/waves@2x.png',
                      ).image,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                    child: Text(
                      '금융교실을 위한 설정 페이지입니다',
                      style: FlutterFlowTheme.of(context).bodyText2,
                    ),
                  ),
                ],
              ),
            ),
            Form(
              key: formKey,
              autovalidateMode: AutovalidateMode.disabled,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(1, 0, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                            child: Text(
                              '화폐단위명',
                              style: FlutterFlowTheme.of(context).title2,
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(10, 0, 10, 8),
                              child: TextFormField(
                                controller: inputCurrencyNameController,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: '화폐단위명',
                                  hintText: '예) 원, 달러, 엔 ...',
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryColor,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryColor,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  filled: true,
                                  fillColor: FlutterFlowTheme.of(context)
                                      .secondaryColor,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Lexend Deca',
                                      fontSize: 20,
                                    ),
                                validator: (val) {
                                  if (val == null || val.isEmpty) {
                                    return '화폐 단위를 써주세요';
                                  }

                                  return null;
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                          child: Text(
                            '학생 주급',
                            style: FlutterFlowTheme.of(context).title2,
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 0, 10, 8),
                            child: TextFormField(
                              controller: inputWageController,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: '학생 주급',
                                hintText: '자연수로 써주세요',
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryColor,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryColor,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                filled: true,
                                fillColor:
                                    FlutterFlowTheme.of(context).secondaryColor,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Lexend Deca',
                                    fontSize: 20,
                                  ),
                              keyboardType: TextInputType.number,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                          child: Text(
                            '우리반 세율',
                            style: FlutterFlowTheme.of(context).title2,
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 0, 10, 8),
                            child: TextFormField(
                              controller: inputTaxRateController,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: '세율(%)',
                                hintText: '자연수로 써주세요 예) 10',
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryColor,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryColor,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                filled: true,
                                fillColor:
                                    FlutterFlowTheme.of(context).secondaryColor,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Lexend Deca',
                                    fontSize: 20,
                                  ),
                              keyboardType: TextInputType.number,
                              validator: (val) {
                                if (val == null || val.isEmpty) {
                                  return '세율을 자연수로 써주세요';
                                }

                                return null;
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                          child: Text(
                            '예금이율',
                            style: FlutterFlowTheme.of(context).title2,
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 0, 10, 8),
                            child: TextFormField(
                              controller: inputInterstController,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: '예금이자율(%)',
                                hintText: '자연수로 써주세요 예) 10',
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryColor,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryColor,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                filled: true,
                                fillColor:
                                    FlutterFlowTheme.of(context).secondaryColor,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Lexend Deca',
                                    fontSize: 20,
                                  ),
                              keyboardType: TextInputType.number,
                              validator: (val) {
                                if (val == null || val.isEmpty) {
                                  return '예금이자율을 자연수로 써주세요';
                                }

                                return null;
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                          child: Text(
                            '대출이자율',
                            style: FlutterFlowTheme.of(context).title2,
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 0, 10, 8),
                            child: TextFormField(
                              controller: inputBankrateController,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: '대출이자율(%)',
                                hintText: '자연수로 써주세요 예) 10',
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryColor,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryColor,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                filled: true,
                                fillColor:
                                    FlutterFlowTheme.of(context).secondaryColor,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Lexend Deca',
                                    fontSize: 20,
                                  ),
                              keyboardType: TextInputType.number,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                          child: Text(
                            '학생 아이디 규칙',
                            style: FlutterFlowTheme.of(context).title3,
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 0, 10, 8),
                            child: TextFormField(
                              controller: inputClassIDController,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: '학생 아이디 규칙',
                                hintText: '소문자로 써주세요',
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryColor,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryColor,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                filled: true,
                                fillColor:
                                    FlutterFlowTheme.of(context).secondaryColor,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Lexend Deca',
                                    fontSize: 20,
                                  ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                          child: Text(
                            '이메일 도메인',
                            style: FlutterFlowTheme.of(context).title3,
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 0, 10, 8),
                            child: TextFormField(
                              controller: inputClassDomainController,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: '학생 가상 이메일 도메인',
                                hintText: '@***.com 과 같이 써주세요',
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryColor,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryColor,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                filled: true,
                                fillColor:
                                    FlutterFlowTheme.of(context).secondaryColor,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Lexend Deca',
                                    fontSize: 20,
                                  ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Text(
              '우리반 학생 아이디는 ${inputClassIDController.text}번호${inputClassDomainController.text}',
              style: FlutterFlowTheme.of(context).bodyText1,
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 16),
              child: FFButtonWidget(
                onPressed: () async {
                  if (formKey.currentState == null ||
                      !formKey.currentState.validate()) {
                    return;
                  }

                  final classSettingCreateData = {
                    ...createClassSettingRecordData(
                      interest: int.parse(inputInterstController.text),
                      wagePeriod: 7,
                      propertyTradeOption: false,
                      taxRates: int.parse(inputTaxRateController.text),
                      currencyUnitName: inputCurrencyNameController.text,
                      bankRates: int.parse(inputBankrateController.text),
                      loanOption: false,
                      school: valueOrDefault(currentUserDocument?.school, ''),
                      grade: valueOrDefault(currentUserDocument?.grade, ''),
                      ban: valueOrDefault(currentUserDocument?.ban, ''),
                      teacherName: currentUserDisplayName,
                      classID: inputClassIDController.text,
                      classEmailDomain: inputClassDomainController.text,
                      wage: int.parse(inputWageController.text),
                      classAuthInfo:
                          valueOrDefault(currentUserDocument?.userAuthInfo, ''),
                      bankOSPassword: '123456',
                      marketOption: false,
                      marketTrader: '없음',
                    ),
                    'ClassJobList': ['은행원'],
                    'BankOSLog': ['BankOS Operated'],
                    'EssentialJobList': ['마켓관리자'],
                  };
                  await ClassSettingRecord.collection
                      .doc()
                      .set(classSettingCreateData);
                  await Navigator.push(
                    context,
                    PageTransition(
                      type: PageTransitionType.rightToLeft,
                      duration: Duration(milliseconds: 240),
                      reverseDuration: Duration(milliseconds: 240),
                      child: NavBarPage(initialPage: 'Home'),
                    ),
                  );
                },
                text: '변경 내용 저장',
                options: FFButtonOptions(
                  width: 230,
                  height: 50,
                  color: Color(0xFF287969),
                  textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                        fontFamily: 'Lexend Deca',
                        color: FlutterFlowTheme.of(context).white,
                        fontSize: 24,
                      ),
                  elevation: 3,
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 1,
                  ),
                  borderRadius: 8,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
