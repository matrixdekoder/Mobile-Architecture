package com.phamnhuvu.dosomething.features


import android.os.Bundle
import android.os.Handler
import android.support.v4.app.Fragment
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.navigation.Navigation
import androidx.navigation.fragment.NavHostFragment

import com.phamnhuvu.dosomething.R

class SplashFragment : Fragment() {

    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        // Inflate the layout for this fragment
        return inflater.inflate(R.layout.fragment_splash, container, false)
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)
        Handler().postDelayed({
            val finalHost = NavHostFragment.create(R.navigation.nav_graph)
            fragmentManager!!.beginTransaction()
                .replace(R.id.nav_host, finalHost)
                .setPrimaryNavigationFragment(finalHost)
                .commit()
        }, 1500)
    }

}
