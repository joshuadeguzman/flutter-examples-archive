package io.github.joshuadeguzman.android_app

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.SeekBar
import androidx.fragment.app.Fragment
import io.flutter.view.FlutterMain
import io.flutter.view.FlutterNativeView
import io.flutter.view.FlutterRunArguments
import io.flutter.view.FlutterView
import io.github.joshuadeguzman.android_app.flutter.channels.FlareControllerChannel
import io.flutter.plugins.GeneratedPluginRegistrant
import io.github.joshuadeguzman.android_app.protos.FlareControllerAmountOuterClass
import kotlinx.android.synthetic.main.fragment_embedded_flutter_example.*

/**
 * Created by Joshua de Guzman on 2019-10-16.
 */
class EmbeddedFlutterFragment : Fragment() {

    private var flareControllerChannel: FlareControllerChannel? = null
    private var flutterView: FlutterView? = null

    private var rockAmount = 0.0
    private var speed = 0.0

    companion object {
        var TAG = EmbeddedFlutterFragment::class.java.simpleName
        fun newInstance() = EmbeddedFlutterFragment()
    }

    override fun onCreateView(inflater: LayoutInflater, container: ViewGroup?, savedInstanceState: Bundle?): View? {
        return inflater.inflate(R.layout.fragment_embedded_flutter_example, container, false)
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)

        this.loadFlutterFragment()
    }

    private fun loadFlutterFragment() {
        // TODO: Check Flutter v1.9.x changes
        FlutterMain.startInitialization(activity!!.applicationContext)
        FlutterMain.ensureInitializationComplete(activity!!.applicationContext, null)

        // Run FlutterView on a custom dart entry point
        val nativeView = FlutterNativeView(activity!!)
        flutterView = FlutterView(activity, null, nativeView)
        val arguments = FlutterRunArguments()
        arguments.bundlePath = FlutterMain.findAppBundlePath(activity!!.applicationContext)
        arguments.entrypoint = "embeddedMain"
        flutterView?.setInitialRoute("/")
        flutterView?.runFromBundle(arguments)
        GeneratedPluginRegistrant.registerWith(flutterView!!.pluginRegistry)

        // Setup routes channel
        flareControllerChannel = FlareControllerChannel(flutterView!!)
        flareControllerChannel?.setupWithMessenger()

        // Initialize FlutterView channel
        flutterView?.let {
            flutterContainerView.addView(it)
        }

        // Subscribe to seekbar changes
        rangeRockAmount.setOnSeekBarChangeListener(object : SeekBar.OnSeekBarChangeListener {
            override fun onProgressChanged(p0: SeekBar?, p1: Int, p2: Boolean) {
                rockAmount = p1.toDouble() / 100
                sendFlareAmountUpdate()
            }

            override fun onStartTrackingTouch(p0: SeekBar?) {
                //
            }

            override fun onStopTrackingTouch(p0: SeekBar?) {
                //
            }
        })

        rangeSpeed.setOnSeekBarChangeListener(object : SeekBar.OnSeekBarChangeListener {
            override fun onProgressChanged(p0: SeekBar?, p1: Int, p2: Boolean) {
                speed = p1.toDouble() / 100
                sendFlareAmountUpdate()
            }

            override fun onStartTrackingTouch(p0: SeekBar?) {
                //
            }

            override fun onStopTrackingTouch(p0: SeekBar?) {
                //
            }
        })
    }

    private fun sendFlareAmountUpdate() {
        val amount = FlareControllerAmountOuterClass.FlareControllerAmount.newBuilder()
            .setRockAmount(rockAmount)
            .setSpeed(speed)
            .build()
            .toByteArray()

        flareControllerChannel?.sendChannelMessage(amount)
    }
}