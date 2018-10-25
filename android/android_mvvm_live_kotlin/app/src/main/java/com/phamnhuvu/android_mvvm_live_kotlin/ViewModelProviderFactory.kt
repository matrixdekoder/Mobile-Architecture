package com.phamnhuvu.android_mvvm_live_kotlin

import android.arch.lifecycle.ViewModel
import android.arch.lifecycle.ViewModelProvider
import com.phamnhuvu.android_mvvm_live_kotlin.data.repositories.DemoRepository
import com.phamnhuvu.android_mvvm_live_kotlin.providers.AppViewModelProvider

class ViewModelProviderFactory : ViewModelProvider.Factory {

  private lateinit var demoRepository: DemoRepository

  constructor(demoRepository: DemoRepository) {
    this.demoRepository = demoRepository
  }

  constructor(number: Int) {
  }

  @Suppress("UNCHECKED_CAST")
  override fun <T : ViewModel?> create(modelClass: Class<T>): T {
    if (modelClass.isAssignableFrom(AppViewModelProvider::class.java)) {
      return AppViewModelProvider(demoRepository) as T
    } else {
      throw IllegalArgumentException("Unknown ViewModel class");
    }
  }
}