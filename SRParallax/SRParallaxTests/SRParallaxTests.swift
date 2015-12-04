//
//  SRParallaxTests.swift
//  SRParallaxTests
//
//  Created by Louis Tur on 12/4/15.
//  Copyright © 2015 Louis Tur. All rights reserved.
//

import XCTest
import SRParallax

class SRParallaxTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
  func testImageViewsReturnedAreNotNil() {
    
    let imageView1: UIImageView = ImageGenerator().generateBackGroundImage(withTiltRange: 15.0)
    let imageView2: UIImageView = ImageGenerator().generateMidGroundImage(withTiltRange: 25.0)
    let imageView3: UIImageView = ImageGenerator().generateForeGroundImage(withTiltRange: 40.0)
    
    XCTAssert(imageView1.motionEffects.count > 0, "Returned imageView should have motionEffects")
    XCTAssert(imageView2.motionEffects.count > 0, "Returned imageView should have motionEffects")
    XCTAssert(imageView3.motionEffects.count > 0, "Returned imageView should have motionEffects")
  }
}
