package io.github.joshuadeguzman.android_app

import android.os.Bundle
import android.util.Log
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.fragment.app.Fragment
import kotlinx.android.synthetic.main.fragment_main.*

/**
 * Created by Joshua de Guzman on 2019-08-19.
 */
class MainFragment : Fragment() {

    private var embeddedFlutterViewFragment: EmbeddedFlutterViewFragment? = null
    private var embeddedFlutterFragment: EmbeddedFlutterFragment? = null

    companion object {
        var TAG = MainFragment::class.java.simpleName
        fun newInstance() = MainFragment()
    }

    override fun onCreateView(inflater: LayoutInflater, container: ViewGroup?, savedInstanceState: Bundle?): View? {
        return inflater.inflate(R.layout.fragment_main, container, false)
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)

        // Handle bottom navigation
        navigation.setOnNavigationItemSelectedListener {
            when (it.itemId) {
                R.id.action_embed_1 -> this.loadEmbeddingFlutterViewFragment()
                R.id.action_embed_2 -> this.loadEmbeddingFragment()
            }
            true
        }

        // Show initial view
        this.loadEmbeddingFlutterViewFragment()
    }

    /**
     * This view shows how you can display Native Android UI and Flutter views side by side inside one screen.
     */
    private fun loadEmbeddingFlutterViewFragment() {
        Log.d(TAG, "Embedded FlutterView")
        embeddedFlutterViewFragment = EmbeddedFlutterViewFragment.newInstance()
        embeddedFlutterViewFragment?.let {
            val fragmentTransaction = activity?.supportFragmentManager?.beginTransaction()
            fragmentTransaction?.replace(R.id.embeddedFragment, it, EmbeddedFlutterViewFragment.TAG)
            fragmentTransaction?.commitAllowingStateLoss()
        }
    }

    /**
     * This embedded Flutter fragment shows how you can control the switching of views in a Flutter code
     * using a custom route channel for embedded views inside a Native Android UI view.
     */
    private fun loadEmbeddingFragment() {
        Log.d(TAG, "Embedded Fragment")
        embeddedFlutterFragment = EmbeddedFlutterFragment.newInstance()
        embeddedFlutterFragment?.let {
            val fragmentTransaction = activity?.supportFragmentManager?.beginTransaction()
            fragmentTransaction?.replace(R.id.embeddedFragment, it, EmbeddedFlutterFragment.TAG)
            fragmentTransaction?.commitAllowingStateLoss()
        }
    }
}
