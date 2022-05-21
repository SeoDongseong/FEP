import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/alert_essential_job_delete_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../custom_code/actions/index.dart' as actions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ClassJobListSettingWidget extends StatefulWidget {
  const ClassJobListSettingWidget({
    Key key,
    this.stdIncomeListRef,
    this.stdTotalCurrencyRef,
    this.classSettingRef,
  }) : super(key: key);

  final DocumentReference stdIncomeListRef;
  final DocumentReference stdTotalCurrencyRef;
  final DocumentReference classSettingRef;

  @override
  _ClassJobListSettingWidgetState createState() =>
      _ClassJobListSettingWidgetState();
}

class _ClassJobListSettingWidgetState extends State<ClassJobListSettingWidget> {
  TextEditingController inputJobController;
  bool isEssentialJobResult;

  @override
  void initState() {
    super.initState();
    inputJobController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ClassSettingRecord>(
      stream: ClassSettingRecord.getDocument(widget.classSettingRef),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50,
              height: 50,
              child: CircularProgressIndicator(
                color: FlutterFlowTheme.of(context).primaryColor,
              ),
            ),
          );
        }
        final containerClassSettingRecord = snapshot.data;
        return Material(
          color: Colors.transparent,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(0),
              bottomRight: Radius.circular(0),
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 600,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryColor,
              boxShadow: [
                BoxShadow(
                  blurRadius: 7,
                  color: Color(0x5D000000),
                  offset: Offset(0, -2),
                )
              ],
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(0),
                bottomRight: Radius.circular(0),
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 20, 16, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        '학급 직업 정보',
                        style: FlutterFlowTheme.of(context).title2,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 4, 16, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        '학급 직업을 추가하거나 삭제합니다.',
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Lexend Deca',
                              color: FlutterFlowTheme.of(context).primaryText,
                            ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 25, 0, 25),
                  child: Text(
                    '우리반 학생 직업 목록',
                    style: FlutterFlowTheme.of(context).subtitle1.override(
                          fontFamily: 'Lexend Deca',
                          color: FlutterFlowTheme.of(context).white,
                        ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Color(0xFFEEEEEE),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Builder(
                    builder: (context) {
                      final jobListView = containerClassSettingRecord
                              .classJobList
                              .toList()
                              ?.toList() ??
                          [];
                      return Column(
                        mainAxisSize: MainAxisSize.max,
                        children: List.generate(jobListView.length,
                            (jobListViewIndex) {
                          final jobListViewItem = jobListView[jobListViewIndex];
                          return Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Color(0xFFEEEEEE),
                            ),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    jobListViewItem,
                                    style: FlutterFlowTheme.of(context)
                                        .subtitle1
                                        .override(
                                          fontFamily: 'Lexend Deca',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                  ),
                                  FlutterFlowIconButton(
                                    borderColor: Colors.transparent,
                                    borderRadius: 30,
                                    borderWidth: 1,
                                    buttonSize: 60,
                                    icon: Icon(
                                      Icons.cancel_sharp,
                                      color: Colors.black,
                                      size: 30,
                                    ),
                                    onPressed: () async {
                                      isEssentialJobResult =
                                          await actions.isThisEssentialJob(
                                        containerClassSettingRecord
                                            .essentialJobList
                                            .toList(),
                                        jobListViewItem,
                                      );
                                      if ((isEssentialJobResult) == false) {
                                        final classSettingUpdateData = {
                                          'ClassJobList':
                                              FieldValue.arrayRemove(
                                                  [jobListViewItem]),
                                        };
                                        await containerClassSettingRecord
                                            .reference
                                            .update(classSettingUpdateData);
                                      } else {
                                        await showModalBottomSheet(
                                          isScrollControlled: true,
                                          backgroundColor: Colors.transparent,
                                          context: context,
                                          builder: (context) {
                                            return Padding(
                                              padding: MediaQuery.of(context)
                                                  .viewInsets,
                                              child:
                                                  AlertEssentialJobDeleteWidget(),
                                            );
                                          },
                                        );
                                        Navigator.pop(context);
                                      }

                                      setState(() {});
                                    },
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(30, 20, 30, 10),
                  child: TextFormField(
                    controller: inputJobController,
                    onChanged: (_) => EasyDebounce.debounce(
                      'inputJobController',
                      Duration(milliseconds: 2000),
                      () => setState(() {}),
                    ),
                    autofocus: true,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: '직업',
                      hintText: '추가할 직업을 써주세요',
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      filled: true,
                      fillColor: FlutterFlowTheme.of(context).white,
                      suffixIcon: inputJobController.text.isNotEmpty
                          ? InkWell(
                              onTap: () => setState(
                                () => inputJobController?.clear(),
                              ),
                              child: Icon(
                                Icons.clear,
                                color: Color(0xFF757575),
                                size: 22,
                              ),
                            )
                          : null,
                    ),
                    style: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily: 'Lexend Deca',
                          color: FlutterFlowTheme.of(context).primaryText,
                        ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FFButtonWidget(
                        onPressed: () async {
                          final classSettingUpdateData = {
                            'ClassJobList': FieldValue.arrayUnion(
                                [inputJobController.text]),
                          };
                          await containerClassSettingRecord.reference
                              .update(classSettingUpdateData);
                          setState(() {
                            inputJobController?.clear();
                          });
                        },
                        text: '직업 추가',
                        options: FFButtonOptions(
                          width: 130,
                          height: 50,
                          color: FlutterFlowTheme.of(context).primaryColor,
                          textStyle:
                              FlutterFlowTheme.of(context).subtitle2.override(
                                    fontFamily: 'Lexend Deca',
                                    color: Colors.white,
                                  ),
                          elevation: 3,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1,
                          ),
                          borderRadius: 8,
                        ),
                      ),
                      FFButtonWidget(
                        onPressed: () async {
                          Navigator.pop(context);
                        },
                        text: '돌아가기',
                        options: FFButtonOptions(
                          width: 130,
                          height: 50,
                          color: FlutterFlowTheme.of(context).tertiaryColor,
                          textStyle:
                              FlutterFlowTheme.of(context).subtitle2.override(
                                    fontFamily: 'Lexend Deca',
                                    color: Colors.white,
                                  ),
                          elevation: 3,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1,
                          ),
                          borderRadius: 8,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
