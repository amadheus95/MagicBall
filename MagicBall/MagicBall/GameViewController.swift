//
//  GameViewController.swift
//  MagicBall
//
//  Created by Carlos Amadheus Souza Araujo on 17/08/15.
//  Copyright (c) 2015 BEPiD. All rights reserved.
//

import UIKit
import SpriteKit
import GameKit

@IBDesignable

class GameViewController: UIViewController {
    var index = Int()
    var scene = GameScene()
    var score: Int = 0 // Stores the score
    var gcEnabled = Bool() // Stores if the user has Game Center enabled
    var gcDefaultLeaderBoard = String() // Stores the default leaderboardID
    
    @IBAction func ClicounaBola(sender: AnyObject) {
        scene.removeAllChildren()
    }
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        scene = GameScene(fileNamed:"GameScene")!
        
        let skView = self.view as! SKView
        skView.showsFPS = true
        skView.showsNodeCount = true
        
        skView.ignoresSiblingOrder = true
        
        scene.scaleMode = .AspectFill
        scene.index = index
        skView.presentScene(scene)
        authenticateLocalPlayer()
        
        notification()
    }
    
    override func shouldAutorotate() -> Bool {
        return true
    }
    
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask
    {
        if UIDevice.currentDevice().userInterfaceIdiom == .Phone {
            return .AllButUpsideDown
        }
        else
        {
            return .All
        }
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        
    }
    
    override func prefersStatusBarHidden() -> Bool
    {
        return true
    }
    
    // fazendo a ação enquanto o celular se mexe
    override func motionBegan(motion: UIEventSubtype, withEvent event: UIEvent?)
    {
        if motion == .MotionShake
        {
            //scene.retiraTexto()
            print("little slow juice")
        }
    }
    
    // fazendo a ação quando o celular para
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent?)
    {
        if motion == .MotionShake {
            scene.mostrarTexto()
            score++
            print("Of milk!")
            print(score)
            //randomAnswer()
        }
    }
    
    override func canBecomeFirstResponder() -> Bool {
        return true
    }
    
    // autenticação com o Game Center
    func authenticateLocalPlayer()
    {
        let localPlayer: GKLocalPlayer = GKLocalPlayer.localPlayer()
        
        localPlayer.authenticateHandler = {(ViewController, error) -> Void in
            if((ViewController) != nil)
            {
                // 1 Show login if player is not logged in
                self.presentViewController(ViewController!, animated: true, completion: nil)
            } else if (localPlayer.authenticated) {
                // 2 Player is already euthenticated & logged in, load game center
                self.gcEnabled = true
                
                
            }
            else
            {
                // 3 Game center is not enabled on the users device
                self.gcEnabled = false
                print("Local player could not be authenticated, disabling game center")
                print(error)
            }
            
        }
    }
    
    override func viewDidDisappear(animated: Bool) {
        removeFromParentViewController()
    }
    
    func notification() -> Void
    {
        let dateComp: NSDateComponents = NSDateComponents()
        dateComp.year = 2015
        dateComp.month = 09
        dateComp.day = 28
        dateComp.hour = 20
        dateComp.minute = 20
        
        dateComp.timeZone = NSTimeZone.systemTimeZone()
        
        let calender: NSCalendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)!
        
        let date:NSDate = calender.dateFromComponents(dateComp)!
        
        
        let notification: UILocalNotification = UILocalNotification()
        notification.category = "FIRST_CATEGORY"
        notification.alertBody = "Play this game, now!!!!"
        notification.fireDate = date
        
        UIApplication.sharedApplication().scheduleLocalNotification(notification)

    }
}