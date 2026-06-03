//
/********** Developed by Drudots Technology **********/
/******** https://www.drudotstech.com **********/
//

class DevicesRowTVuCell: UITableViewCell {
//MARK: - OUTLETS
    @IBOutlet weak var deviceCollectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCollectionView()
        registerNibs()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    //MARK: - Auto height function
    override func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize {
        self.contentView.frame = self.bounds
        self.layoutIfNeeded()
        var size = self.deviceCollectionView.contentSize
        size.height += 35
        return size
        }
}
//MARK: - COLLECTION VIEW
extension DevicesRowTVuCell: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        loadDeviceCVuCell(indexPath)
    }
}
//MARK: - COLLECTION VIEW FLOW LAYOUT
extension DevicesRowTVuCell: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width, height: 96)
    }
}
//MARK: - LOAD CELSS
extension DevicesRowTVuCell{
    func loadDeviceCVuCell(_ indexPath: IndexPath)->UICollectionViewCell{
        guard let cell = deviceCollectionView.dequeueReusableCell(withReuseIdentifier: "DeviceCVuCell", for: indexPath) as? DeviceCVuCell else { return DeviceCVuCell()
        }
        return cell
    }
}
//MARK: - SETUP COLLECTION VIEW
extension DevicesRowTVuCell{
    func setupCollectionView(){
        deviceCollectionView.delegate = self
        deviceCollectionView.dataSource = self
    }
    func registerNibs(){
        let deviceNib = UINib(nibName: "DeviceCVuCell", bundle: nil)
        deviceCollectionView.register(deviceNib, forCellWithReuseIdentifier: "DeviceCVuCell")
    }
}

