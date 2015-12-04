//
//  ImageGenerator.swift
//  SRParallax
//
//  Created by Louis Tur on 12/4/15.
//  Copyright © 2015 Louis Tur. All rights reserved.
//

import Foundation
import UIKit

public class ImageGenerator: NSObject {
  
  var backgroundImage: UIImage? = UIImage(named: "forestImage")
  var foregroundImage: UIImage? = UIImage(named: "kittenOnBack")
  var midgroundImage: UIImage? = UIImage(named: "jumpingCat")
  
  public override init() {
    super.init()
  }
  
  public func generateForeGroundImage(withTiltRange tiltRange: CGFloat) -> UIImageView {
    let imageView: UIImageView = self.foregroundImageView
    self.addMotionEffectToView(imageView, withTiltRange: tiltRange)
    return imageView
  }
  
  public func generateBackGroundImage(withTiltRange tiltRange: CGFloat) -> UIImageView {
    let imageView: UIImageView = self.backgroundImageView
    self.addMotionEffectToView(imageView, withTiltRange: tiltRange)
    return imageView
  }
  
  public func generateMidGroundImage(withTiltRange tiltRange: CGFloat) -> UIImageView {
    let imageView: UIImageView = self.midgroundImageView
    self.addMotionEffectToView(imageView, withTiltRange: tiltRange)
    return imageView
  }
  
  func addMotionEffectToView(view: UIView, withTiltRange tiltRange: CGFloat) {
    let minXRange: CGFloat = -tiltRange
    let maxXRange: CGFloat = tiltRange
    
    let minYRange: CGFloat = -tiltRange
    let maxYRange: CGFloat = tiltRange
    
    let parallaxXEffect: UIInterpolatingMotionEffect = UIInterpolatingMotionEffect(keyPath: "center.x", type: .TiltAlongHorizontalAxis)
    parallaxXEffect.minimumRelativeValue = minXRange
    parallaxXEffect.maximumRelativeValue = maxXRange
    
    let parallaxYEffect: UIInterpolatingMotionEffect = UIInterpolatingMotionEffect(keyPath: "center.y", type: .TiltAlongVerticalAxis)
    parallaxYEffect.minimumRelativeValue = minYRange
    parallaxYEffect.maximumRelativeValue = maxYRange
    
    let effectsGroup: UIMotionEffectGroup = UIMotionEffectGroup()
    effectsGroup.motionEffects = [parallaxXEffect, parallaxYEffect]
    
    view.addMotionEffect(effectsGroup)
  }
  
  lazy var backgroundImageView: UIImageView = {
    var imageView: UIImageView = UIImageView(image: self.backgroundImage)
    imageView.contentMode = .ScaleToFill
    return imageView
  }()
  
  lazy var foregroundImageView: UIImageView = {
    var imageView: UIImageView = UIImageView(image: self.foregroundImage)
    imageView.contentMode = .ScaleAspectFit
    return imageView
  }()
  
  lazy var midgroundImageView: UIImageView = {
    var imageView: UIImageView = UIImageView(image: self.midgroundImage)
    imageView.contentMode = .ScaleAspectFit
    return imageView
  }()
  
  
}