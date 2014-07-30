//
//  ViewController.swift
//
//  Created by ToKoRo on 2014-07-30.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel?

    override func viewDidLoad() {
        super.viewDidLoad()

        self.executeSample()
    }

    private func executeSample() {

        func add(a: Int, b: Int, c: Int) -> Int {
            return a + b + c
        }

        let add1 = partial(add, 1)
        let add1_2_3 = add1(2, 3)
        println("add1_2_3 = \(add1_2_3)");

        let add1and2 = partial(add, 1, 2)
        let add1and2_3 = add1and2(3)
        println("add1and2_3 = \(add1and2_3)");

        self.label!.text = String(add1and2_3)
    }

}
