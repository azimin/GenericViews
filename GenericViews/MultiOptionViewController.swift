//
//  MultiOptionViewController.swift
//  GenericViews
//
//  Created by Alex Zimin on 04/02/16.
//  Copyright © 2016 Alex Zimin. All rights reserved.
//

import UIKit
import OAStackView

extension UIView {
  enum UIViewFrameType {
    case Horizontal
    case Vertical
  }
  
  var viewFrameType: UIViewFrameType {
    return (frame.height > frame.width) ? .Vertical : .Horizontal
  }
}

extension CGSize {
  enum FrameType {
    case Horizontal
    case Vertical
  }
  
  var viewFrameType: FrameType {
    return (height > width) ? .Vertical : .Horizontal
  }
}

class MultiOptionViewController: UIViewController {  
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var subtitleLabel: UILabel!
  @IBOutlet weak var imageView: UIImageView!
  
  @IBOutlet weak var differentAligmentCircleButtonTypeStackView: OAStackView!
  @IBOutlet var differentAligmentCircleButtonTypeStackViewHightConstraint: NSLayoutConstraint!
  @IBOutlet weak var differentAligmentCircleButtonTypeStackViewBottomConstraint: NSLayoutConstraint!
  
  @IBOutlet weak var verticalAligmentCircleButtonTypeStackView: OAStackView!
  @IBOutlet weak var verticalAligmentCircleButtonTypeStackViewBottomConstraint: NSLayoutConstraint!
  
  var isDataContaierAlreadySet: Bool = false
  var dataContainer: MultiOptionViewControllerContainer! = MultiOptionViewControllerContainer.templateContainer() {
    didSet {
      assert(!isViewLoaded(), "Must be set before view is loaded")
      assert(!isDataContaierAlreadySet, "Must be set just once")
      
      isDataContaierAlreadySet = true
      
      updateView()
    }
  }
  
  // MARK: - Horizontal
  
  @IBOutlet weak var viewHorizontalTopConstraint: NSLayoutConstraint!
  @IBOutlet weak var imageHorizontalTopConstraint: NSLayoutConstraint!
  
  // MARK: - Vertical
  
  @IBOutlet weak var imageVerticalTopConstraint: NSLayoutConstraint!
  @IBOutlet weak var imageToLabelVerticalBottonConstraint: NSLayoutConstraint!
  
  // MARK: - Base
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // FIXME: - Remove after tests
    updateView()
    
