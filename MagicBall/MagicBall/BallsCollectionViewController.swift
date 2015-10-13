//
//  BallsCollectionViewController.swift
//  MagicBall
//
//  Created by leonardo fernandes farias on 29/09/15.
//  Copyright © 2015 BEPiD. All rights reserved.
//

import UIKit
import StoreKit

var index = Int()

protocol BallsCollectionViewControllerDelegate {
    
    func didBuyColorsCollection(collectionIndex: Int)
    
}

class BallsCollectionViewController: UICollectionViewController, SKProductsRequestDelegate, SKPaymentTransactionObserver
{
    
    var array = [String]()
    var productIDs: Array<String!> = [] // ID de cada produto
    var productsArray: Array<SKProduct!> = [] // lista de produtos
    @IBOutlet weak var btBuyBall: UIButton!
    var selectedProductIndex: Int!
    var transactionInProgress = false
    var delegate: BallsCollectionViewControllerDelegate!

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        productIDs.append("8ball")
        productIDs.append("tennis")
        productIDs.append("basket")
        productIDs.append("Pizzy")
        productIDs.append("fogo1")
        productIDs.append("laranjita")
        productIDs.append("almondegados")
        productIDs.append("boladecristal")
        productIDs.append("bolinhodearroz")
        
        requestProductInfo()
        SKPaymentQueue.defaultQueue().addTransactionObserver(self)
        
        
        

    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    // número de collections que serão retornadas
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return productIDs.count
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell
    {

        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as UICollectionViewCell
        let button = cell.viewWithTag(1) as! UIImageView // criando uma tag para cada collection
        button.image = UIImage(named: productIDs[indexPath.row])
        
        return cell
    }
    
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath)
    {
        //self.performSegueWithIdentifier("vai", sender: self)
        selectedProductIndex = indexPath.row // chamando o produto selecionado
        showActions()
        collectionView.cellForItemAtIndexPath(indexPath)?.selected = false
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
    
    
    // função para fazer a requisição do produto
    func requestProductInfo() {
        if SKPaymentQueue.canMakePayments() {
            let productIdentifiers = NSSet(array: productIDs)
            let productRequest = SKProductsRequest(productIdentifiers: productIdentifiers as! Set<String>)
            
            productRequest.delegate = self
            productRequest.start()
        }
        else {
            print("Cannot perform In App Purchases.")
        }
    }
    
    
    func showActions() {
        if transactionInProgress {
            return
        }
        
        let actionSheetController = UIAlertController(title: "Shakeable", message: "What do you want to do?", preferredStyle: UIAlertControllerStyle.ActionSheet)
        
        let buyAction = UIAlertAction(title: "Buy", style: UIAlertActionStyle.Default) { (action) -> Void in
            let payment = SKPayment(product: self.productsArray[self.selectedProductIndex] as SKProduct)
            SKPaymentQueue.defaultQueue().addPayment(payment)
            self.transactionInProgress = true
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel) { (action) -> Void in
            
        }
        
        actionSheetController.addAction(buyAction)
        actionSheetController.addAction(cancelAction)
        
        presentViewController(actionSheetController, animated: true, completion: nil)
    }

    
    
    func productsRequest(request: SKProductsRequest, didReceiveResponse response: SKProductsResponse) {
        
        print("testando o response: \(response.products.count)")
        
        if response.products.count != 0
        {
            for product in response.products
            {
                productsArray.append(product as SKProduct)
            }
            
            collectionView!.reloadData()
        }
        else
        {
            print("There are no products.")
        }
        
        if response.invalidProductIdentifiers.count != 0
        {
            print(response.invalidProductIdentifiers.description)
        }
    }
    
    func paymentQueue(queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        for transaction in transactions {
            switch transaction.transactionState {
            case SKPaymentTransactionState.Purchased:
                print("Transaction completed successfully.")
                SKPaymentQueue.defaultQueue().finishTransaction(transaction)
                transactionInProgress = false
                delegate.didBuyColorsCollection(selectedProductIndex)
                
                
            case SKPaymentTransactionState.Failed:
                print("Transaction Failed");
                SKPaymentQueue.defaultQueue().finishTransaction(transaction)
                transactionInProgress = false
                
            default:
                print(transaction.transactionState.rawValue)
            }
        }
    }






}



