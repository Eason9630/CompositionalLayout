import UIKit

class ViewController: UIViewController, UICollectionViewDataSource {
    
    // 創建一個 UICollectionView，使用 ViewController.createLayout() 作為佈局
    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: ViewController.createLayout())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 添加 UICollectionView 到視圖中
        view.addSubview(collectionView)
        // 註冊自定義的集合視圖單元格類型
        collectionView.register(MyCollectionViewCell.self, forCellWithReuseIdentifier: MyCollectionViewCell.identifier)
        // 設定 UICollectionView 的框架為視圖的整個邊界
        collectionView.frame = view.bounds
        // 設定 UICollectionView 的背景顏色為白色
        collectionView.backgroundColor = .white
        // 設定 UICollectionView 的數據源為自身
        collectionView.dataSource = self
    }
    
    // 靜態方法，用於創建 UICollectionView 的佈局
    static func createLayout() -> UICollectionViewCompositionalLayout {
        // 創建單元項 Item
        let item = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(2/3),
                heightDimension: .fractionalHeight(1)
            )
        )
        
        // 設定單元項的內容間距
        item.contentInsets = NSDirectionalEdgeInsets(
            top: 2, leading: 2, bottom: 2, trailing: 2
        )
        
        // 創建垂直堆疊項 Vertical Stack Item
        let verticalStackItem = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalHeight(1/3)
            )
        )
        
        // 設定垂直堆疊項的內容間距
        verticalStackItem.contentInsets = NSDirectionalEdgeInsets(
            top: 2, leading: 2, bottom: 2, trailing: 2
        )
        
        // 創建垂直堆疊群組 Vertical Stack Group
        let verticalStackGroup = NSCollectionLayoutGroup.vertical(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1/3),
                heightDimension: .fractionalHeight(1)
            ),
            subitem: verticalStackItem,
            count: 2
        )
        
        
        // 創建三個項目的群組 Triplet Item
        let tripletItem = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalWidth(1)
            )
        )
        
        // 設定三個項目的內容間距
        tripletItem.contentInsets = NSDirectionalEdgeInsets(
            top: 2, leading: 2, bottom: 2, trailing: 2
        )
        
        // 創建水平堆疊群組 Triplet Horizontal Group
        let tripletHorizontalGroup = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .fractionalWidth(0.3)
            ),
            subitem: tripletItem,
            count: 3
        )
    
        // 創建水平群組 Horizontal Group
        let horizontalGroup = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .fractionalWidth(0.7)
            ),
            subitems: [
                item,
                verticalStackGroup
            ])
        
        // 創建垂直群組 Vertical Group
        let verticalGroup = NSCollectionLayoutGroup.vertical(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .fractionalHeight(1.0)
            ),
            subitems: [
                horizontalGroup,
                tripletHorizontalGroup
        ])
        
        // 創建章節 Section
        let section = NSCollectionLayoutSection(group: verticalGroup)
        
        // 返回創建的佈局
        return UICollectionViewCompositionalLayout(section: section)
    }
    
    // 實現 UICollectionViewDataSource 的方法，返回單元格數量
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    
    // 實現 UICollectionViewDataSource 的方法，返回單元格的內容
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // 從重用佇列中取出單元格
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyCollectionViewCell.identifier, for: indexPath)
        
        return cell
    }
}
