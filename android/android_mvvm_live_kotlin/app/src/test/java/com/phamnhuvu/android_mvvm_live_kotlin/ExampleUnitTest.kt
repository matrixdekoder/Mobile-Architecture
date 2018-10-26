package com.phamnhuvu.android_mvvm_live_kotlin

import android.arch.core.executor.testing.InstantTaskExecutorRule
import org.junit.Test

import org.junit.Assert.*
import org.junit.Rule

/**
 * Example local unit test, which will execute on the development machine (host).
 *
 * See [testing documentation](http://d.android.com/tools/testing).
 */
class ExampleUnitTest {

  @get:Rule
  var instantTaskExecutorRule = InstantTaskExecutorRule()

  @Test
  fun addition_isCorrect() {
    assertEquals(4, 2 + 2)
  }
}
