//
//  ContentView.swift
//  HorizontalScrollingItems
//
//  Created by Tan, Lawrence on 14/5/20.
//  Copyright © 2020 Tan, Lawrence. All rights reserved.
//

import SwiftUI

struct Item: Identifiable {
    var id: Int
    var title: String
    var price: Double
    var description: String
    var onSale: Bool
}

struct CardView: View {
    
    var title: String
    var description: String
    var price: Double
    var isOnSale: Bool
    
    private let cardHeight: CGFloat = 300.0
    private let cardWidth: CGFloat = 200.0
        
    var body: some View {
        VStack(alignment: .leading) {
            
            Spacer()
            
            HStack {
                Spacer()
                Text(title).font(Font.system(.headline))
                Spacer()
            }
            
            Spacer()
            
            Image(title.lowercased()).resizable().aspectRatio(contentMode: .fit).frame(width: cardWidth, height: cardWidth / 2, alignment: .center)
            
            Spacer()
                            
            Text(description).multilineTextAlignment(.leading)
                .lineLimit(2)
                .frame(height: 50.0, alignment: .top)
                .foregroundColor(Color.black)
                .padding(.horizontal, 14.0)
            
            Spacer()
            
            Rectangle().frame(height: 1.0).foregroundColor(Color.gray)
            
            VStack(alignment: .leading) {
                Text("$\(String(format:"%.02f", price))")
                    .foregroundColor(Color.black)
                Text(isOnSale ? "On Sale" : "")
                    .foregroundColor(Color.green)
                    .padding(.top, 5.0)
            }
            .padding(EdgeInsets(top: 10.4, leading: 14.0, bottom: 15.3, trailing: .zero))
        }
        .frame(width: cardWidth, height: cardHeight)
        .cornerRadius(4.0)
        .background(Color.white)
        .border(Color.gray, width: 1.0)
    }
    
}


struct ContentView: View {
    
    let itemsForSale = [
        Item(id: 1, title: "Mask", price: 5.0, description: "A mask is an object normally worn on the face, typically for protection, disguise, performance, or entertainment. ... They are usually worn on the face, although they may also be positioned for effect elsewhere on the wearer's body", onSale: true),
        Item(id: 2, title: "Sanitizer", price: 15.0, description: "Hand sanitiser, hand antiseptic, hand disinfectant, hand rub, handrub. Hand sanitizer is a liquid, gel, or foam generally used to decrease infectious agents on the hands.", onSale: false),
        Item(id: 3, title: "Vitamin", price: 25.0, description: "Vitamins are nutrients your body needs to develop and function properly. There are 13 essential vitamins: A, D, E, and K, which are fat-soluble, and vitamins C and the B-complex group, which are water-soluble. Each vitamin has a distinct role in keeping you healthy.", onSale: false),
    ]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 25.0) {
                ForEach(itemsForSale) { item in
                    CardView(title: item.title, description: item.description, price: item.price, isOnSale: item.onSale)
                }
            }
        }
        .background(Color.white)
        .padding(14.0)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
