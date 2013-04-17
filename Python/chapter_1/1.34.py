
def positive(x):
    return x > 0


def negative(x):
    return x < 0


def average(a, b):
    return ((a + b) / 2)


def close_enough(a, b):
    return (abs(a - b)) < 0.5


def half_intervval(func, negativepoint, positivepoint):
    midpoint = average(positivepoint, negativepoint)      
    if(close_enough(positivepoint, negativepoint)):
        return midpoint
    else:
        testpoint = func(midpoint)       
        if(positive(testpoint)):
           return  half_intervval(func, negativepoint, midpoint)
        elif (negative(testpoint)):
            return half_intervval(func, midpoint, positivepoint)
        else:
            return midpoint

f=lambda x:x*x-9
# 3
print half_intervval(f,0,100)

