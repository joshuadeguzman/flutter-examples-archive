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

    private var eventFragment: EventFragment? = null
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

        // Initialize fragments
        this.loadCalendarFragment()
        this.loadEmbeddedFlutterFragment()

        // Handle bottom navigation
        navigation.setOnNavigationItemSelectedListener {
            when (it.itemId) {
                R.id.action_event -> this.showEvent()
                R.id.action_agenda -> this.showAgenda()
                R.id.action_history -> this.showHistory()
            }
            true
        }

        // Show initial view
        this.showEvent()
    }

    /**
     * This calendar fragment shows how you can display Native Android UI and Flutter views side by side inside one screen.
     */
    private fun loadCalendarFragment() {
        eventFragment = EventFragment.newInstance()

        eventFragment?.let {
            val fragmentTransaction = activity?.supportFragmentManager?.beginTransaction()
            fragmentTransaction?.replace(R.id.fragmentEvent, it, EventFragment.TAG)
            fragmentTransaction?.commitAllowingStateLoss()
        }
    }

    /**
     * This embedded Flutter fragment shows how you can control the switching of views in a Flutter code
     * using a custom route channel for embedded views inside a Native Android UI view.
     */
    private fun loadEmbeddedFlutterFragment() {
        embeddedFlutterFragment = EmbeddedFlutterFragment.newInstance()

        embeddedFlutterFragment?.let {
            val fragmentTransaction = activity?.supportFragmentManager?.beginTransaction()
            fragmentTransaction?.replace(R.id.fragmentEmbeddedFlutter, it, EmbeddedFlutterFragment.TAG)
            fragmentTransaction?.commitAllowingStateLoss()
        }
    }

    private fun showEvent() {
        Log.d(TAG, "Event")
        this.showEventFragment()
    }

    private fun showAgenda() {
        Log.d(TAG, "Agenda")
        this.showEmbeddedFlutterFragment()
    }

    private fun showHistory() {
        Log.d(TAG, "History")
        this.showEmbeddedFlutterFragment()
    }

    private fun showEventFragment() {
        fragmentEmbeddedFlutter.visibility = View.GONE
        fragmentEvent.visibility = View.VISIBLE
    }

    private fun showEmbeddedFlutterFragment() {
        fragmentEmbeddedFlutter.visibility = View.VISIBLE
        fragmentEvent.visibility = View.GONE
    }
}
