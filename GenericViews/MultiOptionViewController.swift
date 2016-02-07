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
  
  @IBOutlet weak var twoCircleButtonTypeStackView: OAStackView!
  @IBOutlet var twoCircleButtonTypeStackViewHightConstraint: NSLayoutConstraint!
  
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
  
  @IBOutlet weak var twoCircleButtonTypeStackViewBottomConstraint: NSLayoutConstraint!
  
  // MARK: - Vertical
  
  @IBOutlet weak var imageVerticalTopConstraint: NSLayoutConstraint!
  @IBOutlet weak var imageToLabelVerticalBottonConstraint: NSLayoutConstraint!
  
  // MARK: - Base
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // FIXME: - Remove after tests
    updateView()
    
    twoCircleButtonTypeStackView.distribution = OAStackViewDistribution.FillProportionally
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
      let twoCircleButtonTypeStackViewValue = round(pow(width, 4.32) * 0.09 / pow(320, 3.32))
      twoCircleButtonTypeStackViewBottomConstraint.constant = twoCircleButtonTypeStackViewValue
    case .MultiplyCirclesType:
      let twoCircleButtonTypeStackViewValue = round(pow(width, 3.6) * 0.09 / pow(320, 2.6))
      twoCircleButtonTypeStackViewBottomConstraint.constant = twoCircleButtonTypeStackViewValue
    default:
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
      twoCircleButtonTypeStackView.spacing = (view.viewFrameType == .Horizontal) ? height * 0.23 : height * 0.04
      fallthrough
    case .TwoCirclesType:
      twoCircleButtonTypeStackView.axis = (view.viewFrameType == .Horizontal) ? .Horizontal : .Vertical
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
    
    let type = dataContainer.buttonsType 
    if type == .TwoCirclesType {
      twoCircleButtonTypeStackView.hidden = false
      addTwoSmallButtons()
    } else if type == .MultiplyCirclesType {
      twoCircleButtonTypeStackView.hidden = false
      twoCircleButtonTypeStackViewHightConstraint.constant = 60
      addSmallButtons()
    }
  }
  
  func addTwoSmallButtons() {
    let height = max(screenWidth, screenHeight)
    let buttons = [TwoCircleButtonTypeCellView.createCell(), TwoCircleButtonTypeCellView.createCell()]
    
    for button in buttons { 
      button.titleLabelWidthConstraintValue = height * 0.25
      twoCircleButtonTypeStackView.addArrangedSubview(button)
    }
  }
  
  func addSmallButtons() {
    let buttons = [MultiplyCircleButtonTypeCellView.createCell(), MultiplyCircleButtonTypeCellView.createCell(), MultiplyCircleButtonTypeCellView.createCell()]
    
    for button in buttons { 
      button.title = "Share to Twitter"
      twoCircleButtonTypeStackView.addArrangedSubview(button)
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
