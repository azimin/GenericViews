//
//  ViewController.swift
//  GenericViews
//
//  Created by Alex Zimin on 04/02/16.
//  Copyright © 2016 Alex Zimin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  override func prefersStatusBarHidden() -> Bool {
    return true
  }

}

extension ViewController: UITableViewDataSource {
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 4
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = UITableViewCell(style: .Default, reuseIdentifier: nil)
    cell.textLabel?.text = "Test"
    return cell
  }
}

extension ViewController: UITableViewDelegate {
  func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    tableView.deselectRowAtIndexPath(indexPath, animated: true)
    
    let type: MultiOptionButtonsType
    switch indexPath.row {
    case 0:
      type = .TwoCirclesType
    case 1:
      type = .MultiplyCirclesType
    case 2:
      type = .MultiplyCirclesVerticalType
    default:
      type = .ButtonsType
    }
    
    let contoller = MultiOptionViewController.multiOptionViewCotnrollerWithDataContainer(MultiOptionViewControllerContainer.templateContainerForType(type))
    self.presentViewController(contoller, animated: true, completion: nil)
  }
}

