//
//  CatsByOwnerGendersView.swift
//  SwiftCats
//
//  Created by Ace Authors on 24/4/21.
//

import SwiftUI

struct CatsByOwnerGendersView: View {
    @State var viewModel = CatsByOwnerGendersViewModel(from: .mockedService)
    let humanGenders = [ "male", "female" ]

    @State private var dataSourceSelector: Int = 0
    @State private var humanOnly = false
    
    init(viewModel: CatsByOwnerGendersViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        
        configurationPanel()
            .padding()
        
        ScrollView {
            ForEach(viewModel.ownerGenders, id: \.self) { gender in
                if (humanOnly) {
                    if humanGenders.contains(gender.lowercased()) {
                        CatsByGenderView(
                            gender: gender,
                            pets: viewModel.ownerGendersAndCats[gender] ?? []
                        )
                    }
                } else {
                    CatsByGenderView(
                        gender: gender,
                        pets: viewModel.ownerGendersAndCats[gender] ?? []
                    )
                }
            }
        }
        .background(Color(UIColor.secondarySystemBackground))
        .onChange(of: dataSourceSelector, perform: { value in
            self.humanOnly = false      // Reset everytime datasource changes
            switch value {
            case 1:
                self.viewModel.datasource = .networkService
            default:
                self.viewModel.datasource = .mockedService
            }
        })
    }
    
    @ViewBuilder
    func configurationPanel() -> some View {
        VStack(alignment: .leading, spacing: 3) {
            HStack {
                Text("Datasource:")
                    .bold()
                    .padding(.leading)
                Spacer()
                Toggle("Human only", isOn: $humanOnly)
                    .font(.subheadline)
                    .scaledToFit()
            }

            Picker("Datasource:", selection: $dataSourceSelector) {
                Text("Local").tag(0)
                Text("Remote").tag(1)
            }
            .pickerStyle(SegmentedPickerStyle())
        }
    }
}

struct CatsByGenderView: View {
    let gender: Gender
    let pets: Pets
    
    var body: some View {
        VStack {
            sectionView(name: gender)
            ForEach(0..<pets.count, id: \.self) { idx in
                petDetailsView(pet: pets[idx])
                Divider()
            }
        }
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .cornerRadius(12)
        .padding()
        .shadow(radius: 12)
    }
    
    @ViewBuilder
    func sectionView(name: String) -> some View {
        HStack(alignment: .firstTextBaseline) {
            Text("Cats owned by ")
                .font(.subheadline)
            Text(name.firstCap)
                .font(.title)
                .bold()
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 8)
        .background(Color(UIColor.systemBlue))
        .foregroundColor(.white)
    }
    
    @ViewBuilder
    func petDetailsView(pet: Pet) -> some View {
        Text(pet.name)
    }
}
