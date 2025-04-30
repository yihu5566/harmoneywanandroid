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
        let list = items.filter((item) => item.type == "video")
        if (this.date == "") {
          let bannerList: HomeModelIssueListItemList[]
          let bannerBean: HomeModelIssueListItemList = {}
          bannerList = items.filter((item) => item.type == "banner2")
          if (bannerList.length > 0) {
            bannerBean = { bannerList: bannerList, type: "banner" }
            list.unshift(bannerBean)
          }
        }
        resultCallback?.(list)
        this.spliteDate(result.nextPageUrl)
      })
  }

  private spliteDate(nextUrl: string) {
    let split = nextUrl.split("?");
    let split2 = split[1];
    let split3 = split2.split("&");
    let split4 = split3[0].split("=");
    this.date = split4[1]
  }
}

let homeViewModel = new HomeViewModel()

export default homeViewModel as HomeViewModel