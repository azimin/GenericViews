//
//  MultiplyCirclesVerticalButtonTypeCellView.swift
//  GenericViews
//
//  Created by Alex Zimin on 07/02/16.
//  Copyright © 2016 Alex Zimin. All rights reserved.
//

import UIKit

class MultiplyCirclesVerticalButtonTypeCellView: UIView, MultiOptionItemSettableCell {

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
      titleLabelWidthConstraint.constant = UCTextFrameAttributes(string: newValue, font: titleLabel.font).textWidth
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
  
  var index: Int = 0
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
    titleLabel.textColor = UIColor.uc_hexEEEEEEColor()
    titleLabel.font = UIFont.uc_helveticaNeueLightWithSize(16)
  }
  
  static func createCell() -> MultiplyCirclesVerticalButtonTypeCellView {
    return MultiplyCirclesVerticalButtonTypeCellView().uc_loadFromNibWithNameIfEmbeddedInDifferentNib("MultiplyCirclesVerticalButtonTypeCellView")
  }
  
  // Action
  
  @IBAction func buttonAction(sender: UIButton) {
    item.completionBlock?()
  }
  

}
