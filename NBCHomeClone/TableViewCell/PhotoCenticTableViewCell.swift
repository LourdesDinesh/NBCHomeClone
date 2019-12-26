
   import UIKit

   class PhotoCenticTableViewCell: UITableViewCell {
       static let REUSABLE_IDENTIFIER:String = "photocentricTableViewCellReusableIdentifier";
    @IBOutlet weak var collectionViewHeight: NSLayoutConstraint!
    @IBOutlet weak var collectionViewOutlet: UICollectionView!
       private var items:[Items]!
       var isStatusAvailable : Bool!
       var dumlabel : UILabel = UILabel()
       var heightForRow = [Int]()
       var dataCount = 0
       override func awakeFromNib() {
           super.awakeFromNib()

       }

       public func setupValues() {
           dumlabel.frame.size.width = UIScreen.main.bounds.width/2
           heightForRow = findnoLine()
       }
     
   func setValue(value:[Items]) {
            self.items = value
             _ = items.removeFirst()

            isStatusAvailable = checkStatus()
            setupValues()
            self.collectionViewOutlet.dataSource = self
            let layout = collectionViewOutlet.collectionViewLayout as? photocentricLayout
            layout?.delegate = self
            self.collectionViewOutlet.reloadData()
    }
       func checkStatus() -> Bool{
           for data in items{
               if data.shortTimestamp != "" {
                   return true
               }
           }
           return false
       
   }
}
   extension PhotoCenticTableViewCell : UICollectionViewDataSource, UICollectionViewDelegateFlowLayout,UICollectionViewDelegate{


       
       func numberOfSections(in collectionView: UICollectionView) -> Int {
              1
          }
       
       func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
           var count = items.count
           count = count >= 4 ? 4 : count >= 2 ? 2 : 0
           dataCount = count
           return count
       }
       
       func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotocentricCellReusableIdentifier" , for: indexPath) as! PhotoCenticCollectionViewCell
       cell.setValue(value: items[indexPath.row])
       //  cell.statusHeight.constant = isStatusAvailable == true ? cell.statusHeight.constant : 0
        return cell
       }
       
   }

   extension  PhotoCenticTableViewCell {
           func findnoLine() -> [Int]
           {
             var heightForRow = [Int]()
               var lineCount = [Int]()
            for item in items{
                 dumlabel.text = item.title
                   let count = dumlabel.maxNumberOfLines
                   lineCount.append(count)
            }
              let count = lineCount.count
              heightForRow =  count >= 4 ? maxNumber(array: lineCount, rowCount: 2) : maxNumber(array: lineCount, rowCount: 1)
              return heightForRow
           }
       
       public func maxNumber(array:[Int] ,rowCount count:Int) -> [Int] {
              var heightForRow = [Int]()
           if count == 1{
              heightForRow.append(array[count] >= array[count-1] ? array[count] : array[count-1])
           }
           else {
             
               heightForRow.append(array[count-2] >= array[count-1] ? array[count-2] : array[count-1])
               heightForRow.append(array[count] >= array[count+1] ? array[count] : array[count+1])
           }
               return heightForRow
          }
   }

   extension UILabel {
       var maxNumberOfLines: Int {
           let maxSize = CGSize(width: frame.size.width, height: CGFloat(MAXFLOAT))
           let text = (self.text ?? "") as NSString
          let textHeight = text.boundingRect(with: maxSize, options: .usesLineFragmentOrigin, attributes: [.font: font as Any], context: nil).height
           let lineHeight = font.lineHeight
          if (Int(ceil(textHeight / lineHeight))) > 3 {
             return 3
          }
          else{
              return Int(ceil(textHeight / lineHeight))
          }
       }
   }



   extension PhotoCenticTableViewCell : photocentricLayoutDelegate{
   func collectionview(collectionview: UICollectionView, heightAtindexpath indexPath: NSIndexPath) -> CGFloat {
       let cell = collectionview.dequeueReusableCell(withReuseIdentifier: "PhotocentricCellReusableIdentifier" , for:    indexPath as IndexPath) as! PhotoCenticCollectionViewCell

       if dataCount == 4 {
           if (indexPath.row == 0)||(indexPath.row == 1){
            cell.setframes(con: heightForRow[0])
           }else{
            cell.setframes(con: heightForRow[1])
           }
       }
       else {
        cell.setframes(con: heightForRow[0])
       }
     //cell.statusHeight.constant = isStatusAvailable == true ? cell.statusHeight.constant : 0
    collectionViewHeight.constant = 2 * (cell.titleHeight.constant + cell.statusHeight.constant + cell.imageHeight.constant) + 15
       return (cell.titleHeight.constant + cell.statusHeight.constant + cell.imageHeight.constant)

   }
   }

