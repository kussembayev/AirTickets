//
//  ViewRoutines.swift
//  AirTicket
//
//  Created by Rauan Kussembayev on 10/7/17.
//  Copyright © 2017 kuzya. All rights reserved.
//

import UIKit

func CreateVC<T>(siblingProbably: UIViewController? = nil) -> T where T:UIViewController {
    var result: T?
    let controllerName = "\(T.self)"

    //Try to use UIViewController.storyboard to speedup
    if let vc = CreateVC(byName: controllerName, probablyStoryboard: siblingProbably?.storyboard) as? T {
        result = vc
    } else {
        result = T.init()
    }

    return result!
}

func CreateVC(byName controllerName: String, probablyStoryboard: UIStoryboard? = nil) -> UIViewController? {
    var result: UIViewController?

    if probablyStoryboard != nil {
        result = TryLoadVC(withName: controllerName, fromStoryboard: probablyStoryboard!)
    }

    if result == nil {
        if let loadedStoryboard = StoryboardForController(withName: controllerName) {
            result = TryLoadVC(withName: controllerName, fromStoryboard: loadedStoryboard)
        }
    }

    return result
}

func StoryboardForController(withName controllerName: String) -> UIStoryboard? {
    var storyboardName: String? = nil

    switch controllerName {
    case "CalendarViewController":
        storyboardName = "Purchase"

    default:
        storyboardName = controllerName.firstWord
    }

    var result: UIStoryboard?
    guard let storyboardNameGuard = storyboardName else {

        return result
    }

    do {
        result = UIStoryboard(name: storyboardNameGuard, bundle: nil)
    }

    return result
}

func TryLoadVC(withName controllerName: String, fromStoryboard storyboard: UIStoryboard) -> UIViewController? {
    var result: UIViewController?

    do {
        result = storyboard.instantiateViewController(withIdentifier: controllerName)
    }
    return result
}

func CreateView<T>(xibName: String? = nil, _ owner: Any? = nil) -> T where T:UIView {
    let viewName = xibName == nil ? "\(T.self)" : xibName!
    if let view = Bundle.main.loadNibNamed(viewName, owner: owner, options: nil)?.first as? T {
        return view
    } else {
        return T.init()
    }
}

func CreateSubview(xibName: String, owner: Any? = nil) -> UIView? {
    if let view = Bundle.main.loadNibNamed(xibName, owner: owner, options: nil)?.first as? UIView {
        return view
    } else {
        return nil
    }
}

func pin(_ item: UIView, toItem: UIView, attribute: NSLayoutAttribute, constant: CGFloat = 0 ) -> NSLayoutConstraint {
    return NSLayoutConstraint(item: item, attribute: attribute, relatedBy: .equal, toItem: toItem, attribute: attribute, multiplier: 1, constant: constant)
}
