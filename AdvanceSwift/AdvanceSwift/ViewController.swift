//
//  ViewController.swift
//  AdvanceSwift
//
//  Created by Đặng Khánh  on 5/25/20.
//  Copyright © 2020 Đặng Khánh . All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    
    var arrayPokemon = [UIImage(named:"1"),
                        UIImage(named:"2"),
                        UIImage(named:"3"),
                        UIImage(named:"8"),
                        UIImage(named:"5"),
                        UIImage(named:"7"),
                        UIImage(named:"9")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        collectionView.collectionViewLayout = flowLayout
        registerCell()
    }
    
    func registerCell() {
        collectionView.register(UINib(nibName: MainIdentifier.collectionViewCell, bundle: nil), forCellWithReuseIdentifier: MainIdentifier.collectionViewCell)
    }
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayPokemon.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let item = collectionView.dequeueReusableCell(withReuseIdentifier: MainIdentifier.collectionViewCell, for: indexPath) as? CollectionViewCell else {return UICollectionViewCell()}
        item.back.image = arrayPokemon[indexPath.item]
        return item
    }
    
    
    
   
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
           CGSize(width: 50, height: 80)
       }
}
