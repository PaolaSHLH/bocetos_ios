//
//  publicacion.swift
//  RedesSociales
//
//  Created by alumno on 26/3/25.
//

import SwiftUI

let publicacion_falsa = Publicacion(userId: 1, id: 1, title: "Lorem Ipsum", body: "Et dolor sit amet ")

struct PublicacionVista: View {
    //let publicacion_a_mostrar: Publicacion
    @Environment(ControladorAplicacion.self) var controlador
    
    //var publicacion_a_mostrar = controlador.publicacion_seleccionada
    
    var body: some View {
        Text("\(controlador.publicacion_seleccionada?.title)")
        Text("\(controlador.publicacion_seleccionada?.body)")

        NavigationLink{
            Text("Hola Mundo")
        }label:{
            Text("Ver perfil")
        }
        
        ScrollView{
            VStack{
                ForEach(controlador.comentarios){ comentario in
                    Text("Usuario: \(comentario.name)")
                    Text("\(comentario.body)")

                }
            }
        }
        
    }
}

#Preview {
    PublicacionVista()
        .environment(ControladorAplicacion())
}
