//: Shows how to plot a complex exponential. Complex functions are included.

import UIKit
import Accelerate

let pi = 4.0*atan(1.0)

struct Complex {
    var r:Double = 0.0, j:Double = 0.0
}

/*************functions**********/

func db (a: [Double], max: Double) -> [Double] {
    //Vector maximum magnitude; double precision.
    
    var result=[Double](repeating:0.0, count: a.count )
    var max2=max
    
    
    /*__A
     Single-precision real input vector
     __IA
     Stride for A
     __B
     Pointer to single-precision real input scalar: zero reference
     __C
     Single-precision real output vector
     __IC
     Stride for C
     __N
     The number of elements to process
     __F
     Power (0) or amplitude (1) flag*/
    vDSP_vdbconD(a, 1, &max2, &result, 1, UInt(a.count), 1)
    return result
}



func printComplex (c1: Complex) {
    print("r=\(c1.r) j=\(c1.j)")
    
}

func SIGN (a:Double, b:Double)-> Double {
    
    //If B\ge 0 then the result is ABS(A), else it is -ABS(A)
    var out:Double=0.0
    if b>0{
        out=abs(a)
    }
    else{
        out = -abs(a)
    }
    return out
    
}



func + (c1: Complex, c2: Complex) -> Complex {
    return Complex(r: c1.r + c2.r, j: c1.j + c2.j)
}
func - (c1: Complex, c2: Complex) -> Complex {
    return Complex(r: c1.r - c2.r, j: c1.j - c2.j)
}

func CABS (c1: Complex) -> Double {
    var out :Double = 0.0
    out=sqrt(c1.r*c1.r+c1.j*c1.j)
    return out
}

func angFunction (c1: Complex) -> (rad:Double, deg:Double) {
    var rad :Double = 0.0
    let pi :Double = 4.0*atan(1.0)
    //let ratio1 = c1.j/c1.r
    let angle1 = atan2(c1.j,c1.r)
    rad=(angle1)
    let deg=rad*180/pi
    return (rad, deg)
}

func * (c1: Complex, c2: Complex) -> Complex {
    var out = Complex(r:0.0, j:0.0)
    out.r=c1.r*c2.r-c1.j*c2.j
    out.j=c1.r*c2.j+c1.j*c2.r
    return out }

func ^ (c1: Complex, n: Int) -> Complex {
    var out = Complex(r:0.0, j:0.0)
  
    
    
    switch (n)
    {
        
        
    case 0:
        out.r=1.0
        out.j=0.0
        
        print("(a+bi)^0 is 1")
        
    case 1:
        
        out.r=c1.r
        out.j=c1.j
        
        print("(a+bi)^1 is (a+bi)")
        

        
    case 2..<100:
        
        out=c1
        
        for _ in (1..<n){
            
            out=c1*out
            //print("\(n)")
            
        }
        
        
        print("n>=2")
        
        
    default:
        print("Integer out of range")
    }

    
        
    
    
    return out }

func / (c1: Complex, c2: Complex) -> Complex {
    var out = Complex(r:0.0, j:0.0)
    let bottom = pow(c2.r,2)+pow(c2.j,2)
    out.r=(c1.r*c2.r+c1.j*c2.j)/bottom
    out.j=(c1.j*c2.r-c1.r*c2.j)/bottom
    return out }

func MagToRect (m1: MagAng ) -> Complex {
    var out = Complex(r:0.0, j:0.0)
    out.r = m1.mag * cos(m1.ang)
    out.j = m1.mag * sin(m1.ang)
    return out }

func CEXP (c1: Complex)-> Complex{
    var out=Complex(r: 0.0,j: 0.0)
    //exp(a+jb)=e^a(cos(w)+jsin(w))
    out.r=exp(c1.r)*cos(c1.j)
    out.j=exp(c1.r)*sin(c1.j)
    return out
}

struct MagAng {
    var mag = 0.0, ang = 0.0
}

public func max1 (a: [Double]) -> Double {
    //Vector maximum magnitude; double precision.
    var result = 0.0
    vDSP_maxmgvD(a,1,&result,UInt(a.count))
    return result
}

var i=Complex(r: 0.0,j: 1.0)

for n in (0..<10){

let x=i^n
    
    print("i^\(n) is \(x)")

}




