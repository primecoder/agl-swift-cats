//
//  CatsAndOwnersCombineService.swift
//  SwiftCats
//
//  Created by Ace Authors on 25/4/21.

import Foundation
import Combine


class CatsAndOwnersCombineService: ObservableObject {
    let apiEndpoint: String = "https://agl-developer-test.azurewebsites.net/people.json"    // TODO: refactor this
    
    @Published var owners: Owners = []
    
    private var fetchCancellable: AnyCancellable? = nil
    
    var opQueue: DispatchQueue
    
    init(on queue: DispatchQueue = DispatchQueue.main) {
        opQueue = queue
        refetchData()
    }
    
    func refetchData() {
        guard let url = URL(string: apiEndpoint) else {
            print("ERROR> invalid api endpoint")
            return
        }
        let urlRequest = URLRequest(url: url, timeoutInterval: TimeInterval(5))
        fetchCancellable = URLSession.shared
            .dataTaskPublisher(for: urlRequest)
            .map { $0.data }
            .receive(on: opQueue)
            .decode(type: Owners.self, decoder: JSONDecoder())
            .sink { result in
                switch result {
                case .failure:
                    print("DEBUG > combine service error")
                    self.owners = []
                case .finished:
                    self.fetchCancellable?.cancel()
                }
            } receiveValue: { self.owners = $0 }
    }
}
