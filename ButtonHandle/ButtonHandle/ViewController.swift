//
//  ViewController.swift
//  ButtonHandle
//
//  Created by allthings_LuYD on 16/8/23.
//  Copyright © 2016年 scrum_snail. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let moveView = UIView()
    override func viewDidLoad() {
        super.viewDidLoad()
        move.ss_ignore_event = false
        move.ss_accepet_time = 3
        moveView.frame = CGRect(x: 0, y: 0, width: 50, height: 50);
        moveView.backgroundColor = UIColor.black()
        moveView.center = CGPoint(x: 50, y: 50)
        self.view.addSubview(moveView)
    }

    @IBOutlet weak var move: UIButton!
    @IBAction func moveAction(_ sender: AnyObject) {
        UIView.animate(withDuration: 3, animations: {
            self.moveView.center = CGPoint(x: 200, y: 400)
            }) { (true) in
                self.moveView.center = CGPoint(x: 50, y: 50)
        }
    }

}

