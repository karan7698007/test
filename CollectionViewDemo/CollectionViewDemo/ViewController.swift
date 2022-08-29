//
//  ViewController.swift
//  CollectionViewDemo
//
//  Created by Karan Sarvaiya on 29/08/22.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var mainCollectionVw: UICollectionView!
    
    var arrMainData = [
        MainData(isCollectionSelected: false, arrTblContent: [InnerTableData(isSelected: false)]),
        MainData(isCollectionSelected: false, arrTblContent: [InnerTableData(isSelected: false)]),
        MainData(isCollectionSelected: false, arrTblContent: [InnerTableData(isSelected: false)]),
        MainData(isCollectionSelected: false, arrTblContent: [InnerTableData(isSelected: false),InnerTableData(isSelected: false)]),
        MainData(isCollectionSelected: false, arrTblContent: [InnerTableData(isSelected: false)])
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


}

extension ViewController : UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrMainData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainCollectionCell", for: indexPath) as? MainCollectionCell else {
            return UICollectionViewCell()
        }
        cell.mainCellData = arrMainData[indexPath.row]
        cell.collectionIndex = indexPath.item
        cell.tblView.dataSource = cell
        cell.tblView.delegate = cell
        cell.delegate = self
        cell.tblView.reloadData()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width / 2 - 10, height: collectionView.frame.size.width / 2 - 10)
    }
    
}

extension ViewController : MainCollectionCellDelegate {
    func didTapAtNestedTableIndex(collectionIndex: Int, tableIndex: Int) {
        if var arrTbl = self.arrMainData[collectionIndex].arrTblContent {
            arrTbl[tableIndex].isSelected = !arrTbl[tableIndex].isSelected
            arrMainData[collectionIndex].isCollectionSelected = arrTbl[tableIndex].isSelected
            arrMainData[collectionIndex].arrTblContent = arrTbl
        }
        mainCollectionVw.reloadData()
    }
}


struct MainData {
    var isCollectionSelected:Bool
    var arrTblContent:[InnerTableData]?
}
struct InnerTableData {
    var isSelected : Bool
}
		
