//
//  AddController.swift
//  iOS_Contactos
//
//  Created by Alumno on 10/25/22.
//  Copyright © 2022 Alumno. All rights reserved.
//

import UIKit

class AddController: UIViewController
{
    @IBOutlet weak var txtNombre: UITextField!
    @IBOutlet weak var txtCelular: UITextField!
    
    var contacto : Contacto?
    var texto: String?
    var callbackAdd : ((Contacto)-> Void)?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if contacto != nil {
            self.title = contacto!.nombre
            txtNombre.text = contacto!.nombre
            txtCelular.text = contacto!.celular
        }
        else {
            self.title = "Agregar Contacto"
        }
        
        
    }
    @IBAction func doTapUpdate(_ sender: Any) {
        if callbackAdd != nil
        {
            contacto = Contacto(nombre: txtNombre.text ?? "nombre", celular: txtCelular.text ?? "celular")
            contacto?.nombre = txtNombre.text!
            contacto?.celular = txtCelular.text!
            callbackAdd!(contacto!)
            self.navigationController?.popViewController(animated:  true)
        }
    }
    
}
