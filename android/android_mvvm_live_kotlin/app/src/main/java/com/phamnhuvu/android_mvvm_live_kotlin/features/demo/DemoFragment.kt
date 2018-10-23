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
import com.phamnhuvu.android_mvvm_live_kotlin.ViewModelFactory
import com.phamnhuvu.android_mvvm_live_kotlin.data.repositories.DemoRepository
import com.phamnhuvu.android_mvvm_live_kotlin.extensions.goTo
import com.phamnhuvu.android_mvvm_live_kotlin.providers.AppProvider
import com.phamnhuvu.android_mvvm_live_kotlin.statics.Routes

class DemoFragment : Fragment() {

    private lateinit var mViewModel: DemoViewModel
    private lateinit var mAppProvider: AppProvider

    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        val view = inflater.inflate(R.layout.fragment_demo, container, false)
        val tvGlobalCountNumber = view.findViewById<TextView>(R.id.tvGlobalCountNumber)
        val btnGlobalIncrease = view.findViewById<TextView>(R.id.btnGlobalIncrease)
        val tvCountNumber = view.findViewById<TextView>(R.id.tvCountNumber)
        val btnIncrease = view.findViewById<Button>(R.id.btnIncrease)
        val btnNext = view.findViewById<Button>(R.id.btnNext)

        mAppProvider = ViewModelProviders.of(requireActivity()).get(AppProvider::class.java)
        // Inflate the layout for this fragment
        val factory = ViewModelFactory(DemoRepository())
        mViewModel = ViewModelProviders.of(this, factory).get(DemoViewModel::class.java)

        val globalCountObservable = Observer<Int> {newNumber -> tvGlobalCountNumber.text = newNumber.toString()}
        mAppProvider.count.observe(this, globalCountObservable)
        btnGlobalIncrease.setOnClickListener { mAppProvider.increase(1) }

        val countObservable = Observer<Int> { newNumber -> tvCountNumber.text = newNumber.toString() }
        mViewModel.count.observe(this, countObservable)
        btnIncrease.setOnClickListener { mViewModel.increase(1) }
        btnNext.setOnClickListener { fragmentManager?.goTo(Routes.demo) }
        return view
    }


}
