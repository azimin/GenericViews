//
//  MultiOptionViewButtonCellDataContainer.swift
//  GenericViews
//
//  Created by Alex Zimin on 07/02/16.
//  Copyright © 2016 Alex Zimin. All rights reserved.
//

import Foundation

class MultiOptionViewButtonCellDataContainer: NSObject {
  var title: String
  var iconImageName: String?
  var completionBlock: (() -> ())?
  
  init(title: String, iconImageName: String? = nil, completionBlock: (() -> ())? = nil) {
    self.title = title
    self.iconImageName = iconImageName
    self.completionBlock = completionBlock
  }
}

protocol MultiOptionItemSettableCell {
  var item: MultiOptionViewButtonCellDataContainer! { set get }
}