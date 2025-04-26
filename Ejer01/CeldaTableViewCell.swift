//
//  CeldaTableViewCell.swift
//  Ejer01
//
//  Created by César Santos Torres on 25/04/25.
//

import UIKit

class CeldaTableViewCell: UITableViewCell {
    
    @IBOutlet weak var LblLogin: UILabel!
    @IBOutlet weak var LblNombres: UILabel!
    @IBOutlet weak var LblCorreo: UILabel!
    
    var objStoryboard: UIStoryboard!
    var objUsuarioBE: Usuario_BE!
    var Controller: UIViewController!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func CargarRegistro(objUsuario: Usuario_BE, pStoryboard: UIStoryboard, pControllerPadre: UIViewController) {
        self.objUsuarioBE = objUsuario
        self.objStoryboard = pStoryboard
        self.Controller = pControllerPadre
        
        self.LblLogin.text = objUsuario.LoginUsuario
        self.LblNombres.text = objUsuario.Nombres
        self.LblCorreo.text = objUsuario.Correo
    }
    
    
}
