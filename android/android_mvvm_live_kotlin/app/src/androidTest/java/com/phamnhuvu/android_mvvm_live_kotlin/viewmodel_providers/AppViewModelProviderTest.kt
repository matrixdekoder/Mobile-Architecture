package com.phamnhuvu.android_mvvm_live_kotlin.viewmodel_providers

import android.arch.core.executor.testing.InstantTaskExecutorRule
import com.phamnhuvu.android_mvvm_live_kotlin.data.repositories.DemoRepository
import com.phamnhuvu.android_mvvm_live_kotlin.features.demo.DemoViewModel
import com.phamnhuvu.android_mvvm_live_kotlin.providers.AppViewModelProvider
import org.junit.Assert
import org.junit.Before
import org.junit.Rule
import org.junit.Test

class AppViewModelProviderTest {

  private lateinit var appViewModelProviders: AppViewModelProvider

  @get:Rule
  var instantTaskExecutorRule = InstantTaskExecutorRule()

  @Before
  fun setUp() {
    appViewModelProviders = AppViewModelProvider(DemoRepository())
  }

  @Test
  fun increase_isCorrect() {
    Assert.assertEquals(0, appViewModelProviders.count.value)

    appViewModelProviders.increase(1)
    Assert.assertEquals(1, appViewModelProviders.count.value)

    appViewModelProviders.increase(2)
    Assert.assertEquals(3, appViewModelProviders.count.value)
  }
}