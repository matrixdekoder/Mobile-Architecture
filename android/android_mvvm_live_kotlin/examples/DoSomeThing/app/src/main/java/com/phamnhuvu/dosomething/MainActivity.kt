package com.phamnhuvu.dosomething

import android.support.v7.app.AppCompatActivity
import android.os.Bundle
import androidx.navigation.fragment.NavHostFragment
import com.phamnhuvu.dosomething.features.SplashFragment

class MainActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        if (savedInstanceState != null) return


        supportFragmentManager.beginTransaction()
            .replace(R.id.nav_host, SplashFragment())
            .commit()
    }
}
