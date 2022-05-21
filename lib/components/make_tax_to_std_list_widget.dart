import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/make_tax_to_std_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MakeTaxToStdListWidget extends StatefulWidget {
  const MakeTaxToStdListWidget({Key key}) : super(key: key);

  @override
  _MakeTaxToStdListWidgetState createState() => _MakeTaxToStdListWidgetState();
}

class _MakeTaxToStdListWidgetState extends State<MakeTaxToStdListWidget> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
      ),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 1,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primaryBlack,
          boxShadow: [
            BoxShadow(
              blurRadius: 7,
              color: Color(0x5D000000),
              offset: Offset(0, -2),
            )
          ],
          borderRadius: BorderRadius.circular(0),
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
                    '누구에게 세금을 부과하나요?',
                    style: FlutterFlowTheme.of(context).title2,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(5, 20, 5, 0),
                child: AuthUserStreamWidget(
                  child: StreamBuilder<List<StudentsRecord>>(
                    stream: queryStudentsRecord(
                      queryBuilder: (studentsRecord) => studentsRecord.where(
                          'StdAuthInfo',
                          isEqualTo: valueOrDefault(
                                      currentUserDocument?.userAuthInfo, '') !=
                                  ''
                              ? valueOrDefault(
                                  currentUserDocument?.userAuthInfo, '')
                              : null),
                    ),
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
                      List<StudentsRecord> gridViewStudentsRecordList =
                          snapshot.data;
                      return GridView.builder(
                        padding: EdgeInsets.zero,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 2,
                        ),
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: gridViewStudentsRecordList.length,
                        itemBuilder: (context, gridViewIndex) {
                          final gridViewStudentsRecord =
                              gridViewStudentsRecordList[gridViewIndex];
                          return Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).white,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: InkWell(
                              onTap: () async {
                                await showModalBottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  context: context,
                                  builder: (context) {
                                    return Padding(
                                      padding:
                                          MediaQuery.of(context).viewInsets,
                                      child: MakeTaxToStdWidget(
                                        stdRef:
                                            gridViewStudentsRecord.reference,
                                      ),
                                    );
                                  },
                                );
                                Navigator.pop(context);
                              },
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    gridViewStudentsRecord.stdName,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Lexend Deca',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
