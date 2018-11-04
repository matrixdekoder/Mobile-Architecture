package com.phamnhuvu.dosomething.modules

import android.content.Context
import android.util.DisplayMetrics


object ConvertDimension {

    fun dpToPx(context: Context, dp: Float): Float {
        val resources = context.resources
        val metrics = resources.displayMetrics
        return dp * (metrics.densityDpi.toFloat() / DisplayMetrics.DENSITY_DEFAULT)
    }
}