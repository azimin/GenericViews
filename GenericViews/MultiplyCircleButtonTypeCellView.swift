//
//  MultiplyCircleButtonTypeCellView.swift
//  GenericViews
//
//  Created by Alex Zimin on 05/02/16.
//  Copyright © 2016 Alex Zimin. All rights reserved.
//

import UIKit

enum ViewType {
  case Horizontal
  case Vertical
}

class MultiplyCircleButtonTypeCellView: UIView {
  
  @IBOutlet weak private var titleLabelWidthConstraint: NSLayoutConstraint!
  @IBOutlet weak private var imageView: UIImageView!
  @IBOutlet weak private var titleLabel: UILabel!
  
  var imageName: String = "" {
    didSet {
      imageView.image = UIImage(named: imageName)
    }
  }
  
  var title: String {
    set {
      titleLabel.text = newValue
      titleLabelWidthConstraint.constant = min(UCTextFrameAttributes(string: newValue, font: titleLabel.font).textWidth, 219)
    }
    get {
      return titleLabel.text ?? ""
    }
  }
  
  static func createCell() -> MultiplyCircleButtonTypeCellView {
    return MultiplyCircleButtonTypeCellView().uc_loadFromNibWithNameIfEmbeddedInDifferentNib("MultiplyCircleButtonTypeCellView")
  }
}
