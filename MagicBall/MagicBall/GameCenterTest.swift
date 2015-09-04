//
//  GameCenterTest.swift
//  MagicBall
//
//  Created by Rodrigo Machado on 9/4/15.
//  Copyright © 2015 BEPiD. All rights reserved.
//

import Foundation
import UIKit
import GameKit

//class GameCenterTest
//{
//    func authenticateLocalPlayer() {
//        let localPlayer: GKLocalPlayer = GKLocalPlayer.localPlayer()
//        
//        localPlayer.authenticateHandler = {(ViewController, error) -> Void in
//            if((ViewController) != nil) {
//                // 1 Show login if player is not logged in
//                self.presentViewController(ViewController, animated: true, completion: nil)
//            } else if (localPlayer.authenticated) {
//                // 2 Player is already euthenticated & logged in, load game center
//                self.gcEnabled = true
//                
//                // Get the default leaderboard ID
//                localPlayer.loadDefaultLeaderboardIdentifierWithCompletionHandler({ (leaderboardIdentifer: String!, error: NSError!) -> Void in
//                    if error != nil {
//                        println(error)
//                    } else {
//                        self.gcDefaultLeaderBoard = leaderboardIdentifer
//                    }
//                })
//                
//                
//            } else {
//                // 3 Game center is not enabled on the users device
//                self.gcEnabled = false
//                print("Local player could not be authenticated, disabling game center")
//                print(error)
//            }
//            
//        }
//        
//    }
//}
