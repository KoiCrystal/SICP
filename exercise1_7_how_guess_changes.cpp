//it's too hard to use lisp to print every guess, so I use cpp
#include <iostream>
#include <cmath>
using namespace std;
/*
//use "float" type
int j = 0;
int good_enough(float guess,float x)
{
    if (abs(guess*guess - x) < 0.001)
    {
        return 1;
    }
    else 
    {
        return 0;
    }
}
float improve(float guess, float x)
{
    cout.setf(ios::fixed,ios::floatfield);
    cout<<guess<<endl;
    cout<<j<<endl;
    return (guess+x/guess)/2;
}
float sqrt_iter(float guess,float x)
{
    if (j == 100)
    {
        return guess;
    }
    else
    {
        if(good_enough(guess,x) == 1)
        {
            return guess;
        }    
        else
        {
            j = j+1;
            sqrt_iter(improve(guess,x),x);
        }
    }
}
int main()
{
    float a = 10000000000000;
    cout<<sqrt_iter(1.0, a);
}
*/

//use "double" type
int j = 0;
int good_enough(double guess,double x)
{
    if (abs(guess*guess - x) < 0.001)
    {
        return 1;
    }
    else 
    {
        return 0;
    }
}
double improve(double guess, double x)
{
    cout.setf(ios::fixed,ios::floatfield);
    cout<<guess<<endl;
    cout<<j<<endl;
    return (guess+x/guess)/2;
}
double sqrt_iter(double guess,double x)
{
    if (j == 100)
    {
        return guess;
    }
    else
    {
        if(good_enough(guess,x) == 1)
        {
            return guess;
        }    
        else
        {
            j = j+1;
            sqrt_iter(improve(guess,x),x);
        }
    }
}
int main()
{
    double a = 10000000000000;
    cout<<sqrt_iter(1.0, a);
}
