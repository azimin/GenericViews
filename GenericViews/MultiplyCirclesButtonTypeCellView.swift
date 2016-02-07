//
//  MultiplyCircleButtonTypeCellView.swift
//  GenericViews
//
//  Created by Alex Zimin on 05/02/16.
//  Copyright © 2016 Alex Zimin. All rights reserved.
//

import UIKit

class MultiplyCirclesButtonTypeCellView: UIView, MultiOptionItemSettableCell {
  
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
  
  var item: MultiOptionViewButtonCellDataContainer! {
    didSet {
      imageName = item.iconImageName!
      title = item.title
    }
  }
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
    titleLabel.textColor = UIColor.uc_hexEEEEEEColor()
    titleLabel.font = UIFont.uc_helveticaNeueWithSize(12)
  }
  
  static func createCell() -> MultiplyCirclesButtonTypeCellView {
    return MultiplyCirclesButtonTypeCellView().uc_loadFromNibWithNameIfEmbeddedInDifferentNib("MultiplyCirclesButtonTypeCellView")
  }
}