    differentAligmentCircleButtonTypeStackView.distribution = OAStackViewDistribution.FillProportionally
  }
    
  override func updateViewConstraints() {
    super.updateViewConstraints()
    
    let width = min(screenWidth, screenHeight)
    let height = max(screenWidth, screenHeight)
    
    imageVerticalTopConstraint.constant = height * 0.04
    
    imageToLabelVerticalBottonConstraint.constant = height * 0.06
    
    let horizontalTopValue: CGFloat = round(pow(width, 4.35) * 0.06 / pow(320, 3.35))
    imageHorizontalTopConstraint.constant = horizontalTopValue
    
    updateBottomViewConstraints()
  }
  
  func updateBottomViewConstraints() {
    let width = min(screenWidth, screenHeight)
    
    switch dataContainer.buttonsType {
    case .TwoCirclesType:
      let value = round(pow(width, 4.32) * 0.09 / pow(320, 3.32))
      differentAligmentCircleButtonTypeStackViewBottomConstraint.constant = value
    case .MultiplyCirclesType:
      let value = round(pow(width, 4) * 0.09 / pow(320, 3))
      differentAligmentCircleButtonTypeStackViewBottomConstraint.constant = value
    case .MultiplyCirclesVerticalType:
      let value = round(pow(width, 3.6) * 0.09 / pow(320, 2.6))
      verticalAligmentCircleButtonTypeStackViewBottomConstraint.constant = value
    case .ButtonsType:
      let value = round(pow(width, 4.28) * 0.07 / pow(320, 3.28))
      verticalAligmentCircleButtonTypeStackViewBottomConstraint.constant = value
      break
    }
  }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    
    //let width = min(screenWidth, screenHeight)
    let height = max(screenWidth, screenHeight)
    
    titleLabel.textAlignment = (view.viewFrameType == .Horizontal) ? .Left : .Center
    subtitleLabel.textAlignment = (view.viewFrameType == .Horizontal) ? .Left : .Center
    
    switch dataContainer.buttonsType {
    case .MultiplyCirclesType:
      differentAligmentCircleButtonTypeStackView.spacing = (view.viewFrameType == .Horizontal) ? height * 0.23 : height * 0.04
      fallthrough
    case .TwoCirclesType:
      differentAligmentCircleButtonTypeStackView.axis = (view.viewFrameType == .Horizontal) ? .Horizontal : .Vertical
    default:
      break
    }
  }
  
  func updateView() {
    guard isViewLoaded() else {
      return
    }
    
    titleLabel.text = dataContainer.title
    subtitleLabel.text = dataContainer.subtitle
    imageView.image = UIImage(named: dataContainer.imageName)
    
    switch dataContainer.buttonsType {
    case .TwoCirclesType:
      differentAligmentCircleButtonTypeStackView.hidden = false
      differentAligmentCircleButtonTypeStackViewHightConstraint.constant = 50
      addTwoSmallButtons()
    case .MultiplyCirclesType:
      differentAligmentCircleButtonTypeStackView.hidden = false
      differentAligmentCircleButtonTypeStackViewHightConstraint.constant = 60
      addSmallButtons()
    case .MultiplyCirclesVerticalType:
      verticalAligmentCircleButtonTypeStackView.hidden = false
      addSmallVerticalButtons()
    case .ButtonsType:
      verticalAligmentCircleButtonTypeStackView.hidden = false
      addBasicButtons()
      break
    }
  }
  
  func addTwoSmallButtons() {
    let height = max(screenWidth, screenHeight)
    let buttons = [TwoCirclesButtonTypeCellView.createCell(), TwoCirclesButtonTypeCellView.createCell()]
    
    for button in buttons { 
      button.titleLabelWidthConstraintValue = height * 0.25
      differentAligmentCircleButtonTypeStackView.addArrangedSubview(button)
    }
  }
  
  func addSmallButtons() {
    let buttons = [MultiplyCirclesButtonTypeCellView.createCell(), MultiplyCirclesButtonTypeCellView.createCell(), MultiplyCirclesButtonTypeCellView.createCell()]
    
    for button in buttons { 
      button.title = "Share to Twitter"
      differentAligmentCircleButtonTypeStackView.addArrangedSubview(button)
    }
  }
  
  func addSmallVerticalButtons() {
    let buttons = [MultiplyCirclesVerticalButtonTypeCellView.createCell(), MultiplyCirclesVerticalButtonTypeCellView.createCell(), MultiplyCirclesVerticalButtonTypeCellView.createCell()]
    
    for button in buttons { 
      button.title = "Share to Twitter"
      verticalAligmentCircleButtonTypeStackView.addArrangedSubview(button)
    }
  }
  
  func addBasicButtons() {
    let buttons = [BasicButtonTypeCellView.createCell(), BasicButtonTypeCellView.createCell()]
    
    for (index, button) in buttons.enumerate() {
      button.type = (index == 0) ? .Attention : .Basic
      button.title = (index == 0) ? "Test test test test test test Test test test test test test" : "Test"
      verticalAligmentCircleButtonTypeStackView.addArrangedSubview(button)
    }
  }
  
  override func prefersStatusBarHidden() -> Bool {
    return true
  }
}

extension MultiOptionViewController {
  var screenWidth: CGFloat {
    return UIScreen.mainScreen().bounds.width
  }
  
  var screenHeight: CGFloat {
    return UIScreen.mainScreen().bounds.height
  }
}
