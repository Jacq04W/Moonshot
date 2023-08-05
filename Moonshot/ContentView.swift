//
//  ContentView.swift
//  Moonshot
//
//  Created by Jacquese Whitson on 8/4/23.
//

import SwiftUI




struct ContentView: View {
    // this is the same for using  a firestore query but for my JSon Data
    // We have to specify the types of data were retrieveing because when we used the decodera we used a generic type 'T' so we have to specify here
    let astronauts: [String:Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    let columns = [ GridItem(.adaptive(minimum: 150,maximum: 150))]


    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(missions) { mission in
                        NavigationLink {
                            Text("Detail view")
                        } label: {
                            VStack {
                                Image(mission.image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 100)
                                
                                VStack {
                                    Text(mission.displayName)
                                        .font(.headline)
                    Text(mission.formattedLaunchDate)

                                }
                                .frame(maxWidth: .infinity)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Moonshot")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
