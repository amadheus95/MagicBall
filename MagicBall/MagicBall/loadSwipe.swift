//
//  loadSwipe.swift
//  MagicBall
//
//  Created by leonardo fernandes farias on 29/09/15.
//  Copyright © 2015 BEPiD. All rights reserved.
//

import Foundation
import UIKit


class loadSwipe {
    
    func loadSwipe( view: UIView, ob: AnyObject? ) {
        let swipeRight = UISwipeGestureRecognizer(target: ob, action: "respondToSwipeGesture:")
        swipeRight.direction = UISwipeGestureRecognizerDirection.Right
        view.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: ob, action: "respondToSwipeGesture:")
        swipeLeft.direction = UISwipeGestureRecognizerDirection.Left
        view.addGestureRecognizer(swipeLeft)
        
        let swipeUp = UISwipeGestureRecognizer(target: ob, action: "respondToSwipeGesture:")
        swipeUp.direction = UISwipeGestureRecognizerDirection.Up
        view.addGestureRecognizer(swipeUp)
        
        let swipeDown = UISwipeGestureRecognizer(target: ob, action: "respondToSwipeGesture:")
        swipeDown.direction = UISwipeGestureRecognizerDirection.Down
        view.addGestureRecognizer(swipeDown)
        
        let swipeHorario=UIRotationGestureRecognizer(target: ob, action: "respondToSwipeGesture:")
        view.addGestureRecognizer(swipeHorario)
    }
}