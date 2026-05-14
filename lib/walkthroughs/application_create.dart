import 'package:flutter/material.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

import '/walkthrough/walkthrough_windows/walkthrough_windows_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';

// Focus widget keys for this walkthrough
final buttonDh6s4f98 = GlobalKey();
final button30hl1b0z = GlobalKey();
final buttonExcjs952 = GlobalKey();

/// ApplicationCreate
///
/// описание тестовая инструкция
List<TargetFocus> createWalkthroughTargets(BuildContext context) => [
      /// Step 1: a
      TargetFocus(
        keyTarget: buttonDh6s4f98,
        enableOverlayTab: true,
        alignSkip: Alignment.topCenter,
        shape: ShapeLightFocus.RRect,
        color: FlutterFlowTheme.of(context).accent1,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, __) => WalkthroughWindowsWidget(
              heder: 'Нажмите кнопку создания заявки',
              text: 'Поясняющий текст или какаято инструкция ',
            ),
          ),
        ],
      ),

      /// Step 2
      TargetFocus(
        keyTarget: button30hl1b0z,
        enableOverlayTab: true,
        alignSkip: Alignment.topCenter,
        shape: ShapeLightFocus.Circle,
        color: FlutterFlowTheme.of(context).accent1,
        contents: [
          TargetContent(
            align: ContentAlign.right,
            builder: (context, __) => WalkthroughWindowsWidget(
              heder: 'Вкладки сортировки заявок',
              text: '',
            ),
          ),
        ],
      ),

      /// Step 3
      TargetFocus(
        keyTarget: buttonExcjs952,
        enableOverlayTab: true,
        alignSkip: Alignment.topCenter,
        shape: ShapeLightFocus.Circle,
        color: FlutterFlowTheme.of(context).accent1,
        contents: [
          TargetContent(
            align: ContentAlign.right,
            builder: (context, __) => WalkthroughWindowsWidget(
              heder: 'Любой текст',
            ),
          ),
        ],
      ),
    ];
