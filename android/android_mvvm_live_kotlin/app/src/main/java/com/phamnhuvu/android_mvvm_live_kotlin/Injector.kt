package com.phamnhuvu.android_mvvm_live_kotlin

import com.phamnhuvu.android_mvvm_live_kotlin.data.repositories.DemoRepository

class Injector private constructor() {

  lateinit var demoRepository: DemoRepository

  companion object {
    private val mInstance = Injector()

    val instance: Injector
      get() = mInstance
  }

}