//
//  ViewController.swift
//  Compositional-Layout
//
//  Created by Maitree Bain on 8/17/20.
//  Copyright © 2020 Maitree Bain. All rights reserved.
//

import UIKit

class GridViewController: UIViewController {

    @IBOutlet var collectionView: UICollectionView!
    
    private var dataSource: UICollectionViewDiffableDataSource<Section, Int>!
    
    //setup enum to hold sections
    enum Section: Hashable {
        case main
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureCV()
        configureDatasource()
    }
    
    private func configureCV() {
        //if cv was done programmatically
//        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createLayout())
        
        //change layout
        collectionView.collectionViewLayout = createLayout()
        collectionView.backgroundColor = #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)
    }
    
    private func createLayout() -> UICollectionViewCompositionalLayout {
        
        //1
        // create and configure the item
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.25), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8)
        
        //create anc configure group
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(0.25))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
//        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 10)
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8)
        
        let section = NSCollectionLayoutSection(group: group)
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        
        return layout
    }

    private func configureDatasource() {
        dataSource = UICollectionViewDiffableDataSource<Section, Int>(collectionView: collectionView, cellProvider: { (collectionView, indexPath, val) -> UICollectionViewCell? in
            
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "labelCell", for: indexPath) as? LabelCell else {
                fatalError("could not dequeue LabelCell")
            }
            cell.backgroundColor = .systemYellow
            cell.textLabel.text = "\(val)"
            return cell
        })
        
        
         var snapshot = NSDiffableDataSourceSnapshot<Section, Int>()
        snapshot.appendSections([.main])
        snapshot.appendItems(Array(1...100))
        dataSource.apply(snapshot)
    }
    

}

