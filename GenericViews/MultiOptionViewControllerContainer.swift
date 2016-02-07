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
  private(set) var subtitle: String?
  private(set) var imageName: String
  private(set) var buttonsType: MultiOptionButtonsType
  private(set) var buttons: [MultiOptionViewButtonCellDataContainer]
  
  init(title: String, subtitle: String?, imageName: String, buttonsType: MultiOptionButtonsType, buttons: [MultiOptionViewButtonCellDataContainer]) {
    self.title = title
    self.subtitle = subtitle
    self.imageName = imageName
    self.buttonsType = buttonsType
    self.buttons = buttons
  }
  
  static func templateContainerForType(type: MultiOptionButtonsType) -> MultiOptionViewControllerContainer {
    
    switch type {
    case .TwoCirclesType:
      let buttons = [MultiOptionViewButtonCellDataContainer(title: "No, I want to try again now!", iconImageName: "repeat_reminder_screen_button", completionBlock: nil), MultiOptionViewButtonCellDataContainer(title: "Okey, remind me tomorrow!", iconImageName: "remind_reminder_screen_button", completionBlock: nil)]
      return MultiOptionViewControllerContainer(title: "TRY AGAIN - BUT TOMORROW", subtitle: "Hey, seems  you have truble with this exersise. Why don't you try again tomorrow and do something else in the meantime?", imageName: "uc_hut_icon", buttonsType: type, buttons: buttons)
    case .MultiplyCirclesType:
      let buttons = [MultiOptionViewButtonCellDataContainer(title: "Share on twitter", iconImageName: "twitter_share_success", completionBlock: nil), MultiOptionViewButtonCellDataContainer(title: "Tell your Friends", iconImageName: "facebook_share_success", completionBlock: nil), MultiOptionViewButtonCellDataContainer(title: "Play next exersise", iconImageName: "play_next_share_success", completionBlock: nil)]
      return MultiOptionViewControllerContainer(title: "HEY YOU JUST GAINED 20 PICKS", subtitle: "Hey, seems  you have truble with this exersise. Why don't you try again tomorrow and do something else in the meantime?", imageName: "trophy", buttonsType: type, buttons: buttons)
    case .MultiplyCirclesVerticalType:
      let buttons = [MultiOptionViewButtonCellDataContainer(title: "Never played guitar", iconImageName: "total_beginner", completionBlock: nil), MultiOptionViewButtonCellDataContainer(title: "Played some guitar", iconImageName: "beginner", completionBlock: nil), MultiOptionViewButtonCellDataContainer(title: "Advanced player", iconImageName: "advanced", completionBlock: nil)]
      return MultiOptionViewControllerContainer(title: "HEY, HOW WELL YOU ALREADY PLAYED", subtitle: nil, imageName: "uc_logo_user_type", buttonsType: type, buttons: buttons)
    case .ButtonsType:
      let buttons = [MultiOptionViewButtonCellDataContainer(title: "DONEC ULLAMCORPER NON METUS AUCTOR", iconImageName: nil, completionBlock: nil), MultiOptionViewButtonCellDataContainer(title: "Not now", iconImageName: nil, completionBlock: nil)]
      return MultiOptionViewControllerContainer(title: "PURUS FUSCE FRIGILLA AMET", subtitle: "Hey, seems  you have truble with this exersise. Why don't you try again tomorrow and do something else in the meantime?", imageName: "push_notification_image", buttonsType: type, buttons: buttons)
    }
  }
}
