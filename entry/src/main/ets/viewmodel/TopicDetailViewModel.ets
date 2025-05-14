import { getFocusData, getTopicData, getTopicDetailList } from '../http/apiService';
import { FocusModelItemList } from '../model/FocusModel';
import { TopicDetailModel } from '../model/TopicDetailModel';
import { TopicModelItemList } from '../model/TopicModel';
import { BaseViewModel, ResultCallback } from './BaseViewModel';

export class TopicDetailViewModel extends BaseViewModel {
  topicId: number = -1

  async getTopicDetailList(resultCallback: ResultCallback<TopicDetailModel>) {
    await this.httpRequest()
      .promise(getTopicDetailList(this.topicId), true)
      .then((result) => {
        resultCallback(result)
      })
  }
}

let topicDetailViewModel = new TopicDetailViewModel()

export default topicDetailViewModel as TopicDetailViewModel