import { getHomeListAxios } from "../http/apiService";
import { HomeModelIssueListItemList } from "../model/HomeModel";
import { BaseViewModel, ResultCallback } from "./BaseViewModel";

class HomeViewModel extends BaseViewModel {
  private date: string = ""

  revertDate() {
    this.date = ""
  }

  getDate() {
    return this.date
  }

  async getHomeList(resultCallback?: ResultCallback<HomeModelIssueListItemList[]>) {
    await this.httpRequest().promise(getHomeListAxios(this.date), this.date == "" ? true : false)
      .then(result => {
        let items = result.issueList[0].itemList
      })
  }
}

let homeViewModel = new HomeViewModel()

export default homeViewModel as HomeViewModel