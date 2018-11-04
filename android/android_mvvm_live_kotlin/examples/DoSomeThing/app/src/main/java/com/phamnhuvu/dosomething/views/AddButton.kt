package com.phamnhuvu.dosomething.views

import android.content.Context
import android.graphics.Canvas
import android.graphics.Paint
import android.graphics.drawable.Drawable
import android.support.v4.content.ContextCompat
import android.util.AttributeSet
import android.view.View
import com.phamnhuvu.dosomething.R


class AddButton(context: Context?, attrs: AttributeSet?) : View(context, attrs) {

    private val mDrawable: Drawable = resources.getDrawable(R.drawable.ic_add)
    private val mPaint: Paint = Paint().apply {
        color = ContextCompat.getColor(context!!, R.color.colorPrimary)
    }

    override fun onDraw(canvas: Canvas?) {
        super.onDraw(canvas)
        val cX = width / 2f
        val cY = height / 2f
        canvas?.drawCircle(cX, cY, cX, mPaint)
        mDrawable.setBounds(0, 0, width, height)
        mDrawable.draw(canvas)
    }
}