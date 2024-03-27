//
//  Conversor2.swift
//  Menu2
//
//  Created by Tamara Rodriguez Romo on 14/05/23.
//

import SwiftUI

struct Conversor2: View {
    @State private var showConversionSheet = false
    @State private var cantidad: String = ""
    @State private var resultado: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                Image("Regla")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 200, height: 200)
                    .clipShape(Circle())
                    .padding(.top, 10)
                
                Text("Deseo convertir:")
                    .font(.headline)
                    .padding()
                
                NavigationLink(destination: Conversor2View(resultado: $resultado, conversion2: .metrosToPulgadas)) {
                    Text("Metros a Pulgadas")
                        .frame(width: 200, height: 50)
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .padding()
                
                NavigationLink(destination: Conversor2View(resultado: $resultado, conversion2: .pulgadasToMetros)) {
                    Text("Pulgadas a Metros")
                        .frame(width: 200, height: 50)
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .padding()
                
                Spacer()
            }
           
            .onDisappear {
                resultado = "" // Restablecer el resultado al regresar al menú
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct Conversor2View: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var resultado: String
    @State private var cantidad: String = ""
    let conversion2: Conversion2Type
    
    var body: some View {
        VStack {
            TextField("Ingrese la cantidad", text: $cantidad)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button(action: {
                convertir(cantidad: cantidad)
            }) {
                Text("Convertir")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .padding()
            
            Text(resultado)
                .padding()
                .frame(maxWidth: 300, maxHeight: 200, alignment: .center) // Ajustar al tamaño del texto
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
                .padding()
        }
        .navigationBarHidden(true) // Ocultar el botón de regreso en la vista de destino
        .navigationBarTitle(conversion2.rawValue)
    }
    
    func convertir(cantidad: String) {
        if let valor = Double(cantidad) {
            switch conversion2 {
            case .metrosToPulgadas:
                let pulgadas = valor * 39.37
                resultado = "\(valor) metros son \(pulgadas) pulgadas"
            case .pulgadasToMetros:
                let metros = valor / 39.37
                resultado = "\(valor) pulgadas son \(metros) metros"
            }
        } else {
            resultado = "Ingrese una cantidad válida"
        }
    }
}

enum Conversion2Type: String {
    case metrosToPulgadas = "Metros a Pulgadas"
    case pulgadasToMetros = "Pulgadas a Metros"
}

struct Conversor2_Previews: PreviewProvider {
    static var previews: some View {
        Conversor2()
    }
}

