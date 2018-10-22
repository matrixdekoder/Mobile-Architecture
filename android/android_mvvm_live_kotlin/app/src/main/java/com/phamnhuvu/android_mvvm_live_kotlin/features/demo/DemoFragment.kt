package com.phamnhuvu.android_mvvm_live_kotlin.features.demo


import android.arch.lifecycle.Observer
import android.arch.lifecycle.ViewModelProviders
import android.os.Bundle
import android.support.v4.app.Fragment
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.Button
import android.widget.TextView

import com.phamnhuvu.android_mvvm_live_kotlin.R
import com.phamnhuvu.android_mvvm_live_kotlin.data.repositories.DemoRepository

class DemoFragment : Fragment() {

    private lateinit var mViewModel: DemoViewModel

    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        val view = inflater.inflate(R.layout.fragment_demo, container, false)
        val tvCountNumber = view.findViewById<TextView>(R.id.tvCountNumber)
        val btnIncrease = view.findViewById<Button>(R.id.btnIncrease)
        // Inflate the layout for this fragment
        val factory = DemoViewModelFactory(DemoRepository())
        mViewModel = ViewModelProviders.of(this, factory).get(DemoViewModel::class.java)

        val countObservable = Observer<Int> { newNumber -> tvCountNumber.text = newNumber.toString() }
        mViewModel.count.observe(this, countObservable)
        btnIncrease.setOnClickListener { mViewModel.increase(1) }
        return view
    }


}
