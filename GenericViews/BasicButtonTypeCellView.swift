//
//  BasicButtonTypeCellView.swift
//  GenericViews
//
//  Created by Alex Zimin on 07/02/16.
//  Copyright © 2016 Alex Zimin. All rights reserved.
//

import UIKit

class BasicButtonTypeCellView: UIView, MultiOptionItemSettableCell {

  enum Type {
    case Attention
    case Basic
  }
  
  @IBOutlet weak private var button: UIButton!
  var gradientLayer: CAGradientLayer?
  
  @IBOutlet weak private var buttonHeightConstraint: NSLayoutConstraint!
  @IBOutlet weak private var buttonWidthConstraint: NSLayoutConstraint!
  
  var title: String = "" {
    didSet {
      button.setTitle(title, forState: .Normal)
      layoutSubviews()
    }
  }
  
  override func awakeFromNib() {
    button.layer.masksToBounds = true
    button.layer.borderColor = UIColor.uc_hex999999Color().CGColor
    button.layer.cornerRadius = button.frame.height / 2
    
    button.titleLabel?.numberOfLines = 0
    button.titleLabel?.textAlignment = .Center
    button.titleLabel?.font = UIFont.uc_helveticaNeueMediumFontWithSize(14)
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    
    button.layer.cornerRadius = button.frame.height / 2
    gradientLayer?.frame = CGRect(x: 0.0, y: 0.0, width: button.frame.size.width, height: button.frame.size.height)
  }
  
  var item: MultiOptionViewButtonCellDataContainer! {
    didSet {
      title = item.title
    }
  }
  
  var index: Int = 0 {
    didSet {
      self.type = (index == 0) ? .Attention : .Basic
    }
  }
  
  var type: Type = .Basic {
    didSet {
      gradientLayer?.removeFromSuperlayer()
      button.layer.borderWidth = 0.0
      button.setTitleColor(UIColor.uc_hexEEEEEEColor(), forState: .Normal)
      
      switch type {
      case .Attention:
        addGradient()
        buttonHeightConstraint.constant = 55
      case .Basic:
        button.layer.borderWidth = 1.0
        button.setTitleColor(UIColor.uc_hexEEEEEEColor().colorWithAlphaComponent(0.7), forState: .Normal)
        buttonHeightConstraint.constant = 32
      }
    }
  }
  
  func addGradient() {
    let gradient: CAGradientLayer = CAGradientLayer()
    
    gradient.colors = [UIColor(fromHexString: "F56218").CGColor, UIColor(fromHexString: "DD1003").CGColor]
    gradient.locations = [0.0 , 1.0]
    gradient.startPoint = CGPoint(x: 0.5, y: 0.0)
    gradient.endPoint = CGPoint(x: 0.5, y: 1.0)
    
    gradient.frame = CGRect(x: 0.0, y: 0.0, width: button.frame.size.width, height: button.frame.size.height)
    
    button.layer.insertSublayer(gradient, atIndex: 0)
    
    gradientLayer = gradient
  }
  
  static func createCell() -> BasicButtonTypeCellView {
    return BasicButtonTypeCellView().uc_loadFromNibWithNameIfEmbeddedInDifferentNib("BasicButtonTypeCellView")
  }
  
  @IBAction func buttonAction(sender: UIButton) {
    item.completionBlock?()
  }

}
