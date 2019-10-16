package io.github.joshuadeguzman.android_app

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.LinearLayout
import androidx.fragment.app.Fragment
import io.flutter.facade.Flutter
import kotlinx.android.synthetic.main.fragment_flutter_view_example.*

/**
 * Created by Joshua de Guzman on 2019-10-16.
 */
class EmbeddedFlutterViewFragment : Fragment() {

    companion object {
        var TAG = EmbeddedFlutterViewFragment::class.java.simpleName
        fun newInstance() = EmbeddedFlutterViewFragment()
    }

    override fun onCreateView(inflater: LayoutInflater, container: ViewGroup?, savedInstanceState: Bundle?): View? {
        return inflater.inflate(R.layout.fragment_flutter_view_example, container, false)
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)
        this.loadSpeakersFlutterView()
    }

    private fun loadSpeakersFlutterView() {
        val flutterView = Flutter.createView(
            activity!!,
            lifecycle,
            "/"
        )
        flutterView.layoutParams = LinearLayout.LayoutParams(LinearLayout.LayoutParams.MATCH_PARENT, LinearLayout.LayoutParams.WRAP_CONTENT)
        mainView.addView(flutterView)
        mainView.visibility = View.VISIBLE
        emptyView.visibility = View.GONE
    }
}