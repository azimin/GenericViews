//
//  TwoCircleButtonTypeCellView.swift
//  GenericViews
//
//  Created by Alex Zimin on 05/02/16.
//  Copyright © 2016 Alex Zimin. All rights reserved.
//

import UIKit

class TwoCirclesButtonTypeCellView: UIView {
  
  @IBOutlet weak var titleLabelWidthConstraint: NSLayoutConstraint!
  
  var titleLabelWidthConstraintValue: CGFloat = 110 {
    didSet {
      titleLabelWidthConstraint?.constant = titleLabelWidthConstraintValue
    }
  }
  
  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet weak var titleLabel: UILabel!
  
  static func createCell() -> TwoCirclesButtonTypeCellView {
    return TwoCirclesButtonTypeCellView().uc_loadFromNibWithNameIfEmbeddedInDifferentNib("TwoCirclesButtonTypeCellView")
  }
  
  override func awakeFromNib() {
    super.awakeFromNib()
    titleLabelWidthConstraint.constant = titleLabelWidthConstraintValue
  }
}
