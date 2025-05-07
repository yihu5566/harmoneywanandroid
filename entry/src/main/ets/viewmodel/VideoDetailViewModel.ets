import { HomeModelIssueListItemList } from "../model/HomeModel";
import { BaseViewModel, ResultCallback } from "./BaseViewModel";
import { getRelationList } from '../http/apiService';
import { LogUtils } from "../utils/LogUtils";

export class VideoDetailViewModel extends BaseViewModel {
  relationId: number = -1

  async getRelationList(resultCallback?: ResultCallback<HomeModelIssueListItemList[]>) {
    LogUtils.debug("网络--->" + this.relationId)
    await this.httpRequest()
      .promise(getRelationList(this.relationId), true).then((result) => {
        let filterList = result.itemList.filter((item) => item.type == "videoSmallCard")
        resultCallback?.(filterList)
      })
  }
}

let videoDetailViewModel = new VideoDetailViewModel()

export default videoDetailViewModel as VideoDetailViewModel