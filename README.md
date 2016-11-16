# SplashAnimation

iOS
Swift

This is a work in progress Splash animation for a starting screen.

It applies two custom layers.  The first a screen slice that divides the frame into 
a maximum of 6 slices.  An animation group for each slice stretches it in from the borders of the frame
and attaches it to the point in the center of the frame.  All six slices create a circle which is then 
rotated from a holderview.

TODO
  - Clean up the code in Slice class.
  - Improve the animated Bezier curves in the "Iris" animation.
  - Lock to portrate mode 

![My Image](http://globalbusinessnews.com.au/AnimatedSplashScreen.gif)
