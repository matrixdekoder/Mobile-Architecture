package com.phamnhuvu.dosomething.views

import android.content.Context
import android.graphics.*
import android.support.constraint.ConstraintLayout
import android.support.v4.content.ContextCompat
import android.util.AttributeSet
import android.util.Log
import android.widget.FrameLayout
import com.phamnhuvu.dosomething.R
import com.phamnhuvu.dosomething.modules.ConvertDimension
import android.view.LayoutInflater
import android.view.View


class BottomBarView(context: Context?, attrs: AttributeSet?) : ConstraintLayout(context, attrs) {

    // Paint
    private var mLeftPaint: Paint = Paint()
    private var mCentralPaint: Paint = Paint()
    private var mRightPaint: Paint = Paint()

    // Shadow
    private var mShadow: Boolean = false
    private var mShadowWidth: Float = ConvertDimension.dpToPx(context!!, 2f)
    private var mMainColor: Int = ContextCompat.getColor(context!!, R.color.colorWhite)

    // Gradient
    private lateinit var mLeftLinearGradient: LinearGradient
    private lateinit var mRightLinearGradient: LinearGradient
    private lateinit var mCentralRadialGradient: RadialGradient


    init {
        setWillNotDraw(false)
        context!!.theme.obtainStyledAttributes(
            attrs,
            R.styleable.BottomBarView,
            0, 0
        ).apply {
            try {
                mShadow = getBoolean(R.styleable.BottomBarView_shadow, false)
            } finally {
                recycle()
            }
        }

        val inflater = context
            .getSystemService(Context.LAYOUT_INFLATER_SERVICE) as LayoutInflater
        inflater.inflate(R.layout.bottom_bar_view, this, true)

        mLeftPaint.color = mMainColor


        mCentralPaint.color = mMainColor
        mCentralPaint.isAntiAlias = true
        mCentralPaint.style = Paint.Style.STROKE

        mRightPaint.color = mMainColor
    }

    override fun onDraw(canvas: Canvas?) {
        super.onDraw(canvas)
        mCentralPaint.strokeWidth = height.toFloat() * 2

        drawArc(canvas!!, mCentralPaint)
        drawRect(canvas, mLeftPaint, 0f, width.toFloat() / 2 - height / 2)
        drawRect(canvas, mRightPaint, width.toFloat() / 2 + height / 2, width.toFloat())
    }

    private fun drawArc(canvas: Canvas, paint: Paint) {
        // Clip
        val left = width.toFloat() / 2 - height / 2
        val top = if (mShadow) {
            mShadowWidth
        } else {
            0f
        }
        val right = width.toFloat() / 2 + height / 2
        val bottom = height.toFloat()

        // Circle
        val cX = width / 2f
        val cY = if (mShadow) {
            mShadowWidth
        } else {
            0f
        }
        val radius = height / 2f + height.toFloat()

        // Draw
        canvas.save()

        if (mShadow) {
            canvas.clipRect(left, ConvertDimension.dpToPx(context, 0.75f), right, bottom)
            val gradient = RadialGradient(
                cX, cY,
                radius,
                intArrayOf(Color.TRANSPARENT, Color.BLACK),
                floatArrayOf(0.3f, 0.45f),
                Shader.TileMode.CLAMP)
            val shadowPaint = Paint()
            shadowPaint.shader = gradient
            canvas.drawCircle(cX, cY, radius, shadowPaint)
        }

        canvas.clipRect(left, top, right, bottom)
        canvas.drawCircle(cX, cY, radius, paint)
        canvas.restore()
    }

    private fun drawRect(canvas: Canvas, paint: Paint, left: Float, right: Float) {
        // Rect
        val top =
            if (mShadow) {
                mShadowWidth
            } else {
                0f
            }
        val bottom = height.toFloat()

        // Draw
        canvas.save()

        if (mShadow) {
            val x0 = 0f
            val y0 = 0f
            val x1 = 0f
            val y1 = height.toFloat()

            val gradient = LinearGradient(
                x0, y0,
                x1, y1,
                intArrayOf(Color.TRANSPARENT, Color.BLACK),
                floatArrayOf(0f, 0.15f),
                Shader.TileMode.CLAMP
            )

            val shadowPaint = Paint()
            shadowPaint.shader = gradient
            canvas.drawRect(left, 0f, right, bottom, shadowPaint)
        }

        canvas.drawRect(left, top, right, bottom, paint)
        canvas.restore()
    }
}