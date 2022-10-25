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
    var contacto : Contacto?
    var texto: String?
    var callbackUpdate : (()-> Void)?
    @IBOutlet weak var txtNombreField: UITextField!
    @IBOutlet weak var txtCelularField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Detalles del juego"
        
        if contacto != nil {
            self.title = contacto!.nombre
            txtNombreField.text = contacto!.nombre
            txtCelularField.text = contacto!.celular
        }
        else {
            self.title = "Lel"
        }
        
    }
    @IBAction func doTapUpdate(_ sender: Any) {
        if callbackUpdate != nil
        {
            contacto?.nombre = txtNombreField.text!
            contacto?.celular = txtCelularField.text!
            callbackUpdate!()
            self.navigationController?.popViewController(animated:  true)
        }
    }

}
