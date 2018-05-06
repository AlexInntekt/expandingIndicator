//
//  ViewController.swift
//  animatedButton
//
//  Created by Manolescu Mihai Alexandru on 04/05/2018.
//  Copyright © 2018 AVP. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController
{

    @IBOutlet var roundIndicator: UIView!

    @IBOutlet var insideCounter: UILabel!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       
        animateDispacement()
        
       
    }
    
    
    
    func animateDispacement()
    {
        view.addSubview(roundIndicator)
        self.roundIndicator.center.x = self.view.center.x
        self.roundIndicator.center.y = -100
        
        
        UIView.animate(withDuration: 2, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 0.4,  options: [.curveEaseOut], animations:
            {
                self.roundIndicator.center.y = self.view.center.y
                 
        })
        { finished in
            print("\n finished")
            
            self.runTimer()
            
            
            
                UIView.animate(withDuration: 3, delay: 3, usingSpringWithDamping: 0, initialSpringVelocity: 0,  options: [.curveEaseIn], animations:
                    {
                        self.insideCounter.alpha = 0
                        //self.insideCounter.font = UIFont (name: "Helvetica Neue", size: 0)
                        
                        self.roundIndicator.alpha = 0.4
                        
                        var enlarge = CGAffineTransform.identity
                        enlarge = enlarge.scaledBy(x: 12, y: 12)
                        
                        self.roundIndicator.transform = enlarge;
                        
                        
                })
                { finished in
                    self.insideCounter.font = UIFont (name: "Helvetica Neue", size: 30)

                    self.roundIndicator.center.y = -100
                    self.insideCounter.text = "3"
                    self.roundIndicator.alpha = 1

                    var enlarge = CGAffineTransform.identity
                    enlarge = enlarge.scaledBy(x: 1, y: 1)
                    self.roundIndicator.transform = enlarge;

                    self.resetButtonTapped()

                    self.animateDispacement()
                }
        }
        
    }

    func runTimer()
    {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self,   selector: (#selector(ViewController.updateTimer)), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer()
    {
        seconds -= 1     //This will decrement(count down)the seconds.
        
        insideCounter.text = "\(seconds)" //This will update the label.
        
        if seconds==0
        {
            insideCounter.text = ""
        }
    }
    
    func resetButtonTapped()
    {
        timer.invalidate()
        seconds = 3    //Here we manually enter the restarting point for the seconds, but it would be wiser to make this a variable or constant.
        insideCounter.text = "\(seconds)"
        insideCounter.alpha = 1
    }

}

