# Conv-based_FAD_FPI
This is the documentation of code to run FAD and FPI analysis on images of fiber-like structures
## Software
The code runs in the MATLAB programming language. To install, download MATLAB from: http://www.mathworks.com/products/matlab/
## Data format
Theoretically, any format that can be read or loaded by MATLAB is suitable to de tested by the code. 
## How to use
Here are totally 8 MATLAB files, where `example_main.m` is the main program, and the others are functions that will be called during the running of the main program.  
**The main program can be divided into 5 parts:**
1. **Load images**    
Here the 2D images are stacked up and form a 3D stack.
2. **Image preprocessing**  
Some image enhancement steps are applied to the images in order to obtain more accurate binarization results. 
3. **Image binarization and outline detection**  
Perform image binarization using the Otsu's method, and fill holes of a specified size. Perform outline detection on the binary matrix obtained.
4. **Calculate the 3D FAD and FPI**    
Here the voxel-wise FAD and FPI of fiber-like structure are obtained based on the convolution. 
5. **Perform post-processing**    
Here we generate ‘pretty’ images of FAD and FPI. To acquire these images, the raw intensity image is used to provide the contrast of fiber features, and the FAD and FPI maps are labeled by different colors to show the value information.
