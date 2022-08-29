//
//  MainCollectionCell.swift
//  CollectionViewDemo
//
//  Created by Karan Sarvaiya on 29/08/22.
//

import UIKit

protocol MainCollectionCellDelegate {
    func didTapAtNestedTableIndex(collectionIndex:Int,tableIndex:Int)
}

class MainCollectionCell: UICollectionViewCell {
    
    var collectionIndex = 0
    var delegate:MainCollectionCellDelegate?
    var mainCellData:MainData?
    
    @IBOutlet weak var tblView: UITableView!
    
}

extension MainCollectionCell : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mainCellData?.arrTblContent?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "NestedTblCell", for: indexPath) as? NestedTblCell else { return UITableViewCell()}
        cell.lblTxt.text = "index-\(indexPath.row)"
        cell.backgroundColor = (mainCellData?.arrTblContent?[indexPath.row].isSelected ?? false) ? .red : .white
        self.contentView.backgroundColor = (mainCellData?.arrTblContent?[indexPath.row].isSelected ?? false) ? .blue : .white
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("collectionIndex => \(collectionIndex) tableIndex => \(indexPath.row)")
        self.delegate?.didTapAtNestedTableIndex(collectionIndex: collectionIndex, tableIndex: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
}
