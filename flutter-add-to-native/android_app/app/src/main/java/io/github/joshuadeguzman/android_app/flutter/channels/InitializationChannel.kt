package io.github.joshuadeguzman.android_app.flutter.channels

import io.flutter.plugin.common.*
import java.lang.RuntimeException

/**
 * Created by Joshua de Guzman on 2019-08-19.
 */

class InitializationChannel(
    private var binaryMessenger: BinaryMessenger
) : IFlutterChannel {

    companion object {
        val TAG = InitializationChannel::class.java.simpleName
        private const val CHANNEL_NAME = "initializationChannel"
    }

    private var channel: MethodChannel? = null
    private var codec: MethodCodec = StandardMethodCodec.INSTANCE

    override fun setupWithMessenger() {
        channel = MethodChannel(binaryMessenger, CHANNEL_NAME, codec)
    }

    override fun setupMessageHandler(onSuccess: (String) -> Unit, onError: (Throwable?) -> Unit) {
        channel?.setMethodCallHandler { methodCall, _ ->
            when (methodCall.method) {
                "initialized" -> {
                    onSuccess.invoke("Initialized successfully")
                }
            }
        }
            ?: onError.invoke(RuntimeException("Channel messenger not yet initialized, please ensure that you invoked setupWithMessenger()"))
    }
}