//
//  AlertExtension.swift
//  psr_api_plugin
//
//  Created by Mouhamed Camara on 8/26/20.
//

import Foundation
import UIKit


extension PaymentViewController
{
    //MARK: Présentation de l'alerte
    
    private func successAlert()
    {
        let title = "Notification"
        let message = "Votre opération s'est éffectuée avec succés!"
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { (action) in
            
            alert.dismiss(animated: true, completion: nil)
            

        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    private func cancelAlert()
    {
        let title = "Alerte"
        let message = "Voulez-vous réellement annuler cette opération?"
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "Oui", style: UIAlertAction.Style.default, handler: { (action) in
            
            alert.dismiss(animated: true, completion: nil)
        }))
        
        alert.addAction(UIAlertAction(title: "Non", style: UIAlertAction.Style.default, handler: { (action) in
            
            alert.dismiss(animated: true, completion: nil)
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    private func errorAlert()
    {
        let title = "Alerte"
        let message = "Une erreur est survenu veuillez réessayer!"
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "Réessayez", style: UIAlertAction.Style.default, handler: { (action) in
            
            alert.dismiss(animated: true, completion: nil)
            
        }))
        
        alert.addAction(UIAlertAction(title: "Quittez", style: UIAlertAction.Style.default, handler: { (action) in
            
            alert.dismiss(animated: true, completion: nil)
            

        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
}
