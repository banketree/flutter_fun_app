package fun.plugin.log;

//class MainActivity : FlutterActivity() {
//        companion object {
//        const val FLUTTER_LOG_CHANNEL = "android_log"
//        }
//
//        override fun onCreate(savedInstanceState: Bundle?) {
//        super.onCreate(savedInstanceState)
//        GeneratedPluginRegistrant.registerWith(this)
//        MethodChannel(flutterView, FLUTTER_LOG_CHANNEL).setMethodCallHandler { call, result ->
//        logPrint(call)
//        }
//        }
//
//private fun logPrint(call: MethodCall) {
//        var tag: String = call.argument("tag")!!
//        var message: String = call.argument("msg")!!
//        when (call.method) {
//        "logV" -> Log.v(tag, message)
//        "logD" -> Log.d(tag, message)
//        "logI" -> Log.i(tag, message)
//        "logW" -> Log.w(tag, message)
//        "logE" -> Log.e(tag, message)
//        }
//        }
//        }
