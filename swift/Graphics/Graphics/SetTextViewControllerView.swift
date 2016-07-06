//
//  SetTextViewControllerView.swift
//  Graphics
//
//  Created by adminstrator on 16/3/9.
//  Copyright © 2016年 ddd. All rights reserved.
//

import UIKit

class SetTextViewControllerView: UIView {

    var scaleRate : CGFloat  = 0 {
        didSet{
            self.setNeedsDisplay()
        }
    }
    
    var rorateAngle : Double = 0 {
        didSet {
            self.setNeedsDisplay()
        }
    }
    
    override func drawRect(rect: CGRect) {
        
        let ctx = UIGraphicsGetCurrentContext()
        //设置字符间距
        CGContextSetCharacterSpacing(ctx, 4)
        //填充颜色
        CGContextSetRGBFillColor(ctx, 1, 0, 1, 1)
        //线条颜色
        CGContextSetRGBStrokeColor(ctx, 0, 0, 1, 1)
        //设置使用填充模式绘制文字
        CGContextSetTextDrawingMode(ctx, .Fill)
        
        NSString(string: "深圳深圳深圳").drawAtPoint(CGPoint(x: 10, y: 20), withAttributes: [
            NSFontAttributeName: UIFont(name: "Arial Rounded MT Bold", size: 45)!,
            NSForegroundColorAttributeName: UIColor.magentaColor()
            ])
        //使用描边模式
        CGContextSetTextDrawingMode(ctx, .Stroke)
        //绘制文字
        NSString(string: "最炫名族风").drawAtPoint(CGPoint(x: 10, y: 80), withAttributes: [
            NSFontAttributeName:UIFont(name: "Heiti SC", size: 40)!,
            NSForegroundColorAttributeName: UIColor.blueColor()
            ])
        
        //设置使用填充、描边模式绘制文字
        CGContextSetTextDrawingMode(ctx, .FillStroke)
        NSString(string: "小苹果").drawAtPoint(CGPoint(x: 10, y: 130), withAttributes: [
            NSFontAttributeName: UIFont(name: "Heiti SC", size: 50)!,
            NSForegroundColorAttributeName: UIColor.magentaColor()
            ])
        
        //定义一个垂直镜像的变换举证
        let  yRevert : CGAffineTransform = CGAffineTransform(a: 1, b: 0, c: 0, d: -1, tx: 0, ty: 0)
        //设置绘制文本的字体和大小
        //CGContextSetFont(ctx,)
        
        //let scale = CGAffineTransformScale(yRevert, self.scaleRate, self.scaleRate)
        //let rotate = CGAffineTransformRotate(scale, CGFloat(  M_PI * self.rorateAngle / Double( 100)))
        
        //CGContextSetTextMatrix(ctx, rotate)
        CGContextScaleCTM(ctx, self.scaleRate, self.scaleRate)
        
        CGContextRotateCTM(ctx, CGFloat(  M_PI * self.rorateAngle / Double( 100)))
        
        //CGContextShowTextAtPoint
    }
    
    
}
