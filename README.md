# support_vector_machine
Support Vector Machine using Least Squares Approach
301 Project

By Andrii Luchko & Ucha Samadashvili


Usage:

-Run app.mlapp in MATLAB. Make sure all files are in the present working directory

-User can generate new data by pressing “Generate New Data” which will generate new training points randomly in the region of 0<x<7 and 0<y<7 for both classes. User can also manipulate data generation directly in generate_data.m file. 

-While app is running user can input new training data by assigning array of points in console to “red” (class1) and “blue” (class2) where array is the form of: blue = [point1 point2 … pointN] 
where point is the form of: 
point1 = [x_cord ; y_cord]

-User can also input new data to be classified by assigning array of points in the same format as above to “data”

-User can change parameters “gamma”, ”a”, ”b” manually for all transformations by sliding drag bars and then clicking “Plot”. 

-For gamma optimization user can simply click “Optimize” and then “Plot” button and the program will find the best gamma value by minimizing the number on incorrect classifications for training data.
    Disclaimer: Such gamma optimization works best when training data is in the neighborhood of the origin with recommend deviation of no more than 10 units in any direction. 