//
//  ModifcarController.swift
//  iOS_Contactos
//
//  Created by Alumno on 10/20/22.
//  Copyright © 2022 Alumno. All rights reserved.
//

import UIKit

class EditController: UIViewController
{
    var texto: String?
    var callbackUpdate : ((String)-> Void)?
    @IBOutlet weak var txtNombreField: UITextField!
    @IBOutlet weak var txtCelularField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if texto != nil{
            
        }
    }
    
    
}
