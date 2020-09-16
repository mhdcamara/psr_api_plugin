//
//  ViewController.swift
//  psr_api_plugin
//
//  Created by mhdcamara on 08/24/2020.
//  Copyright (c) 2020 mhdcamara. All rights reserved.
//

import UIKit
import psr_api_plugin
import EzPopup
import Alamofire
import SwiftyJSON


class ViewController: UIViewController
{

    @IBOutlet weak var testImageView: UIImageView!
    
    //MARK: Actions
    
    let VC = PaymentViewController()
    
    @IBAction func showFullCustomPopupButtonTapped(_ sender: Any)
    {
//        guard let pickerVC = VC else { return }
                
//        pickerVC.delegate = self
        let pickerVC = VC.instantiate()
        
        let popupVC = PopupViewController(contentController: pickerVC!, position: .top(50), popupWidth: self.view.frame.width - 20, popupHeight: self.view.frame.height - 70)
        popupVC.backgroundAlpha = 0.3
        popupVC.backgroundColor = .black
        popupVC.canTapOutsideToDismiss = true
        popupVC.cornerRadius = 10
        popupVC.shadowEnabled = true
        present(popupVC, animated: true, completion: nil)
//        CheckoutInvoice()
    }
    
    let cst = AppConstant(
        master_key: "9iQ6hGxZ-Ln51-3TH5-rJ8w-Ywj7ofR1umMW",
        private_key: "live_private_p2Sfz3iXvVkvQXqr8tNLBL5s5Pr",
        token: "qkiNmADLj8fiFarnVqVd",
        invoice_token: "",
        cancel_url: "",
        return_url: "",
        callback_url: "",
        payment_url: ""
    )
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        //Setp 3: - Call the circleImageView & downloadedFrom fuctions
        
        
        
        testImageView.circleImageView(borderColor: UIColor.white , borderWidth: 2.0)
        testImageView.downloadedFrom(link: "https://cdn.pixabay.com/photo/2015/12/01/20/28/road-1072823_1280.jpg")
    }
    
    
    //MARK: Private Functions
    
    func CheckoutInvoice()
    {
        /*
          *   Préparation de la requete
          */


         // Initialisation des paramétres de la requete
        let Store = PayDunyaStore(

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
         let Setup = PayDunyaSetup(
            MasterKey: cst.master_key,
            PrivateKey: cst.private_key,
            Token: cst.token,
            cancel_url: cst.cancel_url,
            return_url:  cst.return_url,
            callback_url: cst.callback_url
         )

        let invoice = PayDunyaInvoice(
            store: Store,
            setup: Setup
        )

         let Headers: HTTPHeaders = Setup.setup()

         let Parametres: Parameters = invoice.Invoice()

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

                     self.cst.payment_url = urlpaiement

                     //On redirige l'utilisateur vers la page de paiement

                     let token = json["token"].stringValue

                     print("Le token: \(token)")
                     print("L'url: \(urlpaiement)")
                     
                     self.cst.invoice_token = token

                 case let .failure(error): print(error)
             }

         }
    }

}

