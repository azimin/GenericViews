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
  
  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet weak var titleLabel: UILabel!
  
  static func createCell() -> MultiplyCircleButtonTypeCellView {
    return MultiplyCircleButtonTypeCellView().uc_loadFromNibWithNameIfEmbeddedInDifferentNib("MultiplyCircleButtonTypeCellView")
  }
}
