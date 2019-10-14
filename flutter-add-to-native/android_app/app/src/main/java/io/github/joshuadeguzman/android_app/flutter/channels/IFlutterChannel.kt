package io.github.joshuadeguzman.android_app.flutter.channels

/**
 * Created by Joshua de Guzman on 2019-08-19.
 */
interface IFlutterChannel {
    fun setupWithMessenger()
    fun setupMessageHandler(onSuccess: (String) -> Unit, onError: (Throwable?) -> Unit)
    fun sendChannelMessage(message: Any) {}
}