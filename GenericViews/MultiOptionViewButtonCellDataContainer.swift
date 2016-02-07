//
//  MultiOptionViewButtonCellDataContainer.swift
//  GenericViews
//
//  Created by Alex Zimin on 07/02/16.
//  Copyright © 2016 Alex Zimin. All rights reserved.
//

import Foundation

class MultiOptionViewButtonCellDataContainer: NSObject {
  private(set) var title: String
  private(set) var iconImageName: String?
  var completionBlock: (() -> ())?
  
  init(title: String, iconImageName: String? = nil, completionBlock: (() -> ())? = nil) {
    self.title = title
    self.iconImageName = iconImageName
    self.completionBlock = completionBlock
  }
}

protocol MultiOptionItemSettableCell {
  var item: MultiOptionViewButtonCellDataContainer! { set get }
  var index: Int { set get }
}