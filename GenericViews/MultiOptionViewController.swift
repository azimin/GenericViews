//
//  MultiOptionViewController.swift
//  GenericViews
//
//  Created by Alex Zimin on 04/02/16.
//  Copyright © 2016 Alex Zimin. All rights reserved.
//

import UIKit

enum MultiOptionButtonsType: Int {
  case RemindType
  case PushNotificationRequestType
  case ShareSuccess
  case UserType
}

extension UIView {
  enum UIViewFrameType {
    case Horizontal
    case Vertical
  }
  
  var viewFrameType: UIViewFrameType {
    return (frame.height > frame.width) ? .Vertical : .Horizontal
  }
}

class MultiOptionViewController: UIViewController {
  
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var subtitleLabel: UILabel!
  @IBOutlet weak var imageView: UIImageView!
  
  var dataContainer: MultiOptionViewControllerContainer = MultiOptionViewControllerContainer.templateContainer() {
    didSet {
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
    updateView()
    
    // Do any additional setup after loading the view.
  }
    
  override func updateViewConstraints() {
    super.updateViewConstraints()
    
    let screenWidth = UIScreen.mainScreen().bounds.width
    let screenHeight = UIScreen.mainScreen().bounds.height
    
     let width = min(screenWidth, screenHeight)
    let height = max(screenWidth, screenHeight)
    
    imageVerticalTopConstraint.constant = height * 0.04
    
    imageToLabelVerticalBottonConstraint.constant = height * 0.06
    
    let horizontalTopValue: CGFloat = round(pow(width, 4.35) * 0.06 / pow(320, 3.35))
    imageHorizontalTopConstraint.constant = horizontalTopValue
  }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    
    titleLabel.textAlignment = (view.viewFrameType == .Horizontal) ? .Left : .Center
    subtitleLabel.textAlignment = (view.viewFrameType == .Horizontal) ? .Left : .Center
  }
  
  func updateView() {
    guard isViewLoaded() else {
      return
    }
    
    titleLabel.text = dataContainer.title
    subtitleLabel.text = dataContainer.subtitle
    imageView.image = UIImage(named: dataContainer.imageName)
  }
  
  override func prefersStatusBarHidden() -> Bool {
    return true
  }
}
