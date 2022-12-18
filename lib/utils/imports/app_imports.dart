import 'dart:io';
import 'dart:async';
// import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/scheduler.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:developer' as dev;
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;
import 'package:validators/validators.dart' as valid;
import 'package:path_provider/path_provider.dart' as dir;

import 'package:provider/single_child_widget.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shelves_sys/utils/const/app_icons.dart';
import 'package:webview_flutter/webview_flutter.dart';

//screens
part '../../views/sign_in/sign_in.dart';
part '../../views/sign_in/verify_email.dart';
part '../../views/app_splash.dart';
part '../../views/shelf list/shelf_list.dart';
part '../../views/connection/connect.dart';
part '../../views/sign_in/sign_up.dart';
part '../../views/edit shelf/shelf_settings.dart';
part '../../views/staff/staff_list.dart';
part '../../views/notifications/notifications_list.dart';
part '../../views/sign_in/warpper.dart';
// DB
part '../database/tables/table_shelves.dart';
part '../database/model/model_shelves.dart';
part '../database/build/query_shelves.dart';
part '../database/config/init_db.dart';
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
// grid views
part '../../components/grid_view/shelf_gridview.dart';
part '../../components/grid_view/staff_gridview.dart';
part '../../components/grid_view/notification_gridview.dart';
//API
part '../../api/api_handel.dart';
part '../../api/api.dart';
// controllers
part '../../controllers/api_controller.dart';
part '../../controllers/theme_controller.dart';
part '../../controllers/auth_controller.dart';
part '../../controllers/providers.dart';
part '../../controllers/database_controller.dart';
part '../../controllers/firebase_controller.dart';
//models
part '../../model/accounts/model_account.dart';
part '../../model/staffs/model_staff.dart';
part '../../model/staffs/model_staff_list.dart';
part '../../model/shelf/model_shelf.dart';
part '../../model/shelf/model_shelf_list.dart';
part '../../model/notifications/model_notification.dart';
part '../../model/notifications/model_notification_list.dart';
//cards
part '../../components/cards/shelf_card.dart';
part '../../components/cards/staff_card.dart';
part '../../components/cards/simple_notification_card.dart';
//components
part '../../views/home/widgets/drawer/drawer_body.dart';
part '../../views/home/widgets/drawer/drawer_a.dart';
part '../../views/home/widgets/drawer/drawer_b.dart';
part '../../views/home/widgets/drawer/drawer_b_component.dart';
part '../../views/home/widgets/drawer/drawer_theme_switch.dart';
part '../../components/web-view/app_webview.dart';
part '../../components/inner_page/inner_page_term.dart';
part '../../components/loading/enum_loading.dart';
part '../../components/my textfield/my_textfield.dart';
part '../../components/custom-toast/toast.dart';
part '../../components/my richtext/my_rich_text.dart';
part '../../utils/validators/app_validators.dart';
part '../../components/config_material.dart';
