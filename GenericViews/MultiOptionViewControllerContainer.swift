//
//  MultiOptionViewControllerContainer.swift
//  GenericViews
//
//  Created by Alex Zimin on 05/02/16.
//  Copyright © 2016 Alex Zimin. All rights reserved.
//

import UIKit

enum MultiOptionButtonsType: Int {
  case TwoCirclesType
  case MultiplyCirclesType
  case MultiplyCirclesVerticalType
  case ButtonsType
}

class MultiOptionViewControllerContainer: NSObject {
  private(set) var title: String
  private(set) var subtitle: String
  private(set) var imageName: String
  private(set) var buttonsType: MultiOptionButtonsType
  
  init(title: String, subtitle: String, imageName: String, buttonsType: MultiOptionButtonsType) {
    self.title = title
    self.subtitle = subtitle
    self.imageName = imageName
    self.buttonsType = buttonsType
  }
  
  static func templateContainer() -> MultiOptionViewControllerContainer {
    return MultiOptionViewControllerContainer(title: "TRY AGAIN - BUT TOMORROW", subtitle: "", imageName: "push_notification_image", buttonsType: .MultiplyCirclesVerticalType)
  }
}
