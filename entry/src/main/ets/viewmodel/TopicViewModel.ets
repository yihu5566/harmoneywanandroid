import { getFocusData, getTopicData } from '../http/apiService';
import { FocusModelItemList } from '../model/FocusModel';
import { TopicModelItemList } from '../model/TopicModel';
import { BaseViewModel, ResultCallback } from './BaseViewModel';

export class TopicViewModel extends BaseViewModel {
  pageIndex: number = 0

  async getTopicData(resultCallback: ResultCallback<TopicModelItemList[]>) {
    await this.httpRequest()
      .promise(getTopicData(this.pageIndex), this.pageIndex == 0 ? true : false)
      .then((result) => {
        resultCallback(result.itemList)
        this.pageIndex += result.count
      })
  }
}

let topicViewModel = new TopicViewModel()

export default topicViewModel as TopicViewModel