#ifndef RECTANGLE_HPP
#define RECTANGLE_HPP
#include <cmath>

using namespace std;

//complicated definition of a struct "Point"
struct Point{
    double x, y;
};

struct Rectangle{

    //everything is default public in a struct, don't need to worry abut public/private tags
    Point one, two, three, four;

    //constructor for rectangle takes four points, deviously named to differ from real names
    Rectangle(Point on, Point tw, Point th, Point fo){
        one = on;
        two = tw;
        three = th;
        four = fo;

        //definitely an easier way to do this but I'm up against the clock here
        checkPoint(one.x);
        checkPoint(one.y);
        checkPoint(two.x);
        checkPoint(two.y);
        checkPoint(three.x);
        checkPoint(three.y);
        checkPoint(four.x);
        checkPoint(four.y);
    }

    //makes sure the point is in between 0 and 20 inclusive
    void checkPoint(double p){
        if (((p < 0.0) || p > 20.0))
            cout << "Invalid points, they must be >= 0 and < 20" << endl;
    }

    //returns longer side
    double length(){
        double d1 = getD1();
        double d2 = getD2();
        if (d1 > d2) return d1;
        else return d2;
    }

    //returns shorter side
    double width(){
        double d1 = getD1();
        double d2 = getD2();
        if (d1 < d2) return d1;
        else return d2;
    }

    //instead of typing out the long definition of d1 twice, made a function for it
    //d1 is calculated by getting the distance from point 1 to point 2
    double getD1(){
        return (sqrt(fabs(pow((two.x-one.x),2)-pow((two.y-one.y),2))));
    }

    //did same for d2
    double getD2(){
        return (sqrt(fabs(pow((three.x-two.x),2)-pow((three.y-two.y),2))));
    }

    //checks if the length is the same as the width, meaning it's a square
    bool square(){
        if(length() == width())
            return true;
        return false;
    }

    //returns area by multiplying length by width
    double area(){
        return (length() * width());
    }

    //returns sum of all the sides
    double perimeter(){
        return (2*length()) + (2*width());
    }
};

#endif // RECTANGLE_HPP
