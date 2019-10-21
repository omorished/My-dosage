
import UIKit


class CategoryUIButton: UIButton {
    
    override func awakeFromNib(){
        super.awakeFromNib()
        
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOffset = CGSize(width: 5, height: 5)
        layer.shadowRadius = 5
        layer.shadowOpacity = 1.0
        
    }
    
}
