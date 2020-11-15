//
//  ContentView.swift
//  turrburrturr
//
//  Created by Jace Sparks on 11/14/20.
//
//
//  HomeView.swift
//  Astros Shame Button
//
//  Created by Jace Sparks on 3/8/20.
//  Copyright © 2020 Jace Sparks. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
 
    var body: some View {
        
     
        ZStack {
//            Image("asteriskAstros").resizable().aspectRatio(contentMode: .fit).opacity(0.2)
            ScrollView(.horizontal, showsIndicators: false)  {
            
                HStack (spacing: 0) {
                    ForEach(sectionData) { item in
                        GeometryReader { geometry in
                            SoundCard(card: item).rotation3DEffect(Angle(degrees:
                                Double(geometry.frame(in: .global).minX - 30) / -20
                            ), axis: (x: 0, y: 10.0, z: 0))
                            .onTapGesture {
                                playSound(sound: item.cardSound, type: item.cardSoundType)
                                
                                                    }
                        }.frame(width: screen.width * 0.8, height: screen.height * 0.5)
                    
                        }
                    
                   
                    .padding(.horizontal, 10)
                    .padding(.bottom,50)
                    .padding(.top, 10)
                }
            }
        }
        
    //.background(Color(#colorLiteral(red: 0.9215686275, green: 0.431372549, blue: 0.1215686275, alpha: 1)))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct SoundCard: View {
       var card: Card
    var body: some View {
        VStack {
            ZStack{
                Image(card.image).resizable().aspectRatio(contentMode: .fill)
              
                VStack {
                    Spacer()
                    ZStack {
                        VStack(spacing: 0) {
                         
                            Rectangle().frame(width: screen.width, height: 2).foregroundColor(Color(#colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)))
                            Rectangle().frame(width: screen.width, height: 70).foregroundColor(Color(#colorLiteral(red: 0.1697643252, green: 0.1828692061, blue: 0.2025639373, alpha: 1)))
                        }
                        HStack {
                            Text(card.title)
                                    .font(.system(size: 24, weight: .bold))
                                .foregroundColor(.white)
                            Image(systemName: "play.circle.fill").foregroundColor(.white).font(.system(size: 20, design: .default)).padding()
                            
                        }
                       
                    }
                }
                    Spacer()
                }
                
                
            
            
            
        }
            
        .frame(width: screen.width * 0.8)
        .frame(height: screen.height * 0.5)
        .background(Color(.blue))
        .cornerRadius(10)
        .shadow(color: Color(.black).opacity(0.3), radius: 20, x: 0, y: 20)
    }
}


struct Card: Identifiable {
    var id = UUID()
    var image: String
    var title: String
    var cardSound: String
    var cardSoundType: String
}


let sectionData = [

    Card(image: "justine", title: "turrburrturr", cardSound: "turrburrturr", cardSoundType: "m4a"),
    Card(image: "justine", title: "Boo", cardSound: "boo", cardSoundType: "mp3")
    
]


let screen = UIScreen.main.bounds
