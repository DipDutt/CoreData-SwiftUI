//
//  ContentView.swift
//  coredataMVVM
//
//  Created by Dip Dutt on 23/3/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = coreDataViewModel()
    @State var textFieldText:String = ""
    var body: some View {
        NavigationStack {
            VStack{
               TextField("Enter a fruit Name", text: $textFieldText)
                    .padding()
                    .textFieldStyle(.roundedBorder)
                Button("SAVE") {
                    guard !textFieldText.isEmpty else {return}
                    viewModel.addFruitName(text: textFieldText)
                    textFieldText = ""
                }
                List {
                    ForEach(viewModel.fruitNames, id: \.self) { fruit in
                        Text(fruit.name ?? "")
                            .onTapGesture {
                                viewModel.update(enitity:fruit )
                            }
                        }
                    .onDelete(perform: viewModel.deleteitem)
                }
                .listStyle(GroupedListStyle())
            }
            .navigationTitle("FruitNames")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
