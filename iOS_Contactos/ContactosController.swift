//
//  ViewController.swift
//  iOS_Contactos
//
//  Created by Alumno on 10/20/22.
//  Copyright © 2022 Alumno. All rights reserved.
//

import UIKit

class ContactosController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tvContactos: UITableView!
    var Contactos : [Contacto] = []

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    //Nùmero de secciones que tiene mi table view
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //Numero de filas por seccion
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Contactos.count
    }
    
    //Construye cada celda
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tableView.dequeueReusableCell(withIdentifier: "celdaContactos") as? CeldaContactosController
        celda?.lblNombre.text = Contactos[indexPath.row].nombre
        celda?.lblCelular.text = Contactos[indexPath.row].celular
        return celda!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        Contactos.append(Contacto(nombre: "Max Rivera",celular: "6442003929" ))
        Contactos.append(Contacto(nombre: "Sergio Rivera",celular: "1231231213" ))

        
        tvContactos.reloadData()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "goToEdit" {
            let destino = segue.destination as! EditController
            destino.contacto = Contactos[tvContactos.indexPathForSelectedRow!.row]
            destino.callbackUpdate = actualizarTexto
        } else if segue.identifier == "goToAdd" {
            let destino = segue.destination as! AddController
            destino.contacto = nil
            destino.callbackAdd = updateContactos
        } 

    }
    func updateContactos(contacto: Contacto){
        Contactos.append(contacto)
        tvContactos.reloadData()
    }
    func actualizarTexto(){
        tvContactos.reloadData()
    }
}

