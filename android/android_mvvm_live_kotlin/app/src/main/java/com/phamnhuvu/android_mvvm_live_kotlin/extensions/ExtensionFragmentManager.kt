package com.phamnhuvu.android_mvvm_live_kotlin.extensions

import android.support.v4.app.Fragment
import android.support.v4.app.FragmentManager
import com.phamnhuvu.android_mvvm_live_kotlin.R
import com.phamnhuvu.android_mvvm_live_kotlin.features.demo.DemoFragment
import com.phamnhuvu.android_mvvm_live_kotlin.statics.Routes

fun FragmentManager.goTo(name: String) {
  val fragment: Fragment

  when (name) {
    Routes.demo -> fragment = DemoFragment()
    else -> return;
  }

  beginTransaction()
    .replace(R.id.mainFrame, fragment)
    .addToBackStack(null)
    .commit()
}