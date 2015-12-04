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
  
  var background: UIImageView = ImageGenerator().backgroundImageView
  var foreground: UIImageView = ImageGenerator().midgroundImageView
  var midground: UIImageView = ImageGenerator().foregroundImageView

  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.view.addSubview(background)
    self.background.addSubview(midground)
    self.background.addSubview(foreground)
  }
  
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    self.configureConstraints()
  }
  
  func configureConstraints() {
    
    constrain([background, midground, foreground]) { views -> () in
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

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
}

