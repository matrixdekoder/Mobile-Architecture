package com.phamnhuvu.android_mvvm_live_kotlin.viewmodels

import android.arch.core.executor.testing.InstantTaskExecutorRule
import com.phamnhuvu.android_mvvm_live_kotlin.data.repositories.DemoRepository
import com.phamnhuvu.android_mvvm_live_kotlin.features.demo.DemoViewModel
import org.junit.Assert.*
import org.junit.Before
import org.junit.Rule
import org.junit.Test

class DemoViewModelTest {

  private lateinit var demoViewModel: DemoViewModel

  @get:Rule
  var instantTaskExecutorRule = InstantTaskExecutorRule()

  @Before
  fun setUp() {
    demoViewModel = DemoViewModel(DemoRepository())
  }

  @Test
  fun increase_isCorrect() {
    assertEquals(0, demoViewModel.count.value)

    demoViewModel.increase(1)
    assertEquals(1, demoViewModel.count.value)

    demoViewModel.increase(2)
    assertEquals(3, demoViewModel.count.value)
  }

}