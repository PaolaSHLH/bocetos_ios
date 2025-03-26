//
//  publicaciones_general.swift
//  RedesSociales
//
//  Created by alumno on 24/3/25.
//

import SwiftUI

struct GenerarPublicaciones : View {
   // @StateObject var controlador = ControladorPublicaciones()
    @Environment(ControladorAplicacion.self) var controlador
    
    var body: some View{
        NavigationStack{
            ScrollView{
                VStack{
                    ForEach(controlador.publicaciones){ publicacion in
                        NavigationLink{
                        Text("Hola Mundo")
                        }label: {
                            HStack{
                                Text("\(publicacion.id)")
                                VStack{
                                    Text("\(publicacion.title)")
                                    Text("\(publicacion.body)")
                                }
                            }.onTapGesture {
                                print("usted ha seleccionado: \(publicacion.id)")
                            }
                        }
                        
                        
                    }
                }
            }
        }
            .onAppear{
                /*if controlador.publicaciones.isEmpty {
                    Task{
                        await controlador.obtener_publicaciones()
                }*/
                print("no se")
            }
        }
    }


#Preview {
    GenerarPublicaciones()
        .environment(ControladorAplicacion())
}
