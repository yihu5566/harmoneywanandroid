import { getHomeListAxios } from '../http/apiService';
import useRequestStatus from '../http/useRequestStatus';
import { TabItem } from '../model/TabItem';
import { CommonType } from '../model/typeAlias/TypeAlias';
import { LogUtils } from '../utils/LogUtils';


export class FindViewModel {
  tabTitle: Array<TabItem> = [
    {
      index: 0,
      title: "关注",
    },
    {
      index: 1,
      title: "分类",
    },
    {
      index: 2,
      title: "主题",
    },

  ]

  /**
   * 获取首页接口数据
   * @param callback
   * @returns
   */
  async getDataList(callback?: (state: string) => void) {
    return await useRequestStatus((state) => {
      callback?.(state)
    }).promise?.(getHomeListAxios(""))
      .then((res) => {
        LogUtils.debug("error>>>>>" + res)
        LogUtils.debug("HomeTag", "error>>>>>" + res)
      }).catch((e: CommonType) => {
        LogUtils.debug("error>>>>>" + e)
      })
  }
}


let findViewModel = new FindViewModel();

export default findViewModel as FindViewModel;