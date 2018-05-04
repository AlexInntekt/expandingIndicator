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
            
            
            self.insideCounter.text = ""
            
                UIView.animate(withDuration: 3, delay: 0, usingSpringWithDamping: 0, initialSpringVelocity: 0,  options: [.curveEaseOut], animations:
                    {
                        self.roundIndicator.alpha = 0.4
                        
                        var enlarge = CGAffineTransform.identity
                        enlarge = enlarge.scaledBy(x: 12, y: 12)
                        
                        self.roundIndicator.transform = enlarge;
                })
                { finished in
                    
                    self.roundIndicator.center.x = self.view.center.x
                    self.roundIndicator.center.y = -100
                    self.insideCounter.text = "3"
                    self.roundIndicator.alpha = 1
                    
                    var enlarge = CGAffineTransform.identity
                    enlarge = enlarge.scaledBy(x: 1, y: 1)
                    self.roundIndicator.transform = enlarge;
                    
                    
                    self.animateDispacement()
                }
        }
        
    }

 

}

