//
//  placeholder_api.swift
//  RedesSociales
//
//  Created by alumno on 24/3/25.
//

import SwiftUI


class PlaceHolderAPI: Codable {
    func descargar_publicaciones(desde: String) async throws -> [Publicacion]?{
        do{
            guard let url = URL(string: desde) else {throw ErroresDeRed.badUrl}
            let(datos, respuesta) = try await URLSession.shared.data(from: url)
            guard let respuesta = respuesta as? HTTPURLResponse else {throw  ErroresDeRed.badResponse}
            guard respuesta.statusCode >= 200 && respuesta.statusCode < 300 else {throw ErroresDeRed.badStatus}
            guard let respuesta_decodificada = try? JSONDecoder().decode([Publicacion].self, from: datos) else {throw ErroresDeRed.fallaAlConvertirLaRespuesta}
            
            return respuesta_decodificada
        }catch ErroresDeRed.badUrl{
            print("Tienes mala conexion, matate")
        }
        catch ErroresDeRed.badResponse{
            print("Algo salio mal con la respuesta, revisa porfi")
        }
        catch ErroresDeRed.badStatus{
            print("Como puedes tener un error en algo que no se mueve?")
        }
        catch ErroresDeRed.fallaAlConvertirLaRespuesta{
            print("Tienes mal el modelo o la implementacion de este")
        }
        catch ErroresDeRed.invalidRequest {
            print("como llegaste aqui? 0-0")
        }
        return nil
    }
}
