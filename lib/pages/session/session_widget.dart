import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
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
                  _model.licenseInfoAction = await actions.fGetLicenseInfo(
                    _model.cortexToken!,
                  );
                  setState(() {
                    _model.licenseInfo = functions
                        .getLicenseHasEEG(_model.licenseInfoAction!)
                        .toString();
                  });
                  _model.subscribeAction = await actions.gSubscribe(
                    _model.cortexToken!,
                    _model.headsetId!,
                  );
                  setState(() {
                    _model.subscribedStream = valueOrDefault<String>(
                      (_model.subscribeAction?.toMap())?.toString(),
                      'error',
                    );
                    _model.eeg = _model.subscribeAction;
                  });
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
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: const Icon(
              Icons.arrow_back_rounded,
              color: Colors.white,
              size: 30.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: Text(
            'Page Title',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Outfit',
                  color: Colors.white,
                  fontSize: 22.0,
                ),
          ),
          actions: const [],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SelectionArea(
                    child: Text(
                  'Current Headset: ${_model.headsetId}',
                  style: FlutterFlowTheme.of(context).titleLarge,
                )),
                SelectionArea(
                    child: AutoSizeText(
                  'CortexToken: ${_model.cortexToken}',
                  style: FlutterFlowTheme.of(context).titleLarge,
                  minFontSize: 5.0,
                )),
                SelectionArea(
                    child: Text(
                  'License Info: ${_model.licenseInfo}',
                  style: FlutterFlowTheme.of(context).titleLarge,
                )),
                SelectionArea(
                    child: AutoSizeText(
                  'Subscribe: ${_model.subscribedStream}',
                  style: FlutterFlowTheme.of(context).titleLarge,
                  minFontSize: 5.0,
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
