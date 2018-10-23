package com.phamnhuvu.android_mvvm_live_kotlin.features.demo

import android.arch.lifecycle.MutableLiveData
import android.arch.lifecycle.ViewModel
import com.phamnhuvu.android_mvvm_live_kotlin.data.repositories.DemoRepository

class DemoViewModel(demoRepository: DemoRepository) : ViewModel() {

  val count: MutableLiveData<Int> by lazy {
    MutableLiveData<Int>()
  }

  init {
    count.value = 0
  }

  fun increase(number: Int) {
    val newValue = count.value!! + number
    count.value = newValue
  }
}