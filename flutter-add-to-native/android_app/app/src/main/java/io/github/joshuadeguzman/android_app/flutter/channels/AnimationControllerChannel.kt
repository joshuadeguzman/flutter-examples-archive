package io.github.joshuadeguzman.android_app.flutter.channels

import android.util.Log
import io.flutter.plugin.common.*
import java.lang.RuntimeException

/**
 * Created by Joshua de Guzman on 2019-08-19.
 */
class AnimationControllerChannel(
    private var binaryMessenger: BinaryMessenger
) : IFlutterChannel {

    companion object {
        val TAG = AnimationControllerChannel::class.java.simpleName
        private const val CHANNEL_NAME = "animationControllerChannel"
    }

    private var channel: BasicMessageChannel<Any>? = null
    private var codec: StandardMessageCodec = StandardMessageCodec.INSTANCE

    override fun setupWithMessenger() {
        channel = BasicMessageChannel(binaryMessenger, CHANNEL_NAME, codec)
    }

    override fun setupMessageHandler(onSuccess: (String) -> Unit, onError: (Throwable?) -> Unit) {
        channel?.setMessageHandler { message, reply ->
            // TODO
        }
            ?: onError.invoke(RuntimeException("Channel messenger not yet initialized, please ensure that you invoked setupWithMessenger()"))
    }

    override fun sendChannelMessage(message: Any) {
        Log.d(TAG, "Sending message...")
        channel?.send(message) {
            Log.d(TAG, "Message: $it sent!")
        }
    }
}