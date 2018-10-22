package com.phamnhuvu.android_mvvm_live_kotlin

import android.support.v7.app.AppCompatActivity
import android.os.Bundle
import com.phamnhuvu.android_mvvm_live_kotlin.features.demo.DemoFragment

class MainActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        if (savedInstanceState != null) return
        supportFragmentManager.beginTransaction()
            .replace(R.id.mainFrame, DemoFragment())
            .commit()
    }
}
