//
/********** Developed by Drudots Technology **********/
/******** https://www.drudotstech.com **********/

class QuickRowTVuCell: UITableViewCell {
//MARK: - OUTLETS
    @IBOutlet weak var quickctrlCollectionVIew: UICollectionView!
    
    //MARK: - VARIABLE
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCollectionView()
        registerNibs()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
//MARK: - COLLECTION VIEW
extension QuickRowTVuCell: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        loadQuickControlCVuCell(indexPath)
    }
}
//MARK: - COLLECTION VIEW FLOW LAYOUT
extension QuickRowTVuCell: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width/2 - 5, height: collectionView.frame.height)
    }
}
//MARK: - LOAD CELSS
extension QuickRowTVuCell{
    func loadQuickControlCVuCell(_ indexPath: IndexPath)->UICollectionViewCell{
        guard let cell = quickctrlCollectionVIew.dequeueReusableCell(withReuseIdentifier: "QuickControlCVuCell", for: indexPath) as? QuickControlCVuCell else { return QuickControlCVuCell()
        }
        return cell
    }
}
//MARK: - SETUP COLLECTION VIEW
extension QuickRowTVuCell{
    func setupCollectionView(){
        quickctrlCollectionVIew.delegate = self
        quickctrlCollectionVIew.dataSource = self
    }
    func registerNibs(){
        let quickControlNib = UINib(nibName: "QuickControlCVuCell", bundle: nil)
        quickctrlCollectionVIew.register(quickControlNib, forCellWithReuseIdentifier: "QuickControlCVuCell")
    }
}

