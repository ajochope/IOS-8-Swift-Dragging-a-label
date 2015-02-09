//
//  ViewController.swift
//  Dragging
//
//  Created by Óscar Calles Sáez on 7/2/15.
//  Copyright (c) 2015 Legua Soft Games. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

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
        
        // move the label with the translation
        label.center = CGPoint(x: label.center.x + translation.x, y: label.center.y + translation.y)
        
        // reset the translation that now, is already applied to the label
        gesture.setTranslation(CGPointZero, inView: self.view)
        
        
        println("dragged detected!!")
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

