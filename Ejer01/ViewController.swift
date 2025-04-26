//
//  ViewController.swift
//  Ejer01
//
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // Un objeto de tipoUsuario_BE en donde pueda guardar los objetos creados
    var oListadoUsuarios: [Usuario_BE] = [Usuario_BE]()
    
    @IBOutlet weak var TxtLogin: UITextField!
    @IBOutlet weak var TxtNombres: UITextField!
    @IBOutlet weak var TxtCorreo: UITextField!
    @IBOutlet weak var TxtContrasenia: UITextField!
    
    @IBOutlet weak var TblListado: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.TblListado.dataSource = self
        self.TblListado.delegate = self
        self.TblListado.rowHeight = 150
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return oListadoUsuarios.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let oCelda = tableView.dequeueReusableCell(withIdentifier: "CeldaUsuario", for: indexPath) as! CeldaTableViewCell
        
        let oregUsuario = oListadoUsuarios[indexPath.row]
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        oCelda.CargarRegistro(objUsuario: oregUsuario, pStoryboard: storyboard, pControllerPadre: self)
        
        return oCelda
    }
    
    @IBAction func LimpiarCampos(_ sender: Any) {
        
        TxtLogin.text = ""
        TxtNombres.text = ""
        TxtCorreo.text = ""
        TxtContrasenia.text = ""
        
        TxtLogin.becomeFirstResponder()
        
    }
    
    @IBAction func AgrgarUsuario(_ sender: Any) {
        
        guard let login = TxtLogin.text, !login.isEmpty,
                  let nombres = TxtNombres.text, !nombres.isEmpty,
                  let correo = TxtCorreo.text, !correo.isEmpty else {
                // Mostrar alerta si hay campos vacíos
                let alerta = UIAlertController(title: "Campos incompletos", message: "Por favor, llena todos los campos obligatorios.", preferredStyle: .alert)
                alerta.addAction(UIAlertAction(title: "OK", style: .default))
                present(alerta, animated: true)
                return
            }
            
            let nuevoUsuario = Usuario_BE(uLogin: login, nombres: nombres, uCorreo: correo)
            
            oListadoUsuarios.append(nuevoUsuario)
        
            TblListado.reloadData()
            
            LimpiarCampos(sender)
    }
    
    

}

