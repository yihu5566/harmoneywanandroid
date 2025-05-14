import { getCategoryDetailList } from "../http/apiService";
import { HomeModelIssueListItemList } from "../model/HomeModel";
import { BaseViewModel, ResultCallback } from "./BaseViewModel";

class CategoryDetailViewModel extends BaseViewModel {
  id: number = -1
  pageIndex: number = 0

  async getCategoryDetailList(resultCallback?: ResultCallback<HomeModelIssueListItemList[]>) {
    await this.httpRequest()
      .promise(getCategoryDetailList(this.id, this.pageIndex), true)
      .then(result => {
        resultCallback?.(result.itemList)
        this.pageIndex++
      })
  }
}

let categoryDetailViewModel = new CategoryDetailViewModel()

export default categoryDetailViewModel as CategoryDetailViewModel


