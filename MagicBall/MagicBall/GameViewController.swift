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
    var scene = GameScene()
    var score: Int = 0 // Stores the score
    var gcEnabled = Bool() // Stores if the user has Game Center enabled
    var gcDefaultLeaderBoard = String() // Stores the default leaderboardID
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        scene = GameScene(fileNamed:"GameScene")!
        // Configure the view.
        let skView = self.view as! SKView
        skView.showsFPS = true
        skView.showsNodeCount = true
        
        /* Sprite Kit applies additional optimizations to improve rendering performance */
        skView.ignoresSiblingOrder = true
        
        /* Set the scale mode to scale to fit the window */
        scene.scaleMode = .AspectFill
        
        skView.presentScene(scene)
        authenticateLocalPlayer()
    }
    
    override func shouldAutorotate() -> Bool {
        return true
    }
    
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        if UIDevice.currentDevice().userInterfaceIdiom == .Phone {
            return .AllButUpsideDown
        } else {
            return .All
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    // fazendo a ação enquanto o celular se mexe
    override func motionBegan(motion: UIEventSubtype, withEvent event: UIEvent?) {
        if motion == .MotionShake {
            //scene.retiraTexto()
            print("little slow juice")
        }
    }
    
    // fazendo a ação quando o celular para
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent?) {
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
    
    func authenticateLocalPlayer() {
        let localPlayer: GKLocalPlayer = GKLocalPlayer.localPlayer()
        
        localPlayer.authenticateHandler = {(ViewController, error) -> Void in
            if((ViewController) != nil) {
                // 1 Show login if player is not logged in
                self.presentViewController(ViewController!, animated: true, completion: nil)
            } else if (localPlayer.authenticated) {
                // 2 Player is already euthenticated & logged in, load game center
                self.gcEnabled = true
                
                // Get the default leaderboard ID
//                localPlayer.loadDefaultLeaderboardIdentifierWithCompletionHandler({ (leaderboardIdentifer: String!, error: NSError!) -> Void in
//                    if error != nil {
//                        println(error)
//                    } else {
//                        self.gcDefaultLeaderBoard = leaderboardIdentifer
//                    }
//                })
                
                
            } else {
                // 3 Game center is not enabled on the users device
                self.gcEnabled = false
                print("Local player could not be authenticated, disabling game center")
                print(error)
            }
            
        }
        
    }
}