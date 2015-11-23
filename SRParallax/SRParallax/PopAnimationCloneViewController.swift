//
//  PopAnimationClone.swift
//  SRParallax
//
//  Created by Louis Tur on 11/20/15.
//  Copyright © 2015 Louis Tur. All rights reserved.
//

import UIKit
import CoreGraphics
import Cartography

public class PopAnimationCloneViewController: UIViewController {
  
  override public func viewDidLoad() {
    super.viewDidLoad()
    self.view.backgroundColor = UIColor.whiteColor()
    
    self.topDrawingView.backgroundColor = UIColor.redColor()
    self.bottomDrawingView.backgroundColor = UIColor.yellowColor()
    
    self.view.addSubview(self.topDrawingView)
    self.view.addSubview(self.bottomDrawingView)
  }
  
  override public func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    self.configureConstraints()
    
    self.animateProgress(self.topDrawingView)
    //self.drawAFreakinLine(inView: self.bottomDrawingView)
    self.animateASingleLine(inView: self.bottomDrawingView)
  }
  
  func configureConstraints() {
    constrain([topDrawingView, bottomDrawingView]) { views -> () in
      let topView = views[0]
      let bottomView = views[1]
      let margin: CGFloat = 40.0
      
      topView.left == topView.superview!.left + margin
      topView.right == topView.superview!.right - margin
      topView.centerY == topView.superview!.centerY / 2.0
      topView.height == topView.width
      
      bottomView.left == bottomView.superview!.left + margin
      bottomView.right == bottomView.superview!.right - margin
      bottomView.centerY == bottomView.superview!.centerY * 1.5
      bottomView.height == bottomView.width
    }
    
  }
  
  public func animateProgress(inView: UIView) {
    let drawView: UIView = UIView(frame: CGRectMake(0.0,0.0,100,100))
    drawView.backgroundColor = UIColor.clearColor()
    //drawAFreakinLine(inView: drawView)
    
    let rectShape = CAShapeLayer()
    rectShape.bounds = CGRectMake(0.0, 0.0, drawView.frame.size.width / 2, drawView.frame.size.height / 2 )
    rectShape.anchorPoint = CGPointMake(0.0, 0.0)
    rectShape.position = CGPointMake(10.0, 10.0)
    rectShape.cornerRadius = drawView.frame.width / 4
    rectShape.backgroundColor = UIColor.redColor().CGColor
    drawView.layer.masksToBounds = false
    rectShape.masksToBounds = false
    drawView.layer.addSublayer(rectShape)
    
    rectShape.path = UIBezierPath(ovalInRect: rectShape.bounds).CGPath
    
    rectShape.lineWidth = 2.0
    rectShape.strokeColor = UIColor.lightGrayColor().CGColor
    rectShape.fillColor = UIColor.clearColor().CGColor
    
    // 2
    rectShape.strokeStart = 0
    rectShape.strokeEnd = 0.5
    
    // 3
    let start = CABasicAnimation(keyPath: "strokeStart")
    start.toValue = 0.7
    let end = CABasicAnimation(keyPath: "strokeEnd")
    end.toValue = 1
    
    // 4
    let group = CAAnimationGroup()
    group.animations = [start, end]
    group.duration = 1.5
    group.autoreverses = true
    group.repeatCount = HUGE // repeat forver
    rectShape.addAnimation(group, forKey: nil)
    
    inView.addSubview(drawView)
  }
  
  func animateASingleLine(inView view: UIView) {
    
    let (start, end): (CGPoint, CGPoint) = (CGPointMake(20.0, 20.0), CGPointMake(200.0, 20.0))
    let bezier: UIBezierPath = UIBezierPath()
    bezier.moveToPoint(start)
    bezier.addLineToPoint(end)
    
    let shapeLayer: CAShapeLayer = CAShapeLayer()
    shapeLayer.path = bezier.CGPath
    shapeLayer.frame = view.frame
    shapeLayer.strokeStart = 0.0
    shapeLayer.strokeEnd = 0.2
    shapeLayer.lineWidth = 10.0
    shapeLayer.fillColor = UIColor.clearColor().CGColor
    shapeLayer.strokeColor = UIColor.blueColor().CGColor
    
    let animationPath1 = CABasicAnimation(keyPath: "strokeStart")
    animationPath1.toValue = 0.8
    let animationPath2 = CABasicAnimation(keyPath: "strokeEnd")
    animationPath2.toValue = 1.0
    
    let animation = CAAnimationGroup()
    animation.animations = [animationPath1, animationPath2]
    animation.duration = 2.0
    animation.autoreverses = true
    animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
    animation.repeatCount = HUGE
    animation.removedOnCompletion = false
    
    shapeLayer.addAnimation(animation, forKey: nil)
    view.layer.addSublayer(shapeLayer)
  }
  
  func animateACheckMark(inView view: UIView) {
    let line1: (start: CGPoint, end: CGPoint) = (CGPointMake(20.0, 20.0), CGPointMake(40.0, 40.0))
    let line2: (start: CGPoint, end: CGPoint) = (line1.start, CGPointMake(60.0, 0.0))
    
    let line1BezierPath: UIBezierPath = UIBezierPath()
    line1BezierPath.moveToPoint(line1.start)
    line1BezierPath.addLineToPoint(line1.end)
    
    let line2BezierPath: UIBezierPath = UIBezierPath()
    line2BezierPath.moveToPoint(line2.start)
    line2BezierPath.addLineToPoint(line2.end)
    
    let shapeLayerForLine1: CAShapeLayer = CAShapeLayer()
    shapeLayerForLine1.path = line1BezierPath.CGPath
    shapeLayerForLine1.frame = view.frame
    shapeLayerForLine1.strokeColor = UIColor.blueColor().CGColor
    
    let shapeLayerForLine2: CAShapeLayer = CAShapeLayer()
    
    
  }
  
  lazy var topDrawingView: UIView = {
    let view: UIView = UIView()
    return view
  }()
  
  lazy var bottomDrawingView: UIView = {
    let view: UIView = UIView()
    return view
  }()
  
}