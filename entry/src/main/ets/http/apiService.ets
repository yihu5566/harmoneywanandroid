import { AxiosHeaders } from "@ohos/axios"
import { FocusModel } from "../model/FocusModel"
import { HomeModel } from "../model/HomeModel"
import axiosClient from "./AxiosRequest"

let baseUrl = "https://baobab.kaiyanapp.com/"
let wanAndroidUrl = "https://www.wanandroid.com/"
const commonHeader: AxiosHeaders = new AxiosHeaders()

/**
 * 请求首页数据-axios客户端请求
 * @param date
 * @returns
 */
export function getHomeListAxios(date: string = "") {
  return axiosClient.get<HomeModel>({
    url: baseUrl + "api/v2/feed",
    params: { "date": date },
    showLoading: true,
    headers: commonHeader
  })
}

export function getRelationList(id: number) {
  return axiosClient.get<HomeModel>({
    url: baseUrl + "api/v4/video/related",
    params: { "id": id },
    headers: commonHeader
  })
}

/**
 * 获取关注接口
 */
export function getFocusData(pageIndex: number = 0) {
  return axiosClient.get<FocusModel>(
    {
      url: baseUrl + "api/v4/tabs/follow",
      params: { "start": pageIndex },
      headers: commonHeader
    }
  )
}
