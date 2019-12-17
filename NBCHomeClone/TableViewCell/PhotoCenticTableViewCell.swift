
   import UIKit

   class PhotoCenticTableViewCell: UITableViewCell {
       static let REUSABLE_IDENTIFIER:String = "photocentricTableViewCellReusableIdentifier";
       @IBOutlet weak var collectionViewOutlet: UICollectionView!
    //   var titleArray = [String]()
       private var items:[Items]!
       var isStatusAvailable : Bool!
       var dumlabel : UILabel = UILabel()
       var maxNumberOfLines:Int!
       var heightForRow = [Int]()
       var dataCount = 0
       override func awakeFromNib() {
           super.awakeFromNib()

       }

       public func setupValues() {
            
           setupDummyLabel()
           heightForRow = findnoLine()
           heightForRow = findHeightForRow(heightArray: heightForRow)
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
       func setupDummyLabel() {
           dumlabel.frame.size.width = UIScreen.main.bounds.width/2
       }
       
           func findnoLine() -> [Int]
           {
               var lineData1 = [Int]()
            for item in items{
                let data1 = item.title
                   dumlabel.text = data1
                   let count = dumlabel.maxNumberOfLines
                   lineData1.append(count)
            }
               return lineData1
           }

         func findHeightForRow(heightArray : [Int] ) ->[Int] {
             var heightForRow = [Int]()
             let count = heightArray.count
             heightForRow =  count >= 4 ? maxNumber(array: heightArray, count: 2) : maxNumber(array: heightArray, count: 1)
            print("@.....\(heightForRow)")
             return heightForRow
         }
       
       public func maxNumber(array:[Int] ,count:Int) -> [Int] {
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
       return (cell.titleHeight.constant + cell.statusHeight.constant + cell.imageHeight.constant)

   }
   }

