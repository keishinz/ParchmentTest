//
//  ViewController.swift
//  ParchmentTest
//
//  Created by Keishin CHOU on 2020/01/03.
//  Copyright © 2020 Keishin CHOU. All rights reserved.
//

import UIKit

import Parchment

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let view1 = ViewControllerOne(index: 1)
        let view2 = ViewControllerOne(index: 2)
        let view3 = ViewControllerOne(index: 3)
        let view4 = ViewControllerOne(index: 2)
        let view5 = ViewControllerOne(index: 3)

        let pagingViewController = FixedPagingViewController(viewControllers: [
          view1,
          view2,
          view3,
          view4,
          view5,
        ])
        addChild(pagingViewController)
        view.addSubview(pagingViewController.view)
        view.constrainToEdges(pagingViewController.view)
        pagingViewController.didMove(toParent: self)
        pagingViewController.view.translatesAutoresizingMaskIntoConstraints = false
        
//        NSLayoutConstraint.activate([
//          pagingViewController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//          pagingViewController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//          pagingViewController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
//          pagingViewController.view.topAnchor.constraint(equalTo: view.topAnchor)
//        ])
        
    }


}

