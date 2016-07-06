//
//  GraphicsViewControllerView.swift
//  Graphics
//
//  Created by adminstrator on 16/3/7.
//  Copyright © 2016年 ddd. All rights reserved.
//

import UIKit

class GraphicsViewControllerView: UIView {

    
    
    
    
    override func drawRect(rect: CGRect) {
        
        //获取绘图上下文
        let ctx : CGContextRef = UIGraphicsGetCurrentContext()!
        //设置线宽
        CGContextSetLineWidth(ctx, 16)
        
        CGContextSetRGBStrokeColor(ctx, 0, 1, 0, 1)
        
        let  points1 = [CGPoint(x: 10, y: 20) , CGPoint(x: 100, y: 20) , CGPoint(x: 100, y: 20) , CGPoint(x: 20, y: 50) ]
        
        
        CGContextStrokeLineSegments(ctx, points1, 4)
        
        CGContextSetLineCap(ctx, CGLineCap.Square)
        
        
        let points2 = [CGPoint(x: 110, y: 20) , CGPoint(x: 200, y: 20),
            CGPoint(x: 200, y: 20) , CGPoint(x: 120, y: 50)]
        
        CGContextStrokeLineSegments(ctx, points2, 4)
        CGContextSetLineCap(ctx, .Round)
        
        let points3 = [CGPoint(x: 210, y: 20) , CGPoint(x: 300, y: 20),
            CGPoint(x: 300, y: 20) , CGPoint(x: 220, y: 50)]
        
        CGContextStrokeLineSegments(ctx, points3, 4)
        
        
        CGContextSetLineCap(ctx, .Butt)
        
        CGContextSetLineWidth(ctx, 10)
        
        let patterns1 : [CGFloat] = [6.0, 10.0]
        
        CGContextSetLineDash(ctx, 0, patterns1, 1)
        
        let points4 = [CGPoint(x: 40, y: 65) ,CGPoint(x: 280, y: 65)]
        
        CGContextStrokeLineSegments(ctx, points4, 2)
        
        CGContextSetLineDash(ctx, 3, patterns1, 1)
        
        let points5 = [CGPoint(x: 40, y: 85) , CGPoint(x: 280, y: 85)]
        
        CGContextStrokeLineSegments(ctx, points5, 2)
        
        let patterns2 :[CGFloat] = [5,1,4,1,3,1,2,1,1,1,1,2,1,3,1,4,1,5]
        CGContextSetLineDash(ctx, 0, patterns2, 18)
        
        let points6 = [CGPoint(x: 40, y: 105) ,CGPoint(x: 280, y: 105)]
        
        CGContextStrokeLineSegments(ctx, points6, 2)
        
        
        CGContextSetStrokeColorWithColor(ctx, UIColor.blueColor().CGColor)
        
        CGContextSetLineWidth(ctx, 14)
        
        CGContextSetFillColorWithColor(ctx, UIColor.redColor().CGColor)
        
        CGContextFillRect(ctx, CGRect(x: 30, y: 120, width: 120, height: 60))
        
        CGContextSetFillColorWithColor(ctx, UIColor.yellowColor().CGColor)
        
        CGContextFillRect(ctx, CGRect(x: 80, y: 160, width: 120, height: 60))
        
        CGContextSetLineDash(ctx, 0, UnsafePointer(bitPattern: 0), 0)
        
        CGContextStrokeRect(ctx, CGRect(x: 30, y: 230, width: 120, height: 60))
        
        CGContextSetStrokeColorWithColor(ctx, UIColor.purpleColor().CGColor)
        
        CGContextSetLineJoin(ctx, .Round)
        
        CGContextStrokeRect(ctx, CGRect(x: 80, y: 260, width: 120, height: 60))
        
        CGContextSetRGBStrokeColor(ctx, 1, 0, 1, 1)
        
        CGContextSetLineJoin(ctx, .Bevel)
        
        CGContextStrokeRect(ctx, CGRect(x: 130, y:290, width: 120, height: 60))
        
        CGContextSetRGBStrokeColor(ctx, 0, 1, 1, 1)
        
        CGContextStrokeEllipseInRect(ctx, CGRect(x: 30, y: 380, width: 120, height: 60))
        
        CGContextSetRGBFillColor(ctx, 1, 0, 1, 1)
        
        CGContextFillEllipseInRect(ctx, CGRect(x: 180, y: 380, width: 120, height: 60))
        
    }
    
}
