**Week1 / Ex1**

The task was to compute the nearest & k-nearest neighbor on the MINST data set. 
1. Step: the data had to be parsed and loaded into matlab.
2. Step: create the nearest neighbor function
3. Step: create the k-nearest neighbor function

**Explanation**
Task 3: the best error rate I was able to obtain was	
- test size = 100
- training size = 10'000
- recognition rate = 81% and error rate = 19%

Task 4: Implementation of the k-nearest neighbor and majority vote
- the best result was obtained with 
- k = 3
- test size = 100 
- training size = 10000
- recognition rate = 83% and error rate = 17%

Task 5: Bluring the test image
- I blured each test image with a gaussian / laplacian filter before computing the euclidean width 
- Unfortunately, I wasn't able to improve the recognition rate
- I believe it would be possible to improve the rate if
-- 1. the contrast of black and white was increased
-- 2. the edges were sharpened 

Task 6: Further Improvements
- One way to improve the run rate of the algorithm would be to use a neural network
  insteaed of computing the k-nearest neighbor. Or apply the improved filter from above. 
  Improved filter (multiple filters overlaying each other) would be: 
  -- 1. the contrast of black and white was increased
  -- 2. the edges were sharpened 

