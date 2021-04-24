//
//  SwiftCatsMocked.swift
//  SwiftCatsTests
//
//  Created by Ace Authors on 23/4/21.
//  Copyright © 2021 Yilei He. All rights reserved.

import Foundation

// CLI: `curl https://agl-developer-test.azurewebsites.net/people.json | npx json`

/// Provide mocked data for testing.
struct TestData {
    static let catsAndOwners = """
[
  {
    "name": "Bob",
    "gender": "Male",
    "age": 23,
    "pets": [
      {
        "name": "Garfield",
        "type": "Cat"
      },
      {
        "name": "Fido",
        "type": "Dog"
      }
    ]
  },
  {
    "name": "Jennifer",
    "gender": "Female",
    "age": 18,
    "pets": [
      {
        "name": "Garfield",
        "type": "Cat"
      }
    ]
  },
  {
    "name": "Steve",
    "gender": "Male",
    "age": 45,
    "pets": null
  },
  {
    "name": "Fred",
    "gender": "Male",
    "age": 40,
    "pets": [
      {
        "name": "Tom",
        "type": "Cat"
      },
      {
        "name": "Max",
        "type": "Cat"
      },
      {
        "name": "Sam",
        "type": "Dog"
      },
      {
        "name": "Jim",
        "type": "Cat"
      }
    ]
  },
  {
    "name": "Samantha",
    "gender": "Female",
    "age": 40,
    "pets": [
      {
        "name": "Tabby",
        "type": "Cat"
      }
    ]
  },
  {
    "name": "Alice",
    "gender": "Female",
    "age": 64,
    "pets": [
      {
        "name": "Simba",
        "type": "Cat"
      },
      {
        "name": "Nemo",
        "type": "Fish"
      }
    ]
  },
  {
    "name": "Huss",
    "gender": "Klingon",
    "age": 200,
    "pets": [
      {
        "name": "Drago-klingo Cat",
        "type": "Cat"
      }
    ]
  },
  {
    "name": "T-800",
    "gender": "Terminator",
    "age": 10,
    "pets": [
      {
        "name": "Robocat",
        "type": "Cat"
      }
    ]
  },
  {
    "name": "T-1800",
    "gender": "Terminator",
    "age": 20,
    "pets": [
      {
        "name": "Robo Pussy Cat",
        "type": "Cat"
      }
    ]
  }
]
"""
}

