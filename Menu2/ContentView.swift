//
//  ContentView.swift
//  Menu2
//
//  Created by Tamara Rodriguez Romo on 14/05/23.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedMenuItem: String?
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Selecciona una opción del menú:")) {
                    NavigationLink(destination: Conversor1()) {
                        Label("Conversor Celsius a Farenheit", systemImage: "thermometer")
                            .font(.headline)
                            .foregroundColor(.orange)
                    }
                    NavigationLink(destination: Conversor2()){
                        Label("Conversor Metros a Pulgadas", systemImage: "ruler")
                            .font(.headline)
                            .foregroundColor(.blue)
                    }
                    NavigationLink(destination: AcercaDe()){
                        Label("Acerca de", systemImage: "info.circle")
                            .font(.headline)
                            .foregroundColor(.green)
                    }
                }
                .padding()
            }
            .listStyle(GroupedListStyle())
            .navigationTitle("Menú")
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


