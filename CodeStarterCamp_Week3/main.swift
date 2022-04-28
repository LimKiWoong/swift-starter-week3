//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// MARK: - STEP1

class Person {
    var name: String = ""
    var buget: Int?
    
    init(name: String) {
        self.name = name
    }
}

class Customer: Person {
    func buyDrink(at coffeeShop: CoffeeShop, which menuName: String) {
        guard let menu = coffeeShop.menuList[menuName] else { return }
        guard var buget = self.buget else { return }
        
        switch menu {
        case .americano(let price, _), .vanillaLatte(let price, _), .latte(let price, _), .einspanner(let price, _):
            if buget >= price {
                let coffeeShop = coffeeShop
                coffeeShop.order(menu, who: self)
                buget -= price
                self.buget = buget
            } else {
                print("잔액이 \(price)원만큼 부족합니다")
            }
        }
    }
}

enum Coffee {
    case americano(price: Int, kr: String)
    case latte(price: Int, kr: String)
    case vanillaLatte(price: Int, kr: String)
    case einspanner(price: Int, kr: String)
}


class CoffeeShop {
    var revenue: Int?
    var barista: Person?
    var pickUpTable: Array<String?> = []
    var menuList: Dictionary<String, Coffee> = [
        "Americano": .americano(price: 3500, kr :"아메리카노"),
        "Einspanner": .einspanner(price: 5500, kr: "아인슈페너"),
        "Latte": .latte(price: 4000, kr: "라떼"),
        "Vanilla Latte" : .vanillaLatte(price: 4500, kr: "바닐라 라떼")
    ]
    
    func order(_ coffee: Coffee, who order: Person) {
        guard var revenue = self.revenue else { return }
        
        switch coffee {
        case .americano(let price, let kr), .vanillaLatte(let price, let kr), .latte(let price, let kr), .einspanner(let price, let kr):
            revenue += price
            self.revenue = revenue
        }
    }
    
    func makeCoffee() { }
}
