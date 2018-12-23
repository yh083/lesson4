//
//  RecommendViewController.swift
//  lesson4
//
//  Created by student on 2018/12/23.
//  Copyright © 2018年 yh. All rights reserved.
//

import UIKit

class RecommendViewController: UIViewController {

    @IBOutlet var buttons: [UIButton]!
    var buttonindex = 0
    var mytimer: Timer?
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if let timer = mytimer{
            timer.fireDate = Date(timeIntervalSinceNow: 1.0)
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        if let timer = mytimer {
            timer.fireDate = Date .distantFuture
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        startTimer()
    }
    
    func startTimer() -> () {
             mytimer = Timer .scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(startAnimation), userInfo: nil, repeats: true)
    }
    @objc func startAnimation() -> () {
        //得到button
        let index = buttonindex % buttons.count
        let button = buttons[index]
        //对该button进行动画处理
        UIView .transition(with: button, duration: 0.5, options: UIView.AnimationOptions.transitionFlipFromRight, animations: {
            
        }){(flag) in
            self.buttonindex += 1
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
