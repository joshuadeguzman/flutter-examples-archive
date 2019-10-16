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

    private var calendarFragment: CalendarFragment? = null
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
                R.id.action_agenda -> this.showAgenda()
                R.id.action_calendar -> this.showCalendar()
                R.id.action_history -> this.showHistory()
            }
            true
        }
    }

    /**
     * This calendar fragment shows how you can display Native Android UI and Flutter views side by side inside one screen.
     */
    private fun loadCalendarFragment() {
        calendarFragment = CalendarFragment.newInstance()

        calendarFragment?.let {
            val fragmentTransaction = activity?.supportFragmentManager?.beginTransaction()
            fragmentTransaction?.replace(R.id.fragmentCalendar, it, CalendarFragment.TAG)
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

    private fun showAgenda() {
        Log.d(TAG, "Agenda")
        showEmbeddedFlutterFragment()
    }

    private fun showCalendar() {
        Log.d(TAG, "Calendar")
        showCalendarFragment()
    }

    private fun showHistory() {
        Log.d(TAG, "History")
        showEmbeddedFlutterFragment()
    }

    private fun showCalendarFragment() {
        fragmentEmbeddedFlutter.visibility = View.GONE
        fragmentCalendar.visibility = View.VISIBLE
    }

    private fun showEmbeddedFlutterFragment() {
        fragmentEmbeddedFlutter.visibility = View.VISIBLE
        fragmentCalendar.visibility = View.GONE
    }
}
