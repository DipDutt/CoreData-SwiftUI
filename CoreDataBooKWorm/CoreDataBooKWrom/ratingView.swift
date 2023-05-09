//
//  ratingView.swift
//  CoreDataBooKWrom
//
//  Created by Dip Dutt on 7/5/23.
//

import SwiftUI

struct ratingView: View {
    @Binding var Rating:Int
    
   
    var maxRating:Int = 5
    
    var offImage:Image?
    var onImage = Image(systemName: "star.fill")
    
    var offColor = Color.gray
    var onColor = Color.yellow
    var body: some View {
        HStack {
        ForEach(1..<maxRating + 1, id: \.self ) { number in
                image(for: number)
                    .foregroundColor(number > Rating ? offColor: onColor)
                    .onTapGesture {
                        Rating = number
                    }
                
            }
            
            
        }
    }
    
    func image(for number:Int)->Image {
        if number > Rating {
            return offImage ?? onImage
        } else {
            return onImage
        }
    }
    
}
    


struct ratingView_Previews: PreviewProvider {
    static var previews: some View {
        ratingView(Rating: .constant(4))
    }
}
