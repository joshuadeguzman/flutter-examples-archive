package io.github.joshuadeguzman.android_app

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.fragment.app.Fragment

/**
 * Created by Joshua de Guzman on 2019-08-19.
 */
class MainFragment : Fragment() {

    val firstFragment = FirstFragment.newInstance()
    val secondFragment = SecondFragment.newInstance()

    companion object {
        var TAG = MainFragment::class.java.simpleName
        fun newInstance() = MainFragment()
    }

    override fun onCreateView(inflater: LayoutInflater, container: ViewGroup?, savedInstanceState: Bundle?): View? {
        return inflater.inflate(R.layout.fragment_main, container, false)
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)

        this.loadFirstFragment()
        this.loadSecondFragment()
    }

    private fun loadFirstFragment() {
        val fragmentTransaction = childFragmentManager.beginTransaction()
        fragmentTransaction.replace(R.id.firstFragment, firstFragment, FirstFragment.TAG)
        fragmentTransaction.commitAllowingStateLoss()
    }

    private fun loadSecondFragment() {
        val fragmentTransaction = childFragmentManager.beginTransaction()
        fragmentTransaction.replace(R.id.secondFragment, secondFragment, SecondFragment.TAG)
        fragmentTransaction.commitAllowingStateLoss()
    }
}