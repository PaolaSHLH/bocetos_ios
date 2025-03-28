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
        Text("\(controlador.publicacion_seleccionada?.title ?? "Valor por defecto")")
        Text("\(controlador.publicacion_seleccionada?.body ?? "Valor por defecto")")

        NavigationLink{
            PerfilBasicovista()
        }label:{
            Text("Ver perfil")
        }.simultaneousGesture(TapGesture().onEnded({
            controlador.ver_perfil(id: controlador.publicacion_seleccionada!.userId)
        }))
        
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
