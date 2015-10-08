//
//  BallsCollectionViewController.swift
//  MagicBall
//
//  Created by leonardo fernandes farias on 29/09/15.
//  Copyright © 2015 BEPiD. All rights reserved.
//

import UIKit

var index = Int()

class BallsCollectionViewController: UICollectionViewController {
    
    var array = [String]()

    override func viewDidLoad()
    {
        super.viewDidLoad()
        array.append("8ball")
        array.append("tennis")
        array.append("basket")
        array.append("Pizzy")
        array.append("fogo1")
        array.append("laranjita")
        array.append("almondegados")
        array.append("boladecristal")
        array.append("bolinhodearroz")
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    // número de collections que serão retornadas
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return array.count
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell
    {

        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as UICollectionViewCell
        
        let button = cell.viewWithTag(1) as! UIImageView // criando uma tag para cada collection
        
        
            button.image = UIImage(named: array[indexPath.row]) // adicionando a imagem

        
        return cell
    }
    
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath)
    {
        //self.performSegueWithIdentifier("vai", sender: self)
        print("opa\(indexPath.row)")
        index = indexPath.row
        self.performSegueWithIdentifier("vai", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "vai" {
            let viewController:GameViewController = segue.destinationViewController as! GameViewController
            viewController.index = index
        }
    }
    
//    override func prepareForSegue(segue: UIStoryboardSegue?, sender: AnyObject?) {
//        
//        if segue!.identifier == "vai" {
//            
//            let viewController:ViewController = segue!.destinationViewController as! ViewController
//            print("testando o index\(index)")
//            viewController.index = index
//            
//            
//        }
//    }

}
