import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:developer' as dev;

import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shelves_sys/utils/const/app_icons.dart';
import 'package:webview_flutter/webview_flutter.dart';

//screens
part '../../views/test.dart';
part '../../views/sign_in/sign_in.dart';
part '../../views/app_splash.dart';
//route
part '../routes/app_routes.dart';
//theme
part '../theme/app_color.dart';
part '../theme/app_choose_theme.dart';
//svg
part '../svg/app_svg.dart';
//images
part '../const/app_images.dart';
//restart
part '../restart/app_restart.dart';
//manage state
part '../../manage-state/manage_theme.dart';
//components
part '../../views/home/widgets/appbar_home.dart'; 
part '../../views/home/widgets/drawer/drawer_body.dart';
part '../../views/home/widgets/drawer/drawer_a.dart';
part '../../views/home/widgets/drawer/drawer_b.dart';
part '../../views/home/widgets/drawer/drawer_b_component.dart';
part '../../views/home/widgets/drawer/drawer_theme_switch.dart';
part '../../components/web-view/app_webview.dart';
part '../../components/inner_page/inner_page_term.dart';