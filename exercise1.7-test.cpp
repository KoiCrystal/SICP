//it's too hard to use lisp to print every guess, so I use cpp
#include <iostream>
#include <cmath>
using namespace std;
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
    return (guess+x/guess)/2;
}
float sqrt_iter(float guess,float x)
{
    if(good_enough(guess,x) == 1)
    {
        return guess;
    }
    else
    {
        sqrt_iter(improve(guess,x),x);
    }
}
int main()
{
    float a = 0.0001;
    cout<<sqrt_iter(1.0, a);

}