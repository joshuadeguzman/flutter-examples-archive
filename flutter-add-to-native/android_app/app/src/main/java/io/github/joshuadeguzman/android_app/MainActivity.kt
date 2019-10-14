package io.github.joshuadeguzman.android_app

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle

class MainActivity : AppCompatActivity() {

    val mainFragment = MainFragment.newInstance()

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        this.loadMainFragment()
    }

    private fun loadMainFragment() {
        val fragmentTransaction = supportFragmentManager?.beginTransaction()
        fragmentTransaction?.replace(R.id.mainFragment, mainFragment, MainFragment.TAG)
        fragmentTransaction?.commitAllowingStateLoss()
    }
}
