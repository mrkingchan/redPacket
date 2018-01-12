//
//  CollectionVC.swift
//  redPacket
//
//  Created by Chan on 2018/1/3.
//  Copyright © 2018年 Chan. All rights reserved.
//

import UIKit
import Foundation

class CollectionVC: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    var collectionView:UICollectionView?;
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = NSStringFromClass(self.classForCoder);
        self.view.backgroundColor = UIColor.white;
        self.setUI();
    }
    func setUI() -> Void {
        let layout = UICollectionViewFlowLayout.init();
        layout.itemSize = CGSize.init(width: (UIScreen.main.bounds.size.width - 10)/3.0, height: (UIScreen.main.bounds.size.width - 10)/3.0);
        layout.minimumLineSpacing = 5.0;
        layout.minimumInteritemSpacing = 5.0;
        self.collectionView = UICollectionView.init(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height), collectionViewLayout: layout);
        self.collectionView?.delegate = self;
        self.collectionView?.dataSource = self;
        self.collectionView?.register(UICollectionViewCell.classForCoder(), forCellWithReuseIdentifier: "cell");
        self.view.addSubview(self.collectionView!);
    }
    
    // MARK: UICollectionviewDataSource&Delegate
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100;
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:UICollectionViewCell?;
        cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath);
        cell?.backgroundColor = UIColor.orange;
        return cell!;
    }
}
