//
//  pantallas_lista_planetas.swift
//  RedesSociales
//
//  Created by alumno on 2/5/25.
//

import SwiftUI

struct pantallasListaPlanetas: View {
    @Environment(ControladorAplicacion.self) var controlador
    
    var body: some View {
        ScrollView{
            LazyVStack(spacing: 20){
                Text("Dragon ball")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                if(controlador.lista_de_planetas != nil){
                    ForEach(controlador.lista_de_planetas!.items){ planeta in
                        NavigationLink{
                            pantallaDescripcion()
                        } label:{
                            VStack{
                
                                HStack{
                                    
                                    
                                    AsyncImage(url: URL(string: planeta.image)){imagen in
                                        imagen.image?
                                            .resizable()
                                            .scaledToFit()
                                            
                                    }.frame(width: 150, height: 200)
                                    
                                    VStack{
                                        Text("\(planeta.name)")
                                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                        
                                        
                                    }
                                    
                                }
                                .font(.subheadline)
                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.blue)
                            .cornerRadius(12)
                            .foregroundColor(.white)
                        }/* Aqui termina el Nav link*/
                        .padding()
                    }/* Aqui termina el ForEach*/
                }/* Aqui termina el if*/
            }/* Aqui termina el lazyVstack*/
        }/* Aqui termina el scrollView*/
        .background(Color.orange)
        }
    }


#Preview {
    pantallasListaPlanetas()
        .environment(ControladorAplicacion())
}
