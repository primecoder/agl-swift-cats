//
//  ViewController.swift
//  SwiftCats
//
//  Created by Yilei He on 3/4/20.
//  Copyright © 2020 Yilei He. All rights reserved.
//

import UIKit

// NOTE: This file is unused in this project and kept here for references purposes.
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        NetworkService().getOwners { (owners) in
            print(owners)
        }
    }
}

