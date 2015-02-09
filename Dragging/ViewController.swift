//
//  ViewController.swift
//  Dragging
//
//  Created by Óscar Calles Sáez on 7/2/15.
//  Copyright (c) 2015 Legua Soft Games. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // for track the gesture distance
    var xFromCenter: CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var label:UILabel = UILabel(frame: CGRectMake(self.view.bounds.width / 2 - 100, self.view.bounds.height / 2 - 50, 200, 100))
        label.text = "Drag Me!"
        label.textAlignment = NSTextAlignment.Center // align center the text
        self.view.addSubview(label)
        
        // recognizer for the dragging move
        var gesture = UIPanGestureRecognizer(target: self, action: Selector("wasDragged:"))
        // get a lot of event all the drag gesture's path
        label.addGestureRecognizer(gesture)
        label.userInteractionEnabled = true
        
    }

    func wasDragged(gesture: UIPanGestureRecognizer) {
        // translation vector origin -> destination
        
        let translation = gesture.translationInView(self.view) // get the translation
        var label = gesture.view! // the view inside the gesture
        
        xFromCenter += translation.x
        
        var scaledValue = min(100 / abs(xFromCenter), 1)
        
        // move the label with the translation
        label.center = CGPoint(x: label.center.x + translation.x, y: label.center.y + translation.y)
        
        // reset the translation that now, is already applied to the label
        gesture.setTranslation(CGPointZero, inView: self.view)
        
        
        // the rotation variable clockwise and pass the angle in radians 1 = 60º
        var rotation:CGAffineTransform = CGAffineTransformMakeRotation(xFromCenter / 200)
        
        // the scale variable to enlarge objects
        var stretch:CGAffineTransform = CGAffineTransformScale(rotation, scaledValue, scaledValue)
        
        label.transform = stretch
        
        
        if label.center.x < 100 {
            
            println("Not chosen !!")
        
        } else if label.center.x > self.view.bounds.width - 100 {
            
            println("Chosen !!")
        }
        
        if gesture.state == UIGestureRecognizerState.Ended {
        
            // restore the inital value before drag the item
            label.center = CGPointMake(self.view.bounds.width / 2, self.view.bounds.height / 2)
            scaledValue = min(abs(xFromCenter)/100, 1)
            rotation = CGAffineTransformMakeRotation(0)
            stretch = CGAffineTransformScale(rotation, scaledValue, scaledValue)
    
            label.transform = stretch
        }
       
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

