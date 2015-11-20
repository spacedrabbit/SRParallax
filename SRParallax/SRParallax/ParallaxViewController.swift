//
//  ViewController.swift
//  SRParallax
//
//  Created by Louis Tur on 11/20/15.
//  Copyright © 2015 Louis Tur. All rights reserved.
//

import UIKit
import Cartography

class ParallaxViewController: UIViewController {
  
  var backgroundImage: UIImage? = UIImage(named: "forestImage")
  var foregroundImage: UIImage? = UIImage(named: "kittenOnBack")
  var midgroundImage: UIImage? = UIImage(named: "jumpingCat")
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.view.addSubview(self.backgroundImageView)
    self.backgroundImageView.addSubview(self.midgroundImageView)
    self.backgroundImageView.addSubview(self.foregroundImageView)
  }
  
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    self.configureConstraints()
    self.addMotionEffectToView(self.backgroundImageView, withTiltRange: 15.0)
    self.addMotionEffectToView(self.foregroundImageView, withTiltRange: 40.0)
    self.addMotionEffectToView(self.midgroundImageView, withTiltRange: 20.0)
  }
  
  func configureConstraints() {
    
    constrain([backgroundImageView, midgroundImageView, foregroundImageView]) { views -> () in
      let backgroundImageView = views[0]
      let midgroundImageView = views[1]
      let foregroundImageView = views[2]
      
      backgroundImageView.center == backgroundImageView.superview!.center
      backgroundImageView.height == backgroundImageView.superview!.height * 1.25
      
      midgroundImageView.top == midgroundImageView.superview!.top + 120.0
      midgroundImageView.centerX == midgroundImageView.superview!.centerX
      midgroundImageView.height == 80.0
      
      foregroundImageView.centerX == foregroundImageView.superview!.centerX + 30.0
      foregroundImageView.centerY == foregroundImageView.superview!.centerY - 10.0
      foregroundImageView.height == 100.0
    }
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
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
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

