//
//  DashLineView.swift
//  Graphics
//
//  Created by adminstrator on 16/3/8.
//  Copyright © 2016年 ddd. All rights reserved.
//

import UIKit

class DashLineView: UIView {

    var dashPattern = [CGFloat]()
    var dashCount : Int = 0
    
    var pattern = Pattern( pattern: [10.0], count:  0)  {

        didSet {
            dashPattern = pattern.pattern
            dashCount = pattern.count
            setNeedsDisplay()
        }
    }
    
    var dashPhase : CGFloat = 0.0 {
        didSet {
            if dashPhase != oldValue {
                self.setNeedsDisplay()
            }
        }
    }
    
    /*
    
    override init(frame: CGRect) {
        
        dashCount = 0
        dashPhase = 0.0
        
        super.init(frame: frame)
        self.opaque = true
        self.backgroundColor = UIColor.blackColor()
        self.clearsContextBeforeDrawing = true

        
    }
    
    required init?(coder aDecoder: NSCoder) {
        dashCount = 0
        dashPhase = 0.0

        super.init(coder: aDecoder)
    }
    */
    

    override func drawRect(rect: CGRect) {
        let ctx = UIGraphicsGetCurrentContext()
        CGContextSetRGBStrokeColor(ctx, 1.0, 0.0, 1.0, 1.0)
        CGContextSetLineWidth(ctx, 2.0)
        CGContextSetLineDash(ctx, dashPhase, dashPattern, dashCount )
        
        let line1 = [
            CGPoint(x: 10.0, y: 20.0), CGPoint(x: 310.0, y: 20.0)
        ]
        CGContextStrokeLineSegments(ctx, line1, 2)
        let line2 = [
            CGPoint(x: 160.0, y: 130.0), CGPoint(x: 160.0, y: 130.0)
        ]
        CGContextStrokeLineSegments(ctx, line2, 2)
        CGContextStrokeRect(ctx, CGRect(x: 10, y: 30, width: 100, height: 100)  )
        
        CGContextStrokeEllipseInRect(ctx, CGRect(x: 210, y: 30, width: 100, height: 100))
    }
    
}
