//
//  SwiftUIView.swift
//  RandomActivityApp
//
//  Created by Gustavo da Silva Braghin on 09/09/21.
//

import SwiftUI

struct SwiftUIView: View {
    
    @State private var isEducationOn = false
    @State private var isRecreationalOn = false
    @State private var isRelaxationOn = false
    @State private var isCharityOn = false
    @State private var isCookingOn = false
    @State private var isMusicOn = false
    @State private var isBusyworkOn = false
    @State private var isDIYOn = false
    @State private var isSocialOn = false
    
    var body: some View{
        let elementPadding: CGFloat = 6
        //self.body.background(Color.black)
        
        VStack{
//            Toggle(isOn: $isEducationOn) {
                Text("📚")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                Text("Education")
//            }
//            .padding(.vertical, elementPadding)
            
            Toggle(isOn: $isRecreationalOn) {
                Text("🎳")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                Text("Recreational")
            }.padding(.vertical, elementPadding)
            
            Toggle(isOn: $isRelaxationOn) {
                Text("🧘‍♀️")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                Text("Relaxation")
            }.padding(.vertical, elementPadding)
            
            Toggle(isOn: $isCharityOn) {
                Text("🤲")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                Text("Charity")
            }.padding(.vertical, elementPadding)
            
            Toggle(isOn: $isCookingOn) {
                Text("🍳")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                Text("Cooking")
            }.padding(.vertical, elementPadding)
            
            Toggle(isOn: $isMusicOn) {
                Text("🎵")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                Text("Music")
            }.padding(.vertical, elementPadding)
            
            Toggle(isOn: $isBusyworkOn) {
                Text("👨‍💻")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                Text("Busywork")
            }.padding(.vertical, elementPadding)
            
            Toggle(isOn: $isDIYOn) {
                Text("🛠")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                Text("DIY")
            }.padding(.vertical, elementPadding)
            
            Toggle(isOn: $isSocialOn) {
                Text("👥")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                Text("Social")
            }.padding(.vertical, elementPadding)
        }
        .background(Color.black)
        .colorScheme(.dark)
        .padding(.horizontal, 5)
    }
}

struct SwiftUIView_Preview: PreviewProvider {
    static var previews: some View{
        SwiftUIView()
    }
}

