package com.algo;



import java.nio.Buffer;
import java.nio.ByteBuffer;
import org.bytedeco.javacpp.BytePointer;
import org.bytedeco.javacpp.Loader;
import org.bytedeco.javacpp.Pointer;
import org.bytedeco.javacpp.opencv_core.IplImage;

import org.opencv.core.Mat;


/**
 * A utility class to map data between {@link Frame} and {@link IplImage} or {@link Mat}.
 * Since this is an abstract class, one must choose between two concrete classes:
 * {@link ToIplImage} or {@link ToMat}. {@link ToOrgOpenCvCoreMat} is also available to
 * do the same with {@link org.opencv.core.Mat} from the official Java API of OpenCV.
 *
 * @author Samuel Audet
 */
public class OpenCVFrameConverter{
    
}
