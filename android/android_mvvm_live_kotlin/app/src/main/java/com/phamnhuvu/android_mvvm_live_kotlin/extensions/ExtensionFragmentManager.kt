package com.phamnhuvu.android_mvvm_live_kotlin.extensions

import android.support.v4.app.Fragment
import android.support.v4.app.FragmentManager
import com.phamnhuvu.android_mvvm_live_kotlin.Injector
import com.phamnhuvu.android_mvvm_live_kotlin.R
import com.phamnhuvu.android_mvvm_live_kotlin.features.demo.DemoFragment
import com.phamnhuvu.android_mvvm_live_kotlin.statics.Routes

fun FragmentManager.goTo(name: String) {
  val fragment: Fragment

  when (name) {
    Routes.Initial -> {
      fragment = DemoFragment()
      fragment.inject(Injector.instance.demoRepository)
    }

    Routes.Demo -> {
      fragment = DemoFragment()
      fragment.inject(Injector.instance.demoRepository)
    }
    else -> return
  }

  if (name == Routes.Initial) {
    beginTransaction()
      .replace(R.id.mainFrame, fragment)
      .commit()
  } else {
    beginTransaction()
      .replace(R.id.mainFrame, fragment)
      .addToBackStack(null)
      .commit()
  }
}