//
//  TwoCircleButtonTypeCellView.swift
//  GenericViews
//
//  Created by Alex Zimin on 05/02/16.
//  Copyright © 2016 Alex Zimin. All rights reserved.
//

import UIKit

class TwoCirclesButtonTypeCellView: UIView, MultiOptionItemSettableCell {
  
  @IBOutlet weak private var titleLabelWidthConstraint: NSLayoutConstraint!
  
  var titleLabelWidthConstraintValue: CGFloat = 110 {
    didSet {
      titleLabelWidthConstraint?.constant = titleLabelWidthConstraintValue
    }
  }
  
  @IBOutlet weak private var imageView: UIImageView!
  @IBOutlet weak private var titleLabel: UILabel!
  
  var item: MultiOptionViewButtonCellDataContainer! {
    didSet {
      imageView.image = UIImage(named: item.iconImageName!)
      titleLabel.text = item.title
    }
  }
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
    titleLabel.textColor = UIColor.uc_hexEEEEEEColor()
    titleLabel.font = UIFont.uc_helveticaNeueLightWithSize(16)
  }
  
  static func createCell() -> TwoCirclesButtonTypeCellView {
    return TwoCirclesButtonTypeCellView().uc_loadFromNibWithNameIfEmbeddedInDifferentNib("TwoCirclesButtonTypeCellView")
  }
}
