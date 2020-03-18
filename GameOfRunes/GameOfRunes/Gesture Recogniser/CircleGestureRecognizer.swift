//
//  CircleGestureRecognizer.swift
//  GameOfRunes
//
//  Created by Andy on 18/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import UIKit
import UIKit.UIGestureRecognizerSubclass

class CircleGestureRecognizer {
    private static let tolerance: CGFloat = 0.2 // circle wiggle room
    private static let maxIteration = 8

    static func isCircle(touchedPoints: [CGPoint]) -> Bool {
        let fitResult = fitCircle(points: touchedPoints)
        let hasInside = anyPointsInTheMiddle(touchedPoints: touchedPoints, fitResult: fitResult)
        return fitResult.error <= tolerance && !hasInside
    }
    
    private static func anyPointsInTheMiddle(touchedPoints: [CGPoint], fitResult: CircleResult) -> Bool {
        let fitInnerRadius = fitResult.radius / sqrt(2) * tolerance
        let innerBox = CGRect(
            x: fitResult.center.x - fitInnerRadius,
            y: fitResult.center.y - fitInnerRadius,
            width: 2 * fitInnerRadius,
            height: 2 * fitInnerRadius)
        var hasInside = false
        for point in touchedPoints {
            if innerBox.contains(point) {
                hasInside = true
                break
            }
        }
        return hasInside
    }
    
    private static func fitCircle(points: [CGPoint]) -> CircleResult {
        let dataLength: CGFloat = CGFloat(points.count)
        var mean: CGPoint = CGPoint(x: 0, y: 0)
        
        for p in points {
            mean.x += p.x
            mean.y += p.y
        }
        mean.x = mean.x / dataLength
        mean.y = mean.y / dataLength
        
        //     computing moments
        var Mxx = 0.0 as CGFloat
        var Myy = 0.0 as CGFloat
        var Mxy = 0.0 as CGFloat
        var Mxz = 0.0 as CGFloat
        var Myz = 0.0 as CGFloat
        var Mzz = 0.0 as CGFloat
        
        for p in points {
            let Xi = p.x - mean.x
            let Yi = p.y - mean.y
            let Zi = Xi*Xi + Yi+Yi
            
            Mxy += Xi * Yi
            Mxx += Xi * Xi
            Myy += Yi * Yi
            Mxz += Xi * Zi
            Myz += Yi * Zi
            Mzz += Zi * Zi
        }
        Mxx /= dataLength
        Myy /= dataLength
        Mxy /= dataLength
        Mxz /= dataLength
        Myz /= dataLength
        Mzz /= dataLength
        
        //      computing coefficients of the characteristic polynomial
        let Mz = Mxx + Myy
        let Cov_xy = Mxx*Myy - Mxy*Mxy
        let Var_z = Mzz - Mz*Mz
        let A3 = 4*Mz
        let A2 = -3*Mz*Mz - Mzz
        let A1 = Var_z*Mz + 4*Cov_xy*Mz - Mxz*Mxz - Myz*Myz
        let A0 = Mxz*(Mxz*Myy - Myz*Mxy) + Myz*(Myz*Mxx - Mxz*Mxy) - Var_z*Cov_xy
        let A22 = A2 + A2
        let A33 = A3 + A3 + A3
        
        //    finding the root of the characteristic polynomial
        //    using Newton's method starting at x=0
        //     (it is guaranteed to converge to the right root)
        var x: CGFloat = 0
        var y = A0
        let iter = 0
        for _ in 0..<maxIteration {
            let Dy = A1 + x*(A22 + A33*x)
            let xnew = x - y/Dy
            if ((xnew == x)||(!xnew.isFinite)) {
                break
            }
            let ynew = A0 + xnew*(A1 + xnew*(A2 + xnew*A3))
            if (abs(ynew)>=abs(y)) { break }
            x = xnew;  y = ynew
        }
        
        //       computing paramters of the fitting circle
        let DET = x*x - x*Mz + Cov_xy
        let Xcenter = (Mxz*(Myy - x) - Myz*Mxy)/DET/2.0
        let Ycenter = (Myz*(Mxx - x) - Mxz*Mxy)/DET/2.0
        
        //       assembling the output
        var circle = CircleResult()
        
        circle.center.x = Xcenter + mean.x
        circle.center.y = Ycenter + mean.y
        circle.radius = sqrt(Xcenter*Xcenter + Ycenter*Ycenter + Mz)
        circle.error = Sigma(data: points,circle: circle)
        circle.j = iter  //  return the number of iterations, too
        return circle
        
    }
    
    //  Estimate of Sigma = square root of RSS divided by N
    //  Gives the root-mean-square error of the geometric circle fit
    static func Sigma(data: [CGPoint], circle: CircleResult) -> CGFloat {
        var sum: CGFloat = 0.0
        for p in data {
            let dx = p.x - circle.center.x
            let dy = p.y - circle.center.y
            let s = (sqrt(dx*dx+dy*dy) - circle.radius) / circle.radius //<- added / c.r to give normalized result
            sum += s*s
        }
        
        return sqrt(sum / CGFloat(data.count))
    }
}

struct CircleResult {
    var center: CGPoint
    var radius: CGFloat
    var error: CGFloat
    var j: Int
    
    init() {
        center = CGPoint(x: 0, y: 0)
        radius = 0
        error = 0
        j = 0
    }
}
