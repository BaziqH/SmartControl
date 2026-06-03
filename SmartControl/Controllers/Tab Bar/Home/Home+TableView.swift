//
/********** Developed by Drudots Technology **********/
/******** https://www.drudotstech.com **********/
//
//MARK: - TABLE VIEW
extension HomeVC: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            return loadMusicTVuCell(indexPath)
        }
        else if indexPath.section == 1{
            return loadQuickRowTVuCell(indexPath)
        }
        else if indexPath.section == 2{
            return loadDevicesRowTVuCell(indexPath)
        }
        return UITableViewCell()
    }
}
//MARK: - LOAD CELLS
extension HomeVC{
    func loadMusicTVuCell(_ indexPath: IndexPath)->UITableViewCell{
        guard let cell = homeTableView.dequeueReusableCell(withIdentifier: "MusicTVuCell", for: indexPath) as? MusicTVuCell else {
            return MusicTVuCell()
        }
        return cell
    }
    func loadQuickRowTVuCell(_ indexPath: IndexPath)->UITableViewCell{
        guard let cell = homeTableView.dequeueReusableCell(withIdentifier: "QuickRowTVuCell", for: indexPath) as? QuickRowTVuCell else {
            return QuickRowTVuCell()
        }
        return cell
    }
    func loadDevicesRowTVuCell(_ indexPath: IndexPath)->UITableViewCell{
        guard let cell = homeTableView.dequeueReusableCell(withIdentifier: "DevicesRowTVuCell", for: indexPath) as? DevicesRowTVuCell else {
            return DevicesRowTVuCell()
        }
        return cell
    }
}
//MARK: - SETUP TABLE VIEW
extension HomeVC{
    
    func setupTableView(){
        homeTableView.delegate = self
        homeTableView.dataSource = self
        
        homeTableView.rowHeight = UITableView.automaticDimension
        homeTableView.estimatedRowHeight = 150
    }
    //MARK: - REGISTER NIBS
    func registerNibs(){
        let musicNib = UINib(nibName: "MusicTVuCell", bundle: nil)
        homeTableView.register(musicNib, forCellReuseIdentifier: "MusicTVuCell")
        
        let quickNib = UINib(nibName: "QuickRowTVuCell", bundle: nil)
        homeTableView.register(quickNib, forCellReuseIdentifier: "QuickRowTVuCell")
        
        let devicesNib = UINib(nibName: "DevicesRowTVuCell", bundle: nil)
        homeTableView.register(devicesNib, forCellReuseIdentifier: "DevicesRowTVuCell")
    }
}
