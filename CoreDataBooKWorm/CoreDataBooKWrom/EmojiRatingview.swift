//
//  EmojiRatingview.swift
//  CoreDataBooKWrom
//
//  Created by Dip Dutt on 7/5/23.
//

import SwiftUI

struct EmojiRatingview: View {
    let Rating:Int16
    
    var body: some View {
        switch Rating {
        case 1:
            Text("🙄")
        case 2:
            Text("😓")
        case 3:
            Text("😐")
        case 4:
            Text("🙂")
        default:
            Text("🤩")
        }
    }
}

struct EmojiRatingview_Previews: PreviewProvider {
    static var previews: some View {
        EmojiRatingview(Rating: 3)
    }
}
