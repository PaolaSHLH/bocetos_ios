//
//  publicacion.swift
//  RedesSociales
//
//  Created by alumno on 26/3/25.
//

import SwiftUI

let publicacion_falsa = Publicacion(userId: 1, id: 1, title: "Lorem Ipsum", body: "Et dolor sit amet ")

struct PublicacionVista: View {
    let publicacion_a_mostrar: Publicacion
    @Environment(ControladorAplicacion.self) var controlador
    
    var body: some View {
        Text("\(publicacion_a_mostrar.title)")
        Text("\(publicacion_a_mostrar.body)")

        ScrollView{
            VStack{
                
            }
        }
        
    }
}

#Preview {
    PublicacionVista(publicacion_a_mostrar: publicacion_falsa)
        .environment(ControladorAplicacion())
}
