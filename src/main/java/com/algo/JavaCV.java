/*
 * Copyright (C) 2009-2016 Samuel Audet
 *
 * Licensed either under the Apache License, Version 2.0, or (at your option)
 * under the terms of the GNU General Public License as published by
 * the Free Software Foundation (subject to the "Classpath" exception),
 * either version 2, or any later version (collectively, the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *     http://www.gnu.org/licenses/
 *     http://www.gnu.org/software/classpath/license.html
 *
 * or as provided in the LICENSE.txt file that accompanied this code.
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package com.algo;


import java.nio.ByteBuffer;
import java.nio.DoubleBuffer;
import java.nio.FloatBuffer;
import java.nio.IntBuffer;
import java.nio.ShortBuffer;
import java.util.Arrays;

import org.bytedeco.javacpp.opencv_core.CvBox2D;
import org.bytedeco.javacpp.opencv_core.CvMat;
import org.bytedeco.javacpp.opencv_core.CvPoint2D32f;
import org.bytedeco.javacpp.opencv_core.CvRect;
import org.bytedeco.javacpp.opencv_core.CvSize2D32f;
import org.bytedeco.javacpp.opencv_imgproc.CvMoments;

/**
 *
 * @author Samuel Audet
 */
public class JavaCV {

    public static final double
            SQRT2 = 1.41421356237309504880,
            FLT_EPSILON = 1.19209290e-7F,
            DBL_EPSILON = 2.2204460492503131e-16;
	private static final String CV_LU = null;

    /** returns the distance^2 between the line (x1, y1) (x2, y2) and the point (x3, y3) */
    public static double distanceToLine(double x1, double y1, double x2, double y2, double x3, double y3) {
        double dx = x2 - x1;
        double dy = y2 - y1;
        double d2 = dx*dx + dy*dy;
        double u = ((x3 - x1)*dx + (y3 - y1)*dy) / d2;

        double x = x1 + u*dx;
        double y = y1 + u*dy;

        dx = x - x3;
        dy = y - y3;
        return dx*dx + dy*dy;
    }

    /**
     * returns the largest rectangle of given aspect ratio and angle,
     * bounded by the contour and sharing the same centroid
     */
    private static ThreadLocal<CvMoments> moments = CvMoments.createThreadLocal();
    public static CvBox2D boundedRect(CvMat contour, CvBox2D box) {
        int contourLength = contour.length();
        CvMoments m = moments.get();
        cvMoments(contour, m, 0);
        double inv_m00 = 1 / m.m00();
        double centerX = m.m10() * inv_m00;
        double centerY = m.m01() * inv_m00;

        float[] pts = new float[8];
        CvPoint2D32f center = box.center();
        CvSize2D32f size = box.size();
        center.put(centerX, centerY);
        cvBoxPoints(box, pts);

        float scale = Float.POSITIVE_INFINITY;
        for (int i = 0; i < 4; i++) {
            double x1 = centerX,  y1 = centerY,
                   x2 = pts[2*i], y2 = pts[2*i + 1];
            for (int j = 0; j < contourLength; j++) {
                int k = (j + 1) % contourLength;
                double x3 = contour.get(2*j), y3 = contour.get(2*j + 1),
                       x4 = contour.get(2*k), y4 = contour.get(2*k + 1);
                double d = (y4 - y3) * (x2 - x1) - (x4 - x3) * (y2 - y1);
                double ua = ((x4 - x3) * (y1 - y3) - (y4 - y3) * (x1 - x3))/d,
                       ub = ((x2 - x1) * (y1 - y3) - (y2 - y1) * (x1 - x3))/d;
                if (ub >= 0 && ub <= 1 && ua >= 0 && ua < scale) {
                    scale = (float)ua;
                }
            }
        }
        size.width(scale*size.width()).height(scale*size.height());
        return box;
    }

    private static void cvBoxPoints(CvBox2D box, float[] pts) {
		// TODO Auto-generated method stub
		
	}

	private static void cvMoments(CvMat contour, CvMoments m, int i) {
		// TODO Auto-generated method stub
		
	}

	/**
     * Similar to cvBoundingRect(), but can also pad the output with some extra
     * pixels, useful to use as ROI for operations with interpolation. Further
     * aligns the region to specified boundaries, for easier vectorization and
     * subsampling, and also uses on input the rect argument as a maximum boundary.
     */
    public static CvRect boundingRect(double[] contour, CvRect rect,
            int padX, int padY, int alignX, int alignY) {
        double minX = contour[0];
        double minY = contour[1];
        double maxX = contour[0];
        double maxY = contour[1];
        for (int i = 1; i < contour.length/2; i++) {
            double x = contour[2*i  ];
            double y = contour[2*i+1];
            minX = Math.min(minX, x);
            minY = Math.min(minY, y);
            maxX = Math.max(maxX, x);
            maxY = Math.max(maxY, y);
        }
        int x = (int)Math.floor(Math.max(rect.x(), minX-padX)/alignX)*alignX;
        int y = (int)Math.floor(Math.max(rect.y(), minY-padY)/alignY)*alignY;
        int width  = (int)Math.ceil(Math.min(rect.width(),  maxX+padX)/alignX)*alignX - x;
        int height = (int)Math.ceil(Math.min(rect.height(), maxY+padY)/alignY)*alignY - y;

        return rect.x(x).y(y).width(Math.max(0, width)).height(Math.max(0, height));
    }

