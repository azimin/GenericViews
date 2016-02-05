//
//  MultiOptionViewControllerContainer.swift
//  GenericViews
//
//  Created by Alex Zimin on 05/02/16.
//  Copyright © 2016 Alex Zimin. All rights reserved.
//

import UIKit

class MultiOptionViewControllerContainer: NSObject {
  private(set) var title: String
  private(set) var subtitle: String
  private(set) var imageName: String
  
  init(title: String, subtitle: String, imageName: String) {
    self.title = title
    self.subtitle = subtitle
    self.imageName = imageName
  }
  
  static func templateContainer() -> MultiOptionViewControllerContainer {
    return MultiOptionViewControllerContainer(title: "TRY AGAIN - BUT TOMORROW", subtitle: "Hey, seems  you have truble with this exersise. Why don't you try again tomorrow and do something else in the meantime?", imageName: "push_notification_image")
  }
}
