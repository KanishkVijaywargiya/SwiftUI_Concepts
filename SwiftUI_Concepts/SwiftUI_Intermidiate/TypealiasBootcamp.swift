//
//  TypealiasBootcamp.swift
//  SwiftUI_Concepts
//
//  Created by KANISHK VIJAYWARGIYA on 06/03/22.
//

import SwiftUI

struct MovieModel {
    let title: String
    let director: String
    let count: Int
}

typealias TVModel = MovieModel

struct TypealiasBootcamp: View {
//    @State var item: MovieModel = MovieModel(title: "Title", director: "Joe", count: 5)
    @State var item: TVModel = TVModel(title: "TV Title", director: "Emilly", count: 10)
    
    var body: some View {
        VStack {
            Text(item.title)
            Text(item.director)
            Text("\(item.count)")
        }
    }
}


struct TypealiasBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        TypealiasBootcamp()
    }
}

// Let's pretedn that we had the netflix app & use this movie model all across of our app 100 of times & then all of a sudden we want to add a new feature to our app
// & let's pretend we want to add TV-Shows & these TV-Shows are also going to have the exact same information as the movie model. So the TV-Shows are going to have titles, directors & counts.
// well easiest thing we can do is to create a new struct with a name TV-Model. Well this will work having 2 separate models each for movie & tv-shows.
// but if there were places in our app where we are using func that were based on movie model well then we have to rewrite all those func to be based on TV Model. We couldn't just reuse those funcs. because their types are different.
// & additionally we want to make an edit a movie model then again we have to go in & make an edit to a movie model.

// more efficient way for this... we can use typealias
// It just creating a new name for an existing type. This is more handy in a larger apps.
