package com.phamnhuvu.android_mvvm_live_kotlin

import android.os.Bundle
import android.support.v7.app.AppCompatActivity
import com.phamnhuvu.android_mvvm_live_kotlin.data.repositories.DemoRepository
import com.phamnhuvu.android_mvvm_live_kotlin.modules.extensions.goTo
import com.phamnhuvu.android_mvvm_live_kotlin.statics.Routes

class MainActivity : AppCompatActivity() {

  override fun onCreate(savedInstanceState: Bundle?) {
    super.onCreate(savedInstanceState)
    setContentView(R.layout.activity_main)

    if (savedInstanceState != null) return

    Injector.instance.demoRepository = DemoRepository()
    supportFragmentManager.goTo(Routes.INITIAL)
  }
}
