//
//  SwiftUIView.swift
//  RandomActivityApp
//
//  Created by Gustavo da Silva Braghin on 09/09/21.
//

import SwiftUI

struct SwiftUIView: View {
    
    let saveButtonReference: SaveButtonWrapper!
    
    @State var values: [Bool] = UserData.getFilters().getValuesAsBool()
    var filters: [Int: (emoji: String, name: String)] = [
        0: ("📚", "Education"),
        1: ("🎳", "Recreational"),
        2: ("🧘‍♀️", "Relaxation"),
        3: ("🤲", "Charity"),
        4: ("🍳", "Cooking"),
        5: ("🎵", "Music"),
        6: ("👨‍💻", "Busywork"),
        7: ("🛠", "DIY"),
        8: ("👥", "Social"),
    ]
    
    init(saveButton: SaveButtonWrapper!) {
        saveButtonReference = saveButton
    }
    
    var body: some View{
        let elementPadding: CGFloat = 6
        
        List{
            ForEach(values.indices) { i in
                
                Toggle(isOn: $values[i], label: {
                    let filter = filters[i]!
                    Text(filter.emoji)
                        .font(.title)
                    Text(filter.name)
                    
                })
                .padding(.vertical, elementPadding)
                .onChange(of: values[i], perform: { value in
                    
                    saveButtonReference.enable()
                    UserData.changeFilter(on: i, to: value)
                    
                })
            }
        }
        .colorScheme(.dark)
        .padding(.horizontal, -5)
    }
    
}

struct SwiftUIView_Preview: PreviewProvider {
    static var previews: some View{
        SwiftUIView(saveButton: nil)
    }
}

