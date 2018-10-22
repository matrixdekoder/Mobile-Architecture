package com.phamnhuvu.android_mvvm_live_kotlin.features.demo

import android.arch.lifecycle.ViewModel
import android.arch.lifecycle.ViewModelProvider
import com.phamnhuvu.android_mvvm_live_kotlin.data.repositories.DemoRepository

class DemoViewModelFactory(
    private val demoRepository: DemoRepository
) : ViewModelProvider.NewInstanceFactory() {


    @Suppress("UNCHECKED_CAST")
    override fun <T : ViewModel?> create(modelClass: Class<T>): T {
        return DemoViewModel(demoRepository) as T
    }
}