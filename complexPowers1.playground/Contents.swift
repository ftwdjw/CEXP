//: Playground - noun: a place where people can play

import UIKit
import Accelerate

let pi = 4.0*atan(1.0)

struct Complex {
    var r:Double = 0.0, j:Double = 0.0
}

/*************functions**********/

func powerOfI (n: Int) -> Complex {
     var out = Complex(r:0.0, j:0.0)
    let remainder=n%4

    
    switch (remainder)
    {
        
        
    case 0:
        out.r=1.0
        out.j=0.0
        
        print("i^0 is 1")
        
    case 1:
        
        out.r=0.0
        out.j=1.0
        
        print("i^1 is i")
        
    case 2:
        
        out.r = -1.0
        out.j=0.0
        
        
        print("i^2 is -1")
        
    case 3:
        
        out.r=0.0
        out.j = -1.0
        
        print("i^3 is -i")
        
        
    default:
        print("Integer out of range")
    }

    
    return out

}


var str = "Hello, playground"

var x = Complex(r: 0.0, j: 0.0)


for i in (0...39){
    
    x=powerOfI(n: i)
    print("i^\(i)=\(x)\n")
    
}
