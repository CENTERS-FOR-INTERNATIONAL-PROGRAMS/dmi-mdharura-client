import 'package:flutter_dotenv/flutter_dotenv.dart';

String kBaseApiUrl = dotenv.env['BASE_API_URL']!;

String kAppName = dotenv.env['APP_NAME']!;

String kAppId = dotenv.env['APP_ID']!;

String kSmsShortCode = dotenv.env['SMS_SHORT_CODE']!;

String kSmsPrefix =
    dotenv.env['SMS_PREFIX'] == null ? '' : '${dotenv.env['SMS_PREFIX']} ';
