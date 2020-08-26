//
//  ViewController.swift
//  psr_api_plugin
//
//  Created by mhdcamara on 08/24/2020.
//  Copyright (c) 2020 mhdcamara. All rights reserved.
//

import UIKit
import psr_api_plugin
import Alamofire
import SwiftyJSON


class ViewController: UIViewController
{

    @IBOutlet weak var testImageView: UIImageView!
    
    //MARK: Actions
    
    @IBAction func showFullCustomPopupButtonTapped(_ sender: Any)
    {
        CheckoutInvoice()
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        //Setp 3: - Call the circleImageView & downloadedFrom fuctions
        
        testImageView.circleImageView(borderColor: UIColor.white , borderWidth: 2.0)
        testImageView.downloadedFrom(link: "https://cdn.pixabay.com/photo/2015/12/01/20/28/road-1072823_1280.jpg")
    }
    
    
    //MARK: Private Functions
    
    private func CheckoutInvoice()
    {
        /*
          *   Préparation de la requete
          */


         // Initialisation des paramétres de la requete
        let Store = PaydunyaStore(
             name: "paydunyaIOS-Plugin",
             tagline: "L'élégance c'est nous!",
             postal_address: "11500",
             phone: 778064927,
             logo_url: "",
             website_url: ""
         )

         Store.total_amount = 200
         Store.description = "Chaussures Croco"

         Store.items = [
                 "name": "Chaussures Croco",
                 "quantity": 3,
                 "unit_price": "10000",
                 "total_price": "30000",
                 "description": "Chaussures faites en peau de crocrodile authentique qui chasse la pauvreté"
         ]

         Store.taxes = [
                 "name": "TVA (18%)",
                 "amount": 12
         ]

         //Initialisation des Clé d'API
         let Setup = PaydunyaSetup(
            MasterKey: AppConstant.master_key,
            PrivateKey: AppConstant.private_key,
            Token: AppConstant.token,
            cancel_url: AppConstant.cancel_url,
            return_url:  AppConstant.return_url,
            callback_url: AppConstant.callback_url
         )

         let invoice = PaydunyaInvoice()

         let Headers: HTTPHeaders = Setup.setup()

         let Parametres: Parameters = invoice.Invoice(store: Store, setup: Setup)

         // La requete avec Alamofire

         Alamofire.request("https://app.paydunya.com/api/v1/checkout-invoice/create", method: .post ,parameters: Parametres, encoding: JSONEncoding.default, headers: Headers).responseJSON
         {
             response in
             print("ResultJSON: \(response.result)")    // On affiche la réponse en JSON


             // On regarde la réponse renvoyée par la requete
             switch response.result
             {
                 case let .success(value): // En cas de Succes de la requete

                     let json = JSON(value)

                     print("Voici la réponse: \(json)")

                     let urlpaiement = json["response_text"].stringValue

                     AppConstant.payment_url = urlpaiement

                     //On redirige l'utilisateur vers la page de paiement

                     let token = json["token"].stringValue

                     print("Le token: \(token)")
                     print("L'url: \(urlpaiement)")

                     AppConstant.invoice_token = token

                 case let .failure(error): print(error)
             }

         }
    }

}