    private static ThreadLocal<CvMat>
            A8x8 = CvMat.createThreadLocal(8, 8),
            b8x1 = CvMat.createThreadLocal(8, 1),
            x8x1 = CvMat.createThreadLocal(8, 1);
    /**
     * this is basically cvGetPerspectiveTransform() using CV_LU instead of
     * CV_SVD, because the latter gives inaccurate results...
     * Consider using {@link opencv_imgproc#getPerspectiveTransform} instead.
     */
    public static CvMat getPerspectiveTransform(double[] src, double[] dst, CvMat map_matrix) {
        // creating and releasing matrices via NIO here in this function
        // can easily become a bottleneck, so we use ThreadLocal references
        CvMat A = A8x8.get();
        CvMat b = b8x1.get();
        CvMat x = x8x1.get();

        for(int i = 0; i < 4; ++i ) {
            A.put(i*8+0, src[i*2]);   A.put((i+4)*8+3, src[i*2]);
            A.put(i*8+1, src[i*2+1]); A.put((i+4)*8+4, src[i*2+1]);
            A.put(i*8+2, 1);          A.put((i+4)*8+5, 1);
            A.put(i*8+3, 0);          A.put(i*8+4, 0); A.put(i*8+5, 0);
            A.put((i+4)*8+0, 0);  A.put((i+4)*8+1, 0); A.put((i+4)*8+2, 0);

            A.put(i*8+6,     -src[i*2]  *dst[i*2]);
            A.put(i*8+7,     -src[i*2+1]*dst[i*2]);
            A.put((i+4)*8+6, -src[i*2]  *dst[i*2+1]);
            A.put((i+4)*8+7, -src[i*2+1]*dst[i*2+1]);

            b.put(i,   dst[i*2]);
            b.put(i+4, dst[i*2+1]);
        }
        cvSolve(A, b, x, CV_LU);
        map_matrix.put(x.get());
        map_matrix.put(8, 1);

        return map_matrix;
    }

    /** Consider using {@link opencv_core#perspectiveTransform} instead. */
    public static void perspectiveTransform(double[] src, double[] dst, CvMat map_matrix) {
        double[] mat = map_matrix.get();
        for (int j = 0; j < src.length; j += 2) {
            double x = src[j], y = src[j + 1];
            double w = x*mat[6] + y*mat[7] + mat[8];

            if (Math.abs(w) > FLT_EPSILON) {
                w = 1.0/w;
                dst[j] = (x*mat[0] + y*mat[1] + mat[2])*w;
                dst[j+1] = (x*mat[3] + y*mat[4] + mat[5])*w;
            } else {
                dst[j] = dst[j+1] = 0;
            }
        }
    }

    private static ThreadLocal<CvMat>
            A3x3 = CvMat.createThreadLocal(3, 3), b3x1 = CvMat.createThreadLocal(3, 1);
    public static CvMat getPlaneParameters(double[] src, double[] dst,
            CvMat invSrcK, CvMat dstK, CvMat R, CvMat t, CvMat n) {
        CvMat A = A3x3.get(), b = b3x1.get();

        double[] x = new double[6], y = new double[6];
        perspectiveTransform(src, x, invSrcK);
        cvInvert(dstK, A);
        perspectiveTransform(dst, y, A);

        for (int i = 0; i < 3; i++) {
            A.put(i, 0, (t.get(2)*y[i*2] - t.get(0))*x[i*2  ]);
            A.put(i, 1, (t.get(2)*y[i*2] - t.get(0))*x[i*2+1]);
            A.put(i, 2,  t.get(2)*y[i*2] - t.get(0));

            b.put(i, (R.get(2, 0)*x[i*2] + R.get(2, 1)*x[i*2+1] + R.get(2, 2))*y[i*2] -
                     (R.get(0, 0)*x[i*2] + R.get(0, 1)*x[i*2+1] + R.get(0, 2)));
        }
        cvSolve(A, b, n, CV_LU);

        return n;
    }

    private static void cvSolve(CvMat a, CvMat b, CvMat n, String cvLu) {
		// TODO Auto-generated method stub
		
	}

	private static void cvInvert(CvMat dstK, CvMat a) {
		// TODO Auto-generated method stub
		
	}

	

}
