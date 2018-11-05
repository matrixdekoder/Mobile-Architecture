package com.phamnhuvu.android_mvvm_live_kotlin.modules.extensions

import android.support.v4.app.Fragment
import android.support.v4.app.FragmentManager
import android.support.v4.app.FragmentTransaction
import com.phamnhuvu.android_mvvm_live_kotlin.Injector
import com.phamnhuvu.android_mvvm_live_kotlin.R
import com.phamnhuvu.android_mvvm_live_kotlin.features.demo.DemoFragment
import com.phamnhuvu.android_mvvm_live_kotlin.statics.Routes

fun FragmentManager.goTo(routes: Int) {
  val fragment: Fragment
  when (routes) {
    Routes.INITIAL -> {
      fragment = DemoFragment()
      fragment.inject(Injector.instance.demoRepository)
    }

    Routes.DEMO -> {
      fragment = DemoFragment()
      fragment.inject(Injector.instance.demoRepository)
    }
    else -> return
  }


  val transaction: FragmentTransaction = beginTransaction().replace(R.id.mainFrame, fragment)
  when (routes) {
    Routes.INITIAL -> transaction.commit()
    else -> transaction.addToBackStack(null).commit()
  }
}