//
//  PayDunyaInvoice.swift
//  Pods
//
//  Created by Mouhamed Camara on 8/26/20.
//

import Foundation
import UIKit
import Alamofire




public class PayDunyaInvoice
{
    public var store: PayDunyaStore
    public var setup: PayDunyaSetup
    
    
    public init(store: PayDunyaStore, setup: PayDunyaSetup)
    {
        self.store = store
        self.setup = setup
    }
    
    public func Invoice()-> Parameters
    {
        var invoice: Parameters = [
            "invoice": [
               
            ],
            
            "store": [
            ],
            
            "custom_data": [
            ],

            "actions": [
                
            ]
        ]
        
        invoice["invoice"] = self.store.invoices()
        invoice["store"] = self.store.store()
        invoice["actions"] = self.setup.Action()
        
        return invoice
    }
}
