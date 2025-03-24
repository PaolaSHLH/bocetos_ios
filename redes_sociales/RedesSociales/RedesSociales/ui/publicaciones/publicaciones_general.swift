//
//  publicaciones_general.swift
//  RedesSociales
//
//  Created by alumno on 24/3/25.
//

import SwiftUI

struct GenerarPublicaciones : View {
    @StateObject var controlador = ControladorPublicaciones()
    
    var body: some View{
        ScrollView{
            VStack{
                ForEach(controlador.publicaciones){ publicacion in
                    Text("\(publicacion.id)")
                    VStack{
                        Text("\(publicacion.title)")
                        Text("\(publicacion.body)")
                    }
                }
            }
        }
            .onAppear{
                if controlador.publicaciones.isEmpty {
                    Task{
                        await controlador.obtener_publicaciones()
                }
            }
        }
    }
}


#Preview {
    GenerarPublicaciones()
}
