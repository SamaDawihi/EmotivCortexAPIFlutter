import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'session_model.dart';
export 'session_model.dart';

class SessionWidget extends StatefulWidget {
  const SessionWidget({super.key});

  @override
  State<SessionWidget> createState() => _SessionWidgetState();
}

class _SessionWidgetState extends State<SessionWidget> {
  late SessionModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SessionModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.getCortexInfoCopy = await actions.aGetCortexInfo();
      if (functions.getEmotivIsInstalled(_model.getCortexInfoCopy!)) {
        _model.getUserLogin = await actions.aGetUserLogin();
        if (functions.getIsUserLogedIn(_model.getUserLogin!)) {
          _model.hasAccessRightCopy = await actions.cHasAccessRight(
            FFAppState().clientId,
            FFAppState().clientSecret,
          );
          if (functions.getHasAccessRight(_model.hasAccessRightCopy!)) {
            _model.queryHeadsetsCopy = await actions.dQueryHeadset();
            if (functions
                    .getAvailableHeadsetId(_model.queryHeadsetsCopy!).isNotEmpty) {
              if (FFAppState().defaultHeadset != '') {
                if (functions
                    .getAvailableHeadsetId(_model.queryHeadsetsCopy!)
                    .contains(FFAppState().defaultHeadset)) {
                  setState(() {
                    _model.headsetId = FFAppState().defaultHeadset;
                  });
                  _model.authorizeAction = await actions.eAuthorize(
                    FFAppState().clientId,
                    FFAppState().clientSecret,
                  );
                  setState(() {
                    _model.cortexToken =
                        functions.getCortexToken(_model.authorizeAction!);
                  });
                  _model.subscribeAction = await actions.hSubscribeMet(
                    functions.getCortexToken(_model.authorizeAction!),
                    _model.headsetId!,
                  );
                  setState(() {
                    _model.subscribedStream = valueOrDefault<String>(
                      (_model.subscribeAction?.toMap())?.toString(),
                      'error',
                    );
                  });
                  if (_model.subscribeAction!.engagementSet &&
                      _model.subscribeAction!.interestSet) {
                    setState(() {
                      _model.predictedEmotion = functions.emotionByArVal(
                          _model.subscribeAction!.engagement,
                          _model.subscribeAction!.interest);
                      _model.checkingConditions = false;
                    });
                    _model.imageId = await GetImgIdCall.call(
                      prompt: functions.createDescription(
                          _model.predictedEmotion!,
                          FFAppState().disabledProfile),
                    );
                    if ((_model.imageId?.succeeded ?? true)) {
                      setState(() {
                        _model.status =
                            'imageID: ${(_model.imageId?.jsonBody ?? '').toString()}';
                      });
                      _model.timerController.onStartTimer();
                      await Future.delayed(const Duration(milliseconds: 30000));
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'End Waiting',
                            style: TextStyle(
                              color: FlutterFlowTheme.of(context).primaryText,
                            ),
                          ),
                          duration: const Duration(milliseconds: 4000),
                          backgroundColor:
                              FlutterFlowTheme.of(context).secondary,
                        ),
                      );
                      _model.returnedImage = await GetImgCall.call(
                        id: GetImgIdCall.id(
                          (_model.imageId?.jsonBody ?? ''),
                        ),
                      );
                      if ((_model.returnedImage?.succeeded ?? true)) {
                        setState(() {
                          _model.status = 'image returned';
                          _model.addToImagePath(GetImgCall.imagePath(
                            (_model.returnedImage?.jsonBody ?? ''),
                          )!
                              .first
                              .toString());
                        });
                      } else {
                        setState(() {
                          _model.status = 'no image returned';
                        });
                      }
                    } else {
                      setState(() {
                        _model.status = 'cannot get image id';
                      });
                    }
                  } else {
                    setState(() {
                      _model.predictedEmotion =
                          'Failed to detect due to low EEG quality';
                    });
                  }

                  return;
                } else {
                  var confirmDialogResponse = await showDialog<bool>(
                        context: context,
                        builder: (alertDialogContext) {
                          return AlertDialog(
                            title: const Text('Default Headset Is Not Connected'),
                            content: Text(
                                'Your Default Headset ${FFAppState().defaultHeadset} Is Not Connected Do You Want To Proceed?'),
                            actions: [
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(alertDialogContext, false),
                                child: const Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(alertDialogContext, true),
                                child: const Text('Confirm'),
                              ),
                            ],
                          );
                        },
                      ) ??
                      false;
                  if (confirmDialogResponse) {
                    setState(() {
                      _model.headsetId = functions
                          .getAvailableHeadsetId(_model.queryHeadsetsCopy!)
                          .first;
                    });
                    return;
                  } else {
                    context.safePop();
                    return;
                  }
                }
              } else {
                setState(() {
                  _model.headsetId = functions
                      .getAvailableHeadsetId(_model.queryHeadsetsCopy!)
                      .first;
                });
                return;
              }
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'no Available Headset',
                    style: TextStyle(
                      color: FlutterFlowTheme.of(context).primaryText,
                    ),
                  ),
                  duration: const Duration(milliseconds: 4000),
                  backgroundColor: FlutterFlowTheme.of(context).secondary,
                ),
              );
              await showDialog(
                context: context,
                builder: (alertDialogContext) {
                  return AlertDialog(
                    title: const Text('Error'),
                    content: const Text('Check in the BCI Settting  Page First'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(alertDialogContext),
                        child: const Text('BCI Settings'),
                      ),
                    ],
                  );
                },
              );

              context.goNamed('SetBciConnection');

              return;
            }
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'Access Right Isnt Granted, Click Request Access',
                  style: TextStyle(
                    color: FlutterFlowTheme.of(context).primaryText,
                  ),
                ),
                duration: const Duration(milliseconds: 4000),
                backgroundColor: FlutterFlowTheme.of(context).error,
              ),
            );
            await showDialog(
              context: context,
              builder: (alertDialogContext) {
                return AlertDialog(
                  title: const Text('Error'),
                  content: const Text('Check in the BCI Settting  Page First'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(alertDialogContext),
                      child: const Text('BCI Settings'),
                    ),
                  ],
                );
              },
            );

            context.goNamed('SetBciConnection');

            return;
          }
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'User Is Not Logged in',
                style: TextStyle(
                  color: FlutterFlowTheme.of(context).primaryText,
                ),
              ),
              duration: const Duration(milliseconds: 4000),
              backgroundColor: FlutterFlowTheme.of(context).error,
            ),
          );
          await showDialog(
            context: context,
            builder: (alertDialogContext) {
              return AlertDialog(
                title: const Text('Error'),
                content: const Text('Check in the BCI Settting  Page First'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(alertDialogContext),
                    child: const Text('BCI Settings'),
                  ),
                ],
              );
            },
          );

          context.goNamed('SetBciConnection');

          return;
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Emotive Launcher Is not installed',
              style: TextStyle(
                color: FlutterFlowTheme.of(context).primaryText,
              ),
            ),
            duration: const Duration(milliseconds: 4000),
            backgroundColor: FlutterFlowTheme.of(context).error,
          ),
        );
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return AlertDialog(
              title: const Text('Error'),
              content: const Text('Check in the BCI Settting  Page First'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(alertDialogContext),
                  child: const Text('BCI Settings'),
                ),
              ],
            );
          },
        );

        context.goNamed('SetBciConnection');

        return;
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                      alignment: const AlignmentDirectional(-1.0, 0.0),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(50.0, 0.0, 0.0, 0.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            'assets/images/image-removebg-preview.png',
                            width: 80.0,
                            height: 80.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: FlutterFlowTimer(
                        initialTime: _model.timerMilliseconds,
                        getDisplayTime: (value) =>
                            StopWatchTimer.getDisplayTime(
                          value,
                          hours: false,
                          milliSecond: false,
                        ),
                        controller: _model.timerController,
                        updateStateInterval: const Duration(milliseconds: 1000),
                        onChanged: (value, displayTime, shouldUpdate) {
                          _model.timerMilliseconds = value;
                          _model.timerValue = displayTime;
                          if (shouldUpdate) setState(() {});
                        },
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).headlineSmall,
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 50.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Align(
                            alignment: const AlignmentDirectional(1.0, 0.0),
                            child: FFButtonWidget(
                              onPressed: () {
                                print('Button pressed ...');
                              },
                              text: 'Terminate',
                              options: FFButtonOptions(
                                height: 40.0,
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 24.0, 0.0),
                                iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).error,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color: Colors.white,
                                    ),
                                elevation: 3.0,
                                borderSide: const BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                                hoverColor: const Color(0xFFDE1818),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                  child: Builder(
                    builder: (context) {
                      if (_model.checkingConditions) {
                        return Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 50.0),
                                  child: Lottie.network(
                                    'https://lottie.host/41f11af0-b4b1-4446-af42-78c509770079/PCX2v5gJny.json',
                                    width: 300.0,
                                    height: 130.0,
                                    fit: BoxFit.cover,
                                    animate: true,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              'Processing ...',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    fontSize: 30.0,
                                    fontWeight: FontWeight.w800,
                                  ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 300.0),
                              child: Text(
                                'Thank you for your patience',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      fontSize: 18.0,
                                    ),
                              ),
                            ),
                          ].divide(const SizedBox(height: 15.0)),
                        );
                      } else {
                        return Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Stack(
                                  children: [
                                    if (_model.imagePath.length > 2)
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        child: Image.network(
                                          valueOrDefault<String>(
                                            _model.imagePath[
                                                _model.imagePath.length - 2],
                                            'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/amygdala-c3do0w/assets/eep0xg5cq6pa/Screenshot_2023-11-28_150737.png',
                                          ),
                                          width: 500.0,
                                          height: 500.0,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    if (_model.imagePath.length > 1)
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            30.0, 30.0, 0.0, 0.0),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                          child: Image.network(
                                            valueOrDefault<String>(
                                              _model.imagePath.last,
                                              'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/amygdala-c3do0w/assets/1yxux439o1gv/Screenshot_2023-11-28_150600.png',
                                            ),
                                            width: 500.0,
                                            height: 500.0,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 30.0, 0.0, 0.0),
                              child: Text(
                                'Ali is ${_model.predictedEmotion}',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      fontSize: 30.0,
                                      fontWeight: FontWeight.w800,
                                    ),
                              ),
                            ),
                          ],
                        );
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
