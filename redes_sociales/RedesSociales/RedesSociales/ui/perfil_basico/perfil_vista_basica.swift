//
//  perfil_vista_basica.swift
//  RedesSociales
//
//  Created by alumno on 28/3/25.
//

import SwiftUI

struct PerfilBasicovista : View {
    @Environment(ControladorAplicacion.self) var controlador
    
    
    var body: some View {
        Text("User: \(controlador.perfil_a_mostrar?.username ?? "Puede que no ")")
        Text("Nombre: \(controlador.perfil_a_mostrar?.name ?? "sea bonito ver estas ")")
        Text("Correo: \(controlador.perfil_a_mostrar?.email ?? "Palabras de error ")")
            .onDisappear(){
                print("Esto se muestra cuando destruimos la vista")
            }
        
    }
}


#Preview {
    PerfilBasicovista()
        .environment(ControladorAplicacion())
}
