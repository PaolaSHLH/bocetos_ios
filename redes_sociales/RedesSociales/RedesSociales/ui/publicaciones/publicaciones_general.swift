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
                            PublicacionVista()
                        }label: {
                            HStack{
                                VStack(alignment: .leading){
                                    Spacer()
                                    Text("\(publicacion.id)")
                                        .font(.custom("Helvetica Neue", size: 20))
                                        .foregroundColor(.mint)
                                        .multilineTextAlignment(.leading)
                                    Spacer()
                                    Text("\(publicacion.title)")
                                        .font(.title)
                                        .foregroundColor(.mint)
                                        .multilineTextAlignment(.leading)
                                    Text("\(publicacion.body)")
                                        .foregroundColor(.white)
                                        .font(.custom("Helvetica Neue", size: 15))
                                        .multilineTextAlignment(.leading)
                                        
                                }
                                .padding()
                                .frame(maxWidth: .infinity, alignment: .leading)
                            }
                                .background(Color.gray)
                                .cornerRadius(10)
                                .padding()
                        }.simultaneousGesture(TapGesture().onEnded({
                            controlador.seleccionar_publicacion(publicacion)                            }))
                    }
                }
            }.background(Color.white)
        }
            .onAppear{
                /*if controlador.publicaciones.isEmpty {
                    Task{
                        await controlador.obtener_publicaciones()
                }*/
            }
        }
    }


#Preview {
    GenerarPublicaciones()
        .environment(ControladorAplicacion())
}
