//
//  ContentView.swift
//  CoreDataRelationship
//
//  Created by Esat Gözcü on 2023/05/12.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var countries: FetchedResults<Country>
    
    var body: some View {
        VStack {
            List{
                ForEach(countries, id: \.self){ country in
                    Section(country.wrappedFullName){
                        ForEach(country.carArray, id: \.self) { candy in
                            Text(candy.wrappedName).onTapGesture {
                                moc.delete(candy)
                                try? moc.save()
                            }
                        }
                    }.onTapGesture {
                        moc.delete(country)
                        try? moc.save()
                    }
                }
            }
            
            Button("ADD"){
                let candy1 = Car(context: moc)
                candy1.name = "Hyundai"
                candy1.origin = Country(context: moc)
                candy1.origin?.shortName = "KR"
                candy1.origin?.fullName = "South Korea"
                
                let candy2 = Car(context: moc)
                candy2.name = "KIA"
                candy2.origin = Country(context: moc)
                candy2.origin?.shortName = "KR"
                candy2.origin?.fullName = "South Korea"
                
                let candy3 = Car(context: moc)
                candy3.name = "Genesis"
                candy3.origin = Country(context: moc)
                candy3.origin?.shortName = "KR"
                candy3.origin?.fullName = "South Korea"
                
                let candy4 = Car(context: moc)
                candy4.name = "Mazda"
                candy4.origin = Country(context: moc)
                candy4.origin?.shortName = "JP"
                candy4.origin?.fullName = "Japan"
                
                try? moc.save()
            }
        }
        .padding()
    }
}
