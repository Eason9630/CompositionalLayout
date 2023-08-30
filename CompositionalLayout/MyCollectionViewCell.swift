import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    // 定義一個靜態屬性，用於識別集合視圖的重用單元格
    static let identifier = "MyCollectionViewCell"
    
    // 創建一個私有的 UIImageView，用於顯示圖像
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    // 覆寫初始化方法，設定集合視圖的單元格內容
    override init(frame: CGRect) {
        super.init(frame: frame)
        // 將 imageView 添加到 contentView 中
        contentView.addSubview(imageView)
        
        // 定義一個包含圖像的陣列
        let images: [UIImage] = [
            UIImage(named: "pic1"),
            UIImage(named: "pic2"),
            UIImage(named: "pic3"),
            UIImage(named: "pic4")
        ].compactMap({ $0 }) // 使用 compactMap 來過濾掉可能為 nil 的圖像
        
        // 在 imageView 中顯示隨機選擇的圖像
        imageView.image = images.randomElement()
        
        // 設定 contentView 的屬性，使其內容不超出邊界
        contentView.clipsToBounds = true
    }
    
    // 覆寫必要的初始化方法，標記為未實作，因為我們不打算使用這個初始化方法
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // 覆寫 layoutSubviews 方法，調整子視圖的佈局
    override func layoutSubviews() {
        super.layoutSubviews()
        // 設定 imageView 的框架為 contentView 的框架
        imageView.frame = contentView.bounds
    }
}
