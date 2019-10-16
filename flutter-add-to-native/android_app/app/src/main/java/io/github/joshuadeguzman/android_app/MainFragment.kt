package io.github.joshuadeguzman.android_app

import android.os.Bundle
import android.util.Log
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.fragment.app.Fragment
import io.flutter.view.FlutterView
import io.github.joshuadeguzman.FruitsEmbeddedChannelMessageOuterClass
import io.github.joshuadeguzman.UserOuterClass
import io.github.joshuadeguzman.android_app.flutter.channels.InitializationChannel
import io.github.joshuadeguzman.android_app.flutter.channels.RouteChannel
import io.flutter.plugins.GeneratedPluginRegistrant
import io.flutter.view.FlutterMain
import io.flutter.view.FlutterNativeView
import io.flutter.view.FlutterRunArguments
import kotlinx.android.synthetic.main.fragment_main.*

/**
 * Created by Joshua de Guzman on 2019-08-19.
 */
class MainFragment : Fragment() {

    private var initializationChannel: InitializationChannel? = null
    private var routeChannel: RouteChannel? = null
    private var flutterView: FlutterView? = null

    companion object {
        var TAG = MainFragment::class.java.simpleName
        fun newInstance() = MainFragment()
    }

    override fun onCreateView(inflater: LayoutInflater, container: ViewGroup?, savedInstanceState: Bundle?): View? {
        return inflater.inflate(R.layout.fragment_main, container, false)
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)
        this.loadFlutterFragment()
    }

    private fun loadFlutterFragment() {
        // TODO: Migrate this to a reusable based custom Flutter main file
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

        // Setup initialization channel
        initializationChannel = InitializationChannel(flutterView!!)
        initializationChannel?.setupWithMessenger()

        // Setup routes channel
        routeChannel = RouteChannel(flutterView!!)
        routeChannel?.setupWithMessenger()

        // Initialize FlutterView channel
        this.initializeFlutterView()

        // TODO: BottomNavBar
        // btFruits.setOnClickListener {
        //    this.loadFlutterView("/embeddedFruits")
        //}

        // TODO: BottomNavBar
        // btVegetables.setOnClickListener {
        //    this.loadFlutterView("/embeddedVegetables")
        // }
    }

    private fun initializeFlutterView() {
        flutterView?.let {
            initializationChannel?.setupMessageHandler({ message ->
                Log.d(TAG, "Message from Flutter $message")

                // Inflate FlutterView
                flutterContainerView.addView(it)

                // Update visibility of android layout groups
                mainView.visibility = View.VISIBLE
                emptyView.visibility = View.GONE
            }, { error ->
                Log.e(TAG, "Error message from Flutter ${error?.localizedMessage}")

                // Update visibility of android layout groups
                mainView.visibility = View.GONE
                emptyView.visibility = View.VISIBLE
            })
        }
    }

    private fun loadFlutterView(route: String) {
        // Route
        val user = UserOuterClass.User.newBuilder()
            .setId(1)
            .setUsername("joshuadeguzman")
            .setFirstName("Joshua")
            .setLastName("de Guzman")
            .build()

        val message = FruitsEmbeddedChannelMessageOuterClass.FruitsEmbeddedChannelMessage.newBuilder()
            .setRoute(route)
            .setUser(user)
            .setIsOwnProfile(true)
            .build()
            .toByteArray()

        routeChannel?.sendChannelMessage(message)
    }
}